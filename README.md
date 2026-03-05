# Cursor Hard Bypass - Advanced Sandbox System

## 🚀 **Main Function**
This script is a **hardened sandbox bypass for Cursor Editor** that enables usage without license restrictions with advanced anti-detection mechanisms:
- ✅ **Auto-recovery** - Automatically restores system to original state with forensic cleanup
- ✅ **Non-destructive** - Doesn't damage original configuration (atomic operations)
- ✅ **Deep bypass** - Multi-layer modifications (machine-id, MAC, config, behavioral patterns)
- ✅ **Interactive mode** - Real-time control with command prompt and monitoring
- ✅ **Forensic obfuscation** - Removes traces and randomizes signatures
- ✅ **Network isolation** - Optional network namespace sandboxing
- ✅ **Time-based randomization** - Variable timing to avoid pattern detection

## 📁 **Repository Structure**
```
Bypass-Crsr/
├── hard-bypass-cursor.sh       # Main Linux/Ubuntu script (advanced version)
├── cursor-safe-sandbox.sh      # Legacy Linux/macOS script
├── cursor-windows-bypass.ps1   # Windows PowerShell script
├── install.sh                  # Installation script
├── uninstall.sh                # Clean removal script
├── config/                     # Configuration templates
│   ├── forensic-mode.conf
│   ├── stealth-mode.conf
│   └── persistent-mode.conf
├── tests/                      # Test suite
│   ├── unit-tests.sh
│   ├── integration-tests.sh
│   └── security-tests.sh
├── docs/                       # Documentation
│   ├── API.md
│   ├── SECURITY.md
│   └── TROUBLESHOOTING.md
├── examples/                   # Usage examples
│   ├── docker-compose.yml
│   ├── systemd-service.conf
│   └── cron-jobs.txt
└── .cursor-hard-bypass-*/      # Automatic backup folders (generated)
```

## ⚙️ **Usage Guide (Linux/Ubuntu)**

### **1. Preparation & Installation**
```bash
# Clone repository
git clone https://github.com/Javasrabni/Bypass-Crsr.git
cd Bypass-Crsr

# Make executable
chmod +x hard-bypass-cursor.sh

# Run installation script (optional)
sudo ./install.sh

# Verify system compatibility
./hard-bypass-cursor.sh --check

# Install dependencies (if not auto-installed)
sudo apt-get update
sudo apt-get install uuid-runtime iproute2 psmisc coreutils \
  grep sed awk curl wget tar gzip
```

### **2. Running the Script**
```bash
# Standard interactive mode (recommended)
./hard-bypass-cursor.sh

# Quick mode (auto-accept defaults, minimal prompts)
./hard-bypass-cursor.sh --quick

# Forensic mode (maximum obfuscation, slower)
./hard-bypass-cursor.sh --forensic

# Stealth mode (minimal footprint, fast)
./hard-bypass-cursor.sh --stealth

# Test mode (dry run, no actual changes)
./hard-bypass-cursor.sh --test

# Silent mode with logging
./hard-bypass-cursor.sh --silent --log /var/log/cursor-bypass.log

# Custom backup location
./hard-bypass-cursor.sh --backup-dir /mnt/secure-backup

# Network isolation mode
./hard-bypass-cursor.sh --isolated
```

### **3. Advanced Workflow**
```
[PRE-FLIGHT]
    ├── Environment validation
    ├── Dependency check
    ├── Risk assessment
    └── Permission verification

[PHASE 1] Secure Backup
    ├── Atomic snapshot creation
    ├── Cryptographic verification
    ├── State integrity check
    └── Recovery readiness test

[PHASE 2] Multi-Layer Bypass
    ├── Layer 1: Application telemetry spoofing
    ├── Layer 2: System fingerprint randomization
    ├── Layer 3: Network identity obfuscation
    ├── Layer 4: Behavioral pattern masking
    └── Layer 5: Forensic trace removal

[PHASE 3] Optional Enhancements
    ├── System machine-id rotation
    ├── MAC address randomization
    ├── Network namespace isolation
    ├── DNS cache poisoning prevention
    └── Update channel manipulation

[PHASE 4] Interactive Monitoring
    ├── Real-time process supervision
    ├── Network activity tracking
    ├── File modification detection
    └── Anomaly behavior analysis

[PHASE 5] Auto-Recovery
    ├── Triggered on exit/interrupt
    ├── Forensic cleanup
    ├── State verification
    └── Log rotation and purge
```

### **4. Interactive Mode Commands**
```
BASIC COMMANDS:
  cursor    : Launch Cursor Editor in sandbox
  start     : Alias for cursor command
  open      : Alias for cursor command
  
  status    : Display detailed bypass status
  info      : Show system information
  
  restore   : Restore system & exit immediately
  exit      : Same as restore (graceful shutdown)
  quit      : Same as restore
  stop      : Same as restore
  
  help      : Show available commands
  h         : Short help
  ?         : Command help

ADVANCED COMMANDS:
  monitor   : Enter real-time monitoring mode
  logs      : View bypass activity logs
  verify    : Verify bypass integrity
  
  randomize : Re-randomize all identifiers
  refresh   : Refresh sandbox environment
  
  backup    : Create manual backup snapshot
  snapshot  : Create system state snapshot
  
  network   : Network isolation controls
  forensic  : Forensic cleanup operations
  
  config    : Configuration management
  debug     : Debug information dump
  
  kill      : Force kill Cursor processes
  clean     : Clean temporary files
  
  version   : Show script version
  update    : Check for updates
```

### **5. Example Advanced Session**
```bash
$ ./hard-bypass-cursor.sh --forensic

╔══════════════════════════════════════════════════════════════════════╗
║  CURSOR HARD BYPASS - FORENSIC MODE                                  ║
║  Advanced Anti-Detection | Multi-Layer Obfuscation                  ║
╚══════════════════════════════════════════════════════════════════════╝

[PRE-FLIGHT] System Validation...
✓ OS: Ubuntu 22.04.3 LTS (x86_64)
✓ Kernel: 5.15.0-91-generic
✓ Dependencies: 24/24 packages available
✓ Disk: 15.2GB free (minimum: 500MB)
✓ Memory: 7.8GB available
✓ Network: Connected via eth0 (192.168.1.105)
✓ Security: SELinux disabled, AppArmor active

[PHASE 1] Creating Secure Backup...
─────────────────────────────────────
✓ Creating atomic snapshot...
✓ Backing up Cursor config: ~/.config/Cursor (45.2MB)
✓ Backing up system machine-id: /etc/machine-id
✓ Backing up MAC address: eth0 (00:1a:2b:3c:4d:5e)
✓ Generating cryptographic hash: SHA256:a1b2c3d4...
✓ Backup integrity verified: PASS
✅ Secure backup created: ~/.cursor-hard-bypass-1701234567

[PHASE 2] Applying Multi-Layer Bypass...
─────────────────────────────────────────────
Layer 1: Application Telemetry Spoofing
  ✓ Generating fake machineId: f8e7d6c5b4a39281726354433221100f...
  ✓ Generating fake macMachineId: a0b1c2d3e4f56789abcdef0123456789...
  ✓ Disabling telemetry: settings.json updated
  ✓ Purging usage statistics: 142 records removed

Layer 2: System Fingerprint Randomization  
  ✓ Rotating machine-id: /etc/machine-id updated
  ✓ Spoofing hardware identifiers: DMI/ACPI modified
  ✓ Randomizing boot parameters: GRUB/EFI adjusted

Layer 3: Network Identity Obfuscation
  ✓ Creating network namespace: cursor-ns-1701234567
  ✓ Setting up virtual interface: veth-cursor
  ✓ Configuring isolated routing table
  ✓ Flushing DNS cache: 45 entries removed

Layer 4: Behavioral Pattern Masking
  ✓ Randomizing execution timing: ±3.2s variance
  ✓ Forging installation signature: 2023-12-01T10:30:00Z
  ✓ Manipulating update channels: stable → nightly

Layer 5: Forensic Trace Removal
  ✓ Cleaning system logs: /var/log/syslog (12 entries)
  ✓ Removing temporary files: /tmp/.cursor-* (8 files)
  ✓ Purging browser cache: ~/.cache/Cursor (32.1MB)
  ✓ Sanitizing recent files: ~/.local/share/recently-used.xbel

✅ Multi-layer bypass applied successfully

[PHASE 3] Optional Enhancements...
─────────────────────────────────────
[?] Enable persistent mode? (survives reboot) [y/N]: y
  ✓ Creating systemd service: cursor-bypass.service
  ✓ Setting up cron job: @reboot persistence
  
[?] Enable network isolation? (requires root) [y/N]: y  
  ✓ Isolating network namespace: cursor-ns-1701234567
  ✓ Configuring iptables rules: DROP outgoing telemetry
  ✓ Setting up DNS over HTTPS: Cloudflare/Quad9

[?] Enable behavioral obfuscation? [y/N]: y
  ✓ Randomizing mouse movement patterns
  ✓ Variable typing speed: 45-120 WPM  
  ✓ Irregular usage intervals: Poisson distribution

╔══════════════════════════════════════════════════════════════════════╗
║  SANDBOX ACTIVE - FORENSIC MODE                                      ║
║                                                                      ║
║  ✅ Application Layer: TELEMETRY SPOOFED                             ║
║  ✅ System Layer: FINGERPRINT RANDOMIZED                             ║  
║  ✅ Network Layer: IDENTITY OBFUSCATED                               ║
║  ✅ Behavioral Layer: PATTERN MASKED                                 ║
║  ✅ Forensic Layer: TRACES REMOVED                                   ║
║                                                                      ║
║  🔒 Security Status:                                                 ║
║     • VPN: Connected (Mullvad)                                       ║
║     • Firewall: Active (ufw)                                         ║
║     • Isolation: Network namespace enabled                           ║
║     • Persistence: Systemd + Cron                                    ║
║                                                                      ║
║  📊 Resource Usage:                                                  ║
║     • CPU: 2.3% | Memory: 145MB | Disk: 320MB                       ║
║     • Network: Isolated | Processes: 3                               ║
║                                                                      ║
║  💡 Advanced Commands:                                               ║
║     monitor   : Real-time system monitoring                          ║
║     network   : Network isolation controls                           ║
║     forensic  : Forensic operations                                  ║
║     randomize : Re-randomize identifiers                             ║
║     verify    : Verify bypass integrity                              ║
╚══════════════════════════════════════════════════════════════════════╝

[14:30:15] bypass@forensic> monitor
→ Entering real-time monitoring mode...
[14:30:16] PROCESS: cursor (PID: 4567) CPU: 1.2% MEM: 87MB
[14:30:17] NETWORK: cursor → api.cursor.sh:443 BLOCKED (telemetry)
[14:30:18] FILESYSTEM: ~/.config/Cursor/User/state modified
[14:30:19] SECURITY: No suspicious patterns detected

[14:30:20] bypass@forensic> network stats
→ Network Isolation Statistics:
  • Interfaces: veth-cursor@if2 (isolated)
  • IP Address: 10.0.0.2/24 (internal only)
  • DNS: DoH via Quad9 (9.9.9.9)
  • Blocked connections: 12 telemetry attempts
  • Allowed connections: 3 git operations

[14:30:25] bypass@forensic> randomize
→ Re-randomizing identifiers...
  ✓ New machineId: c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8...
  ✓ New MAC address: 22:33:44:55:66:77 (virtual)
  ✓ New installation timestamp: 2024-01-15T08:45:30Z
  ✓ Behavioral patterns updated

[14:30:30] bypass@forensic> exit
→ Initiating forensic shutdown...

[PHASE 5] Forensic Auto-Recovery...
─────────────────────────────────────
✓ Terminating Cursor processes: PID 4567, 4568
✓ Destroying network namespace: cursor-ns-1701234567
✓ Removing iptables rules: 8 rules deleted

✓ Restoring original state from backup...
  • Cursor config: ~/.config/Cursor (45.2MB restored)
  • System machine-id: /etc/machine-id restored
  • MAC address: eth0 reset to 00:1a:2b:3c:4d:5e

✓ Performing forensic cleanup...
  • Removing temporary files: /tmp/cursor-* (14 files)
  • Clearing DNS cache: flushed
  • Rotating logs: /var/log/cursor-bypass.log.1
  • Removing systemd service (if temporary)

✓ Verifying restoration integrity...
  • Checksum verification: SHA256 match ✓
  • Permission restoration: All files ✓  
  • System state validation: PASS ✓

✅ FORENSIC RECOVERY COMPLETE
• All modifications reversed
• No traces of bypass activity
• System restored to original state

Total execution time: 47.3 seconds
Backup preserved at: ~/.cursor-hard-bypass-1701234567 (auto-delete in 7 days)
```

## 🛡️ **Security Implementation**

### **Cryptographic Security**
```bash
# Multi-source entropy generation
ENTROPY_SOURCES=(
    "/dev/urandom"
    "/dev/random" 
    "/proc/sys/kernel/random/entropy_avail"
    "/proc/sys/kernel/random/uuid"
    "$(date +%s%N)$(cat /proc/uptime)"
)

# Hash-based integrity verification
generate_backup_hash() {
    local backup_dir="$1"
    find "$backup_dir" -type f -exec sha256sum {} + | \
        sort -k2 | sha256sum | cut -d' ' -f1
}

verify_integrity() {
    local original_hash="$1"
    local current_hash="$(generate_backup_hash "$2")"
    [[ "$original_hash" == "$current_hash" ]] && return 0 || return 1
}
```

### **Permission & Isolation Model**
```bash
# Principle of least privilege implementation
check_privileges() {
    local required_caps=()
    
    # Only request capabilities when needed
    if [[ "$1" == "system" ]]; then
        required_caps+=(CAP_SYS_ADMIN CAP_NET_ADMIN CAP_DAC_OVERRIDE)
    fi
    
    if [[ "$EUID" -ne 0 ]] && [[ ${#required_caps[@]} -gt 0 ]]; then
        echo "Elevating privileges for system modifications..."
        exec sudo -E "$0" "${@}"
    fi
}

# Namespace isolation when available
setup_namespace_isolation() {
    if command -v unshare &>/dev/null; then
        unshare --mount --uts --ipc --net --pid --fork \
            --mount-proc=/proc \
            --map-root-user \
            bash -c "$0 --isolated-inner"
    else
        echo "Namespace isolation not available, using chroot fallback"
        setup_chroot_isolation
    fi
}
```

### **Forensic Countermeasures**
```bash
# Anti-forensic techniques
perform_forensic_cleanup() {
    echo "Performing forensic cleanup..."
    
    # Remove timestamps from files
    find /tmp -name "*cursor*" -exec touch -t 202301010000 {} \;
    
    # Overwrite deleted file content (if supported)
    if command -v shred &>/dev/null; then
        find /tmp -name "*cursor*" -exec shred -zuf {} \;
    fi
    
    # Clear kernel inode/dentry caches
    sync && echo 3 > /proc/sys/vm/drop_caches 2>/dev/null || true
    
    # Remove from shell history
    sed -i '/hard-bypass-cursor/d' ~/.bash_history ~/.zsh_history 2>/dev/null
    
    # Clear system logs (with permission)
    if [[ "$CLEAN_LOGS" == "true" ]]; then
        journalctl --vacuum-time=1s --unit=cursor* 2>/dev/null || true
    fi
    
    echo "Forensic cleanup complete"
}
```

## 🔧 **Advanced Troubleshooting**

### **Diagnostic Commands**
```bash
# Comprehensive system check
./hard-bypass-cursor.sh --diagnose

# Generate debug report
./hard-bypass-cursor.sh --debug-report > debug-report.txt

# Test specific components
./hard-bypass-cursor.sh --test-network
./hard-bypass-cursor.sh --test-filesystem  
./hard-bypass-cursor.sh --test-security

# Performance profiling
time ./hard-bypass-cursor.sh --quick --profile
```

### **Common Issues & Solutions**

#### **Issue: System Compatibility Problems**
```bash
ERROR: Unsupported Linux distribution or version
```
**Solution:**
```bash
# Check compatibility
./hard-bypass-cursor.sh --check

# Force compatibility mode  
./hard-bypass-cursor.sh --compat-mode

# Manual dependency installation
sudo apt-get install lsb-release coreutils util-linux iproute2

# Use Docker container instead
docker run --privileged -it ubuntu:22.04 /bin/bash -c \
  "apt-get update && apt-get install -y git && \
   git clone https://github.com/Javasrabni/Bypass-Crsr && \
   cd Bypass-Crsr && ./hard-bypass-cursor.sh"
```

#### **Issue: Permission Escalation Failure**
```bash
ERROR: Failed to acquire necessary privileges
```
**Solution:**
```bash
# Check sudo configuration
sudo -l

# Run with explicit sudo
sudo ./hard-bypass-cursor.sh --quick

# Configure passwordless sudo (temporary)
echo "$USER ALL=(ALL) NOPASSWD: $(pwd)/hard-bypass-cursor.sh" | \
  sudo tee /etc/sudoers.d/cursor-bypass

# Use capabilities instead of full sudo
sudo setcap cap_net_admin,cap_sys_admin+ep hard-bypass-cursor.sh
```

#### **Issue: Network Isolation Conflicts**
```bash
ERROR: Network namespace creation failed
```
**Solution:**
```bash
# Check existing namespaces
ip netns list

# Clean up orphaned namespaces
sudo ip -all netns delete

# Disable network isolation temporarily
./hard-bypass-cursor.sh --no-network-isolation

# Use alternative isolation method
./hard-bypass-cursor.sh --firewall-only

# Check kernel support
uname -r
lsmod | grep -E "network|namespace"
```

#### **Issue: Backup/Restore Corruption**
```bash
ERROR: Backup integrity check failed
```
**Solution:**
```bash
# Manual backup verification
./hard-bypass-cursor.sh --verify-backup ~/.cursor-hard-bypass-*

# Create fresh backup
./hard-bypass-cursor.sh --force-backup

# Use alternative backup location with more space
./hard-bypass-cursor.sh --backup-dir /mnt/external-drive

# Check filesystem integrity
sudo fsck /dev/sda1

# Repair backup archive (if tar-based)
tar -tzf backup.tar.gz > /dev/null || \
  tar -xzf backup.tar.gz --keep-old-files
```

### **Recovery Procedures**

#### **Emergency Manual Recovery**
```bash
#!/bin/bash
# emergency-recovery.sh

BACKUP_DIR=$(ls -td ~/.cursor-hard-bypass-* | head -1)

if [[ -d "$BACKUP_DIR" ]]; then
    echo "Restoring from backup: $BACKUP_DIR"
    
    # Restore Cursor configuration
    if [[ -d "$BACKUP_DIR/cursor-backup" ]]; then
        rm -rf ~/.config/Cursor ~/.cache/Cursor ~/.local/share/Cursor
        cp -r "$BACKUP_DIR/cursor-backup" ~/.config/Cursor
    fi
    
    # Restore system machine-id (requires root)
    if [[ -f "$BACKUP_DIR/machine-id-backup" ]] && [[ -f /etc/machine-id ]]; then
        sudo cp "$BACKUP_DIR/machine-id-backup" /etc/machine-id
        sudo systemd-machine-id-setup || true
    fi
    
    # Restore MAC address (if changed)
    if [[ -f "$BACKUP_DIR/mac-backup" ]]; then
        ORIG_MAC=$(cat "$BACKUP_DIR/mac-backup")
        IFACE=$(ip link | grep -E "^[0-9]+:" | grep -v "lo:" | head -1 | cut -d: -f2 | tr -d ' ')
        if [[ -n "$IFACE" ]]; then
            sudo ip link set "$IFACE" down
            sudo ip link set "$IFACE" address "$ORIG_MAC"
            sudo ip link set "$IFACE" up
        fi
    fi
    
    echo "Emergency recovery complete"
else
    echo "No backup found. Manual restoration required."
    echo "Try reinstalling Cursor or restoring from system backup."
fi
```

#### **Automated Recovery Script**
```bash
# Schedule automatic recovery checks
crontab -l | grep -q "cursor-recovery" || \
echo "0 */6 * * * $(pwd)/hard-bypass-cursor.sh --verify-integrity --silent" | crontab -

# Set up systemd recovery service
sudo tee /etc/systemd/system/cursor-recovery.service << EOF
[Unit]
Description=Cursor Bypass Integrity Recovery
After=network.target

[Service]
Type=oneshot
ExecStart=$(pwd)/hard-bypass-cursor.sh --verify-and-repair --silent
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable cursor-recovery.timer
```

## 📊 **Performance Optimization**

### **Resource Usage Profiles**
```bash
# Profile selection based on system capabilities
select_performance_profile() {
    local total_mem=$(free -g | awk '/^Mem:/{print $2}')
    local cpu_cores=$(nproc)
    
    if [[ $total_mem -ge 16 ]] && [[ $cpu_cores -ge 8 ]]; then
        echo "high-performance"
    elif [[ $total_mem -ge 8 ]] && [[ $cpu_cores -ge 4 ]]; then  
        echo "balanced"
    elif [[ $total_mem -ge 4 ]] && [[ $cpu_cores -ge 2 ]]; then
        echo "conservative"
    else
        echo "minimal"
    fi
}

apply_performance_profile() {
    local profile="$1"
    
    case "$profile" in
        "high-performance")
            COMPRESSION_LEVEL=9
            PARALLEL_JOBS=$(( $(nproc) * 2 ))
            MONITOR_INTERVAL=1
            ;;
        "balanced")
            COMPRESSION_LEVEL=6  
            PARALLEL_JOBS=$(nproc)
            MONITOR_INTERVAL=2
            ;;
        "conservative")
            COMPRESSION_LEVEL=3
            PARALLEL_JOBS=$(( $(nproc) / 2 ))
            MONITOR_INTERVAL=5
            ;;
        "minimal")
            COMPRESSION_LEVEL=1
