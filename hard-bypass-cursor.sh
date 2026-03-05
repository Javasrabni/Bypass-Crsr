#!/bin/bash
# cursor-safe-sandbox.sh
# Deep Bypass dengan Auto-Recovery - FIXED VERSION

# JANGAN pakai set -e karena akan exit saat command gagal
# set -e

# ============================================================================
# CONFIGURATION & SAFETY CHECKS
# ============================================================================

SCRIPT_NAME=$(basename "$0")
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STATE_DIR="$SCRIPT_DIR/.cursor-sandbox-state-$(date +%s)"
PID_FILE="$STATE_DIR/sandbox.pid"

echo "Script: $SCRIPT_NAME"
echo "PID: $$"
echo ""

# ============================================================================
# SAFER CLEANUP FUNCTION
# ============================================================================

safe_cleanup() {
    local exit_code=$?
    echo ""
    echo "=========================================="
    echo "  CLEANUP TRIGGERED (Exit code: $exit_code)"
    echo "=========================================="
    
    # Hanya restore jika state dir ada dan valid
    if [ -d "$STATE_DIR" ] && [ -f "$STATE_DIR/backup-valid" ]; then
        echo "→ Restoring original state..."
        
        # 1. Kill Cursor (ignore errors)
        pkill -9 -f "/usr/bin/cursor" 2>/dev/null || true
        pkill -9 -f "/opt/cursor" 2>/dev/null || true
        sleep 2
        
        # 2. Restore Cursor data
        if [ -d "$STATE_DIR/cursor-backup" ]; then
            echo "  Restoring Cursor config..."
            rm -rf "$HOME/.config/Cursor" 2>/dev/null || true
            
            if [ -d "$STATE_DIR/cursor-backup/Cursor" ]; then
                mkdir -p "$HOME/.config"
                cp -r "$STATE_DIR/cursor-backup/Cursor" "$HOME/.config/" 2>/dev/null || true
            fi
        fi
        
        # 3. Restore system machine-id
        if [ -f "$STATE_DIR/machine-id-backup" ] && [ -f /etc/machine-id ]; then
            echo "  Restoring machine-id..."
            sudo cp "$STATE_DIR/machine-id-backup" /etc/machine-id 2>/dev/null || true
        fi
        
        # 4. Restore MAC
        if [ -f "$STATE_DIR/mac-backup" ]; then
            echo "  Restoring MAC address..."
            local orig_mac=$(cat "$STATE_DIR/mac-backup")
            local iface=$(ip link 2>/dev/null | grep -E "^[0-9]+:" | grep -v "lo:" | head -1 | cut -d: -f2 | tr -d ' ')
            if [ -n "$iface" ]; then
                sudo ip link set "$iface" down 2>/dev/null || true
                sudo ip link set "$iface" address "$orig_mac" 2>/dev/null || true
                sudo ip link set "$iface" up 2>/dev/null || true
            fi
        fi
        
        echo "✅ RESTORE COMPLETE"
        
        # Cleanup state dir
        rm -rf "$STATE_DIR"
    else
        echo "⚠️  No valid backup found, skipping restore"
    fi
    
    echo "=========================================="
    exit $exit_code
}

# Trap dengan signal yang aman
trap 'echo ""; echo "Interrupted! Cleaning up..."; safe_cleanup' INT TERM
trap 'safe_cleanup' EXIT

# ============================================================================
# PHASE 1: BACKUP (Dengan validasi)
# ============================================================================

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  CURSOR SAFE SANDBOX BYPASS                                ║"
echo "║  Auto-Recovery | Non-Destructive                           ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

echo "[PHASE 1] Creating Backup..."
echo "-----------------------------"

# Buat state dir
mkdir -p "$STATE_DIR/cursor-backup"
mkdir -p "$STATE_DIR/cursor-fake"

# Backup Cursor config (jika ada)
if [ -d "$HOME/.config/Cursor" ]; then
    cp -r "$HOME/.config/Cursor" "$STATE_DIR/cursor-backup/" 2>/dev/null && \
    echo "✓ Cursor config backed up" || \
    echo "⚠ Could not backup Cursor config"
else
    echo "ℹ No existing Cursor config (fresh install)"
fi

# Backup machine-id
if [ -f /etc/machine-id ]; then
    cp /etc/machine-id "$STATE_DIR/machine-id-backup" 2>/dev/null && \
    echo "✓ machine-id backed up: $(cat /etc/machine-id)" || \
    echo "⚠ Could not backup machine-id"
fi

# Backup MAC
IFACE=$(ip link 2>/dev/null | grep -E "^[0-9]+:" | grep -v "lo:" | head -1 | cut -d: -f2 | tr -d ' ')
if [ -n "$IFACE" ]; then
    MAC=$(ip link show "$IFACE" 2>/dev/null | grep "link/ether" | awk '{print $2}')
    if [ -n "$MAC" ]; then
        echo "$MAC" > "$STATE_DIR/mac-backup"
        echo "✓ MAC backed up: $MAC ($IFACE)"
    fi
fi

# Tandai backup valid
touch "$STATE_DIR/backup-valid"
echo "✅ Backup created in: $STATE_DIR"
echo ""

# ============================================================================
# PHASE 2: APPLY BYPASS (Tanpa kill processes)
# ============================================================================

echo "[PHASE 2] Applying Bypass..."
echo "-----------------------------"

# Jangan kill processes - cukup tunggu user tutup manual
echo "⚠️  Please CLOSE Cursor manually if it's running!"
echo "    (Waiting 5 seconds...)"
sleep 5

# Hapus Cursor config lama (setelah user tutup)
echo "→ Removing old Cursor data..."
rm -rf "$HOME/.config/Cursor" 2>/dev/null || true
rm -rf "$HOME/.cache/Cursor" 2>/dev/null || true

# Buat fake config
echo "→ Creating fake configuration..."
mkdir -p "$HOME/.config/Cursor/User/globalStorage"

# Generate fake IDs
FAKE_MACHINE=$(cat /dev/urandom | tr -dc 'a-f0-9' | head -c 64)
FAKE_MAC=$(cat /dev/urandom | tr -dc 'a-f0-9' | head -c 64)
FAKE_DEV=$(uuidgen 2>/dev/null || cat /dev/urandom | tr -dc 'a-f0-9' | head -c 32)

cat > "$HOME/.config/Cursor/User/globalStorage/storage.json" <<EOF
{
  "telemetry.machineId": "$FAKE_MACHINE",
  "telemetry.macMachineId": "$FAKE_MAC", 
  "telemetry.devDeviceId": "$FAKE_DEV",
  "telemetry.sqmId": "$(uuidgen 2>/dev/null || echo $FAKE_DEV)",
  "telemetry.firstSessionDate": "$(date -u +%Y-%m-%dT%H:%M:%S.000Z)",
  "telemetry.sessionCount": 1
}
EOF

echo "✓ Fake IDs created:"
echo "  machineId: ${FAKE_MACHINE:0:32}..."

# Buat settings anti-telemetry
cat > "$HOME/.config/Cursor/User/settings.json" <<EOF
{
  "telemetry.enableTelemetry": false,
  "crashReporter.enableCrashReporter": false,
  "workbench.enableExperiments": false,
  "update.mode": "none"
}
EOF

echo "✓ Telemetry disabled"

# ============================================================================
# PHASE 3: OPTIONAL SYSTEM MODS
# ============================================================================

echo ""
echo "[PHASE 3] Optional System Modifications"
echo "----------------------------------------"

read -p "Change system machine-id? [y/N]: " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    NEW_ID=$(uuidgen | tr -d '-' 2>/dev/null || cat /dev/urandom | tr -dc 'a-f0-9' | head -c 32)
    echo "$NEW_ID" | sudo tee /etc/machine-id > /dev/null && \
    echo "✓ machine-id changed to: $NEW_ID" || \
    echo "❌ Failed to change machine-id (permission denied)"
fi

read -p "Spoof MAC address? [y/N]: " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    NEW_MAC=$(cat /dev/urandom | tr -dc 'a-f0-9' | head -c 12 | sed 's/../&:/g; s/:$//')
    if [ -n "$IFACE" ]; then
        sudo ip link set "$IFACE" down 2>/dev/null || true
        sudo ip link set "$IFACE" address "$NEW_MAC" 2>/dev/null && \
        echo "✓ MAC changed to: $NEW_MAC" || \
        echo "❌ Failed to change MAC"
        sudo ip link set "$IFACE" up 2>/dev/null || true
    fi
fi

# ============================================================================
# PHASE 4: MONITORING MODE
# ============================================================================

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║  SANDBOX ACTIVE                                            ║"
echo "║                                                            ║"
echo "║  ✅ Cursor config: FAKE                                    ║"
echo "║  ✅ Backup: $STATE_DIR                            ║"
echo "║                                                            ║"
echo "║  Commands:                                                 ║"
echo "║   - cursor  : Launch Cursor                                ║"
echo "║   - status  : Check status                                 ║"
echo "║   - restore : Restore now & exit                           ║"
echo "║   - exit    : Restore & exit                               ║"
echo "║                                                            ║"
echo "║  ⚠️  IMPORTANT:                                            ║"
echo "║   Use VPN + NEW email for signup!                          ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Simpan PID
echo $$ > "$PID_FILE"

# Loop interaktif
while true; do
    echo -n "[$(date +%H:%M:%S)] bypass-ready> "
    read -r cmd
    
    case "$cmd" in
        cursor|start|open)
            echo "→ Launching Cursor..."
            nohup cursor --disable-gpu 2>/dev/null &
            sleep 2
            echo "  Cursor launched (PID: $!)"
            ;;
        status)
            echo "→ Status:"
            echo "  Backup: $STATE_DIR"
            if [ -f "$HOME/.config/Cursor/User/globalStorage/storage.json" ]; then
                echo "  Config: MODIFIED"
                grep "machineId" "$HOME/.config/Cursor/User/globalStorage/storage.json" 2>/dev/null | head -1
            else
                echo "  Config: NOT FOUND"
            fi
            ;;
        restore|exit|quit|stop)
            echo "→ Restoring..."
            break
            ;;
        help|h|\?)
            echo "Commands: cursor, status, restore, exit, help"
            ;;
        *)
            if [ -n "$cmd" ]; then
                echo "Unknown: $cmd (type 'help')"
            fi
            ;;
    esac
done

# Exit akan trigger trap cleanup
exit 0
