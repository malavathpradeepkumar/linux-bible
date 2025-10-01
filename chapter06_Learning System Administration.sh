✅ sudo command:
Runs a single command as root.

After that, you return to regular user mode.

✅ In Ubuntu and Fedora, the first user gets sudo access by default.

❌ In RHEL, this doesn’t happen unless you choose it during install.



✅ Cockpit (Browser-based Admin Tool):
Available in RHEL, Fedora, and others.

Lets you control system features like:
Networking
Users
Services
System monitoring

🖥️ Old Graphical Tools (system-config-*):
Older RHEL/Fedora used GUI tools named like system-config-*.

These are mostly discontinued in newer releases, but still exist in older ones.


🛠️ Setting Up Cockpit (Original: RHEL/Fedora → Modified: Kali Linux)
Here’s how it’s done in RHEL/Fedora, and how to do the same in Kali Linux ⬇️



# On RHEL/Fedora:
dnf install cockpit                        # dnf = Dandified Yum, package manager for RHEL/Fedora

# On Kali Linux:
sudo apt update                            # apt = Advanced Package Tool, updates the package index
sudo apt install cockpit                   # Installs Cockpit on Kali



# On RHEL/Fedora:
systemctl enable --now cockpit.socket      # systemctl = system service manager
                                           # enable --now = enable service and start it immediately
                                           # cockpit.socket = socket file that listens for connections

# On Kali Linux (Same):
sudo systemctl enable --now cockpit.socket


Open browser and go to:

  https://<hostname>:9090/           # Ex: https://linuxpc:9090/
  https://<IP-address>:9090/         # Ex: https://192.168.1.100:9090/

💡 Port 9090 = Cockpit's default HTTPS port
🔓 Uses a self-signed certificate by default


You can replace the default self-signed certificate with a valid one (ex: using OpenSSL) to avoid browser warnings.

🔗 Learn more from the official site: https://cockpit-project.org



🧠 Important Points from "Using system-config-* tools"


Tools were specific to Fedora or shared with RHEL (before RHEL 8).   THESE ARE GUI TOOLS

🖥️ Commands Used in system-config-* Tools (Older Fedora/RHEL Systems)


# 🧩 Used to configure DNS server zones (BIND)
sudo system-config-bind              # Full form: BIND (Berkeley Internet Name Domain) DNS configuration tool

# 🌐 Used to set up Apache web server
sudo system-config-httpd            # Full form: HTTP Daemon (Apache HTTP server)

# 📂 Share directories using NFS (Network File System)
sudo system-config-nfs              # Full form: Network File System configuration

# 🔐 Change the root password
sudo system-config-rootpassword     # Full form: Root Password Configuration Tool

# 🪟 Configure Samba (SMB) file sharing (for Windows)
sudo system-config-samba            # Full form: Samba Configuration Tool (uses SWAT = Samba Web Admin Tool)

# 🔧 Manage which services start at each runlevel (init system)
sudo system-config-services         # Full form: Service Configuration Tool

# 🔐 Manage user authentication methods (like LDAP, Kerberos)
sudo system-config-authentication   # Full form: Authentication Method Configuration

# 🕒 Set or sync system date and time
sudo system-config-date             # Full form: Date & Time Settings Tool

# 🔥 Configure firewall rules
sudo system-config-firewall         # Full form: Firewall Settings Tool

# 🈳 Set system default language
sudo system-config-language         # Full form: Language Configuration Tool

# 🖨️ Set up printers (local/network)
sudo system-config-printer          # Full form: Printer Configuration Tool

# 🔐 Configure SELinux modes and policies
sudo system-config-selinux          # Full form: Security-Enhanced Linux Settings Tool

# 👥 Manage users and groups
sudo system-config-users            # Full form: Users and Groups Management Tool

# 🧠 Edit GNOME configuration database directly
gconf-editor                        # Full form: GNOME Configuration Editor

# 💾 Analyze disk usage in GUI
baobab                              # Full form: GNOME Disk Usage Analyzer (from gnome-utils)

# 💽 Manage disks and partitions
gnome-disks                         # Full form: GNOME Disk Utility (gnome-disk-utility package)

# 🤖 Create automated install files for RHEL/Fedora
sudo system-config-kickstart        # Full form: Kickstart Configuration Tool for automatic installations


🌐 Using Other Browser-Based Admin Tools

🔧 Red Hat OpenShift
Based on Kubernetes. Lets you manage:

Clusters (control plane + worker nodes)

Containers inside pods
🌍 Visit: www.openshift.com or upstream www.okd.io



☁️ Red Hat OpenStack Platform (RHELOSP)
Used for creating private or hybrid clouds. Web interface: OpenStack Horizon Dashboard

🌐 Horizon Docs: http://horizondocs.openstack.org/horizon/latest

🖥️ Red Hat Virtualization (RHV)
GUI called RHV Manager

💡 Important Note:
While browser-based GUIs are easier to use (especially for beginners), they can’t always solve complex issues. That’s why 
command-line tools  are necessary for full control and fixing problems.

# 🔍 Check OpenStack service list using CLI
openstack service list

# 🔎 Full explanation:
# openstack         => The command-line client for managing OpenStack components
# service           => Subcommand to interact with OpenStack services
# list              => Displays a list of currently registered OpenStack services (like compute, image, identity, etc.)


ROOT

🖥️ To log in as root directly:
Use a virtual console (not GUI)
Press Ctrl + Alt + F3 to switch console
Type root, press Enter, then enter the password
When done, type exit and return with Ctrl + Alt + F1  or (F7)



# 🔍 View the /etc/passwd entry for root
cat /etc/passwd | grep "^root"

^ is a regular expression symbol meaning “start of line.”
 So ^root matches lines where root is the first word.

# Output:
# root:x:0:0:root:/root:/bin/bash

# 📘 Explanation of fields:
# root      => Username
# x         => Placeholder (password stored in /etc/shadow)
# 0         => User ID (UID = 0 means root)
# 0         => Group ID (GID = 0 means root group)
# root      => User description (can be full name or comment)
# /root     => Home directory of root user
# /bin/bash => Default shell assigned to root user



# 🛠️ Use usermod to change root's home or shell (example only)
usermod -d /newroot -s /bin/zsh root

# Full explanation:
# usermod         => Command to modify user account settings
# -d /newroot     => -d = "Directory", sets new home directory to /newroot
# -s /bin/zsh     => -s = "Shell", sets new default shell to /bin/zsh
# root            => Target username to apply changes on (root user)


🧪 Ubuntu Note (⚠️ Special Case)
🟡 In Ubuntu, root account is locked by default — it has no password.
So:
You cannot login as root directly ❌
You must use sudo before each root command ✔️
This improves system security 🛡️



💡 With su, you switch to superuser mode, but by default it doesn’t load the root environment (like PATH). To include root's 
full environment, use su -.

🧪 You can also use su to switch to any other user, like jsmith, for testing issues specific to their account (like printing 
or email errors 📩🖨️).

🛑 Always exit (exit or Ctrl+D) after root tasks to avoid leaving root access open for others.



🔐 Gaining Administrative Access with sudo

sudo lets specific users run administrative (root) commands using their own password instead of the root password.



# 🛠️ Step 1: Open the sudoers file using visudo
# Command: visudo — Opens and locks /etc/sudoers file safely to avoid syntax errors

/usr/sbin/visudo                     # /usr/sbin/visudo → "vi superuser do" editor
                                    # Opens the /etc/sudoers file using a safe method
                                    # It checks syntax and locks the file during editing

# 🛠️ Optional: Change editor if you don’t like vi (example: use gedit)
export EDITOR=gedit                 # export → sets an environment variable
                                    # EDITOR=gedit → sets gedit as the default editor

# 🛠️ Step 2: Add below line inside sudoers file to give full root access (ask for user's password)
joe ALL=(ALL) ALL                   # joe → the username
                                    # ALL=(ALL) → allows joe to run as any user
                                    # ALL → allows all commands with sudo
                                    # Joe must use **his own password**

# 🛠️ Optional: Give full root access with **no password prompt**
joe ALL=(ALL) NOPASSWD: ALL        # NOPASSWD → No password required for sudo

# 🛠️ Step 3: Save and exit the file using vi
# In vi: press ESC, then type :wq and press Enter
# :wq → write and quit

# 🧪 Example sudo usage after joe gets sudo privileges
sudo touch /mnt/testfile.txt       # sudo → run command as root
                                    # touch → create an empty file
                                    # /mnt/testfile.txt → path where file is created

sudo rm /mnt/testfile.txt          # rm → remove the file (needs sudo if no write permission)



🔐 Session Behavior Notes

After using sudo once, joe doesn’t need to re-enter his password for 5 minutes (default in Fedora/RHEL).

In Ubuntu, timeout is 0 seconds (asks password every time).
You can change this using:

passwd_timeout=value   # set inside /etc/sudoers file


📌 Tip:
In Ubuntu, the first user is added to the sudo/admin group by default. To give another user sudo access, 
add them to the admin group using visudo.
📘 Note:
If you're confused using vi, run the vimtutor command for a quick tutorial on editing with vi/vim.


# EXPLORING ADMINISTRATIVE COMMANDS, CONFIGURATION  FILES, AND LOG FILES

# 📘 Linux Bible Notes – Admin Commands & Config Files

## ⚙️ Administrative Commands
👑 Root user only (or use `su -`)

📂 **/sbin**  
- 🛠️ `fsck` → File System ChecK  
   # Check and repair filesystem  
- 🔄 `swapon` → Swap On  
   # Enable swap space  

📂 **/usr/sbin**  
- 👤 `useradd` → add new user  
- 📂 `lsof` → List Open Files  
- 🌐 Daemons (background services, end with `d`):  
  - `sshd` → Secure Shell service  
  - `cupsd` → Printing service  

📂 **/bin**  
- 📦 `mount` → mount or list filesystems  
   - Normal users → only list mounts  
   - Root → can mount/unmount  

📑 **Extra**  
- 📖 Section 8 manual pages: `/usr/share/man/man8` → Admin command docs  
- 📂 Custom commands → `/usr/local/bin` or `/usr/local/sbin`  

---

## 📝 Configuration Files
- ✍️ Plain text → easy to edit, but errors break services  
- ✅ Test tools:  
  - `testparm` → check Samba config (`smb.conf`)  
  - `httpd -t` → check Apache config  
- 🎨 `vim` → highlights config files (comments in color)  

---

## 📂 User & System Config Locations
- 🏠 `$HOME` → personal config files (`.bashrc`, `.ssh/`)  
  - Show hidden files: `ls -a`  
  - Show home path: `echo $HOME`  
- ⚙️ `/etc` → system-wide configs  

---

## 📂 Important `/etc` Directories
- ⏰ `/etc/cron.*` → cron jobs (daily, hourly, weekly, monthly)  
- 🖨️ `/etc/cups` → printing configs  
- 👤 `/etc/default` → default values (e.g., for `useradd`)  
- 🌐 `/etc/httpd` or `/etc/apache2` → Apache configs  
- 📧 `/etc/postfix` → Postfix mail configs  
- 🔑 `/etc/security` → PAM (authentication rules)  
- 📂 `/etc/skel` → default files copied to new user’s home  
- ⚡ `/etc/systemd` → systemd service configs (used by `systemctl`)  
- 🌍 `/etc/xinetd.d` → on-demand network services  

---

## 📑 Important `/etc` Files
- 👥 `group` → groups + IDs  
- 🔒 `shadow` → encrypted user passwords  
- 👤 `passwd` → user account info (not passwords)  
- 📂 `fstab` → list of devices & mount points  
- 🖥️ `hostname` → system hostname  
- 🌍 `hosts` → static host ↔ IP mapping  
- ⏰ `crontab` → scheduled tasks  
- 🖨️ `printcap` → printers info  
- ⚡ `sudoers` → rules for sudo permissions  
- 📜 `rsyslog.conf` → logging rules  
- 🌐 `services` → service names + port numbers  

📂 `/etc/X11` → configs for X Window system (`xorg.conf`, xdm, xinit)  

---

# ✅ Commands to Remember (from this page)
- `fsck` → check filesystem  
- `swapon` → enable swap  
- `useradd` → add user  
- `lsof` → list open files  
- `sshd` → SSH daemon  
- `cupsd` → printing daemon  
- `mount` → mount/list filesystems  
- `ls -a` → show hidden files  
- `echo $HOME` → print home path  
- `testparm` → check Samba config  
- `httpd -t` → check Apache config  
- `vim` → edit with syntax highlighting  



# ADMINISTRATIVE LOG FILES AND SYSTEMD JOURNAL #


# 📘 Linux Bible Notes – Log Files & systemd Journal

## 🔹 Logging in Linux
- 📝 Linux records system activity → useful for debugging & security.  
- 🛠️ Old systems: `rsyslogd` daemon (or `syslogd`).  
- ⚡ New systems (systemd): use **systemd journal** → managed by `journalctl` command.  

---

## 📂 Using `journalctl`
👉 Main command to view messages from **kernel + boot + services**.

### 1. Basic usage
- `journalctl`  
  # Show all logs (paged output)

### 2. Boot-related logs
- `journalctl --list-boots | head`  
  # List previous boot sessions (with boot IDs)  
- `journalctl -b <boot-ID>`  
  # Show logs of a specific boot session  
- `journalctl -k`  
  # Show only **kernel messages**  

### 3. Service-specific logs
- `journalctl _SYSTEMD_UNIT=sshd.service`  
  # Show logs only for `sshd` service (can replace with any service name)  

### 4. Priority (Log Levels)
- `journalctl PRIORITY=0`  
  # Show only **emergency-level (0)** messages  
  🔢 PRIORITY values:  
    - 0 → Emergency  
    - 1 → Alert  
    - 2 → Critical  
    - 3 → Error  
    - 4 → Warning  
    - 5 → Notice  
    - 6 → Info  
    - 7 → Debug  

### 5. Real-time monitoring
- `journalctl -f`  
  # Follow logs in real-time (like `tail -f`)  
- `journalctl -a -f`  
  # Follow logs and show **all fields**  

---

# ✅ Commands to Remember (from this page)
- `journalctl` → view all logs  
- `journalctl --list-boots | head` → list boot IDs  
- `journalctl -b <boot-ID>` → logs from specific boot  
- `journalctl -k` → kernel messages  
- `journalctl _SYSTEMD_UNIT=sshd.service` → logs for a service  
- `journalctl PRIORITY=0` → filter by log level (emergency)  
- `journalctl -f` → follow logs live  
- `journalctl -a -f` → follow logs with all fields  




MANAGING LOG MESSAGES WITH RSYSLOGD #

# 📘 Linux Bible Notes – Managing Log Messages with rsyslogd

## 🔹 What is rsyslogd?
- 🛠️ `rsyslogd` (and old `syslogd`) → **collects log messages**.  
- 📂 Config file: `/etc/rsyslog.conf` → controls where logs go.  
- 📦 Logs are usually stored in `/var/log/` directory.  
- 🌐 Can also send logs to **remote log servers** for extra security.  

---

## 📂 Common Log Files (in /var/log/)
- 📄 `boot.log` → Boot messages (services starting).  
- 📄 `messages` → General system info messages.  
- 📄 `secure` → Security messages (logins, authentication events).  

---

# ✅ Key Points to Remember
- Logging is handled by `rsyslogd` (or `syslogd` in older systems).  
- Config file → `/etc/rsyslog.conf`.  
- Default log storage → `/var/log/`.  
- Important files: `boot.log`, `messages`, `secure`.  



# 📘 Linux Bible Notes – Other Admin Accounts & Hardware

## 🔹 Administrative Accounts (besides root)
- In UNIX, there were multiple admin logins (example: printer users = `lp`).  
- In Linux, these accounts still exist, but **direct login is disabled by default**.  
- Purpose → ownership of files & running daemon processes securely.  
- Benefit → if one service is hacked, attacker **doesn’t get root**.  

### ⚙️ Examples of Admin Accounts
- 🖨️ `lp` → owns printer logs & spool files (`/var/log/cups`, `/var/spool/lpd`).  
- 🌐 `apache` → runs Apache web server (`httpd` in RHEL/Fedora, `www-data` in Ubuntu).  
- 🔎 `avahi` → runs Avahi daemon (zeroconf networking).  
- ⏰



CHECKING YOUR HARDWARE


# 📘 Linux Bible Notes – Checking Your Hardware

## 🔹 Kernel Hardware Detection
- 🖥️ When system boots → kernel detects hardware + loads drivers.  
- ⚠️ Boot messages scroll fast → check them after boot.  

---

## 📂 Ways to View Boot/Kernel Messages
- `dmesg`  
  # Show kernel boot messages (detected hardware, loaded drivers).  

- `dmesg | less`  
  # View kernel messages with scroll/paging.  

- `journalctl -b`  
  # Show messages for a particular boot session (systemd).  

- `tail -f /var/log/messages`  
  # Watch new kernel messages in real-time (e.g., USB device insertion).  

- `journalctl -f`  
  # Follow new messages in systemd journal (real-time).  

---

## 🔧 Example: dmesg Output
- Shows:  
  - Kernel version  
  - Boot command-line options  
  - Hardware being detected (e.g., USB drive size, model).  

👉 If device fails → use this info (model, driver) → search fixes online.  

---

## 🔹 Hardware Inspection Commands

### 1. PCI Devices
- `lspci`  
  # List PCI devices (sound, USB, video, network, etc.).  

- `lspci -v` / `lspci -vvv`  
  # Show detailed info (latency, capabilities, driver in use).  

---

### 2. USB Devices
- `lsusb`  
  # Show connected USB devices + hubs.  

- `lsusb -v`  
  # Verbose output (device details).  

---

### 3. CPU Info
- `lscpu`  
  # Show processor details.  

📑 Sample output:  
- Architecture → x86_64  
- Modes → 32-bit + 64-bit  
- CPU(s) → 4  
- Cores per socket, threads, etc.  

---

# ✅ Commands to Remember (from this page)
- `dmesg` → kernel/boot messages  
- `dmesg | less` → view with scroll  
- `journalctl -b` → boot logs  
- `tail -f /var/log/messages` → follow kernel logs live  
- `journalctl -f` → follow systemd logs live  
- `lspci` / `lspci -vvv` → PCI device info  
- `lsusb` / `lsusb -v` → USB device info  
- `lscpu` → CPU details  




MANAGING REMOVABLE HARDWARE


# 📘 Linux Bible Notes – Managing Removable Hardware

## 🔹 How Linux Handles Removable Devices
- 🖥️ Desktop environments (like GNOME, KDE) use **Udev (udevd daemon)** to detect devices.  
- 📂 Udev dynamically creates/removes device nodes in `/dev` (e.g., `/dev/sda`, `/dev/sdb`).  
- ⚡ Desktop tools (like GNOME’s **Nautilus**) let you configure what happens when devices/media are inserted.  

---

## 📂 GNOME 3.32 Removable Media Settings
👉 Access: **Activities → search "Removable Media" → Removable Media Settings**  

### Settings by Media Type:
- 🎵 **CD Audio**  
  - Default → prompt what to do  
  - Options: do nothing, open folder, play in **Rhythmbox**, extract/burn in **Brasero**  

- 📀 **DVD Video**  
  - Default → prompt  
  - Options: play with **Totem**, burn with **Brasero**, use other players (e.g., MPlayer)  
  ⚠️ Totem cannot play commercial DVDs unless extra decoding software is installed (check legal issues).  

- 🎧 **Music Player (data media with audio files)**  
  - Choose music app (e.g., Rhythmbox).  

- 🖼️ **Photos (camera card, USB with images)**  
  - Options: do nothing, open in **Shotwell** (default image viewer), or another photo manager.  

- 💽 **Software (installable media)**  
  - Default → open in **Software** window  
  - Options: do nothing, ask, or open folder.  

- 📦 **Other Media**  
  - Customize handling for less common media: Blu-ray, Picture CDs, eBooks, blank discs, etc.  

📌 These settings are **per-user** → each login user can set their own preferences.  

---

## 📂 USB Drives & Hard Drives
- ⚡ Plug in USB drive → automatically detected & mounted.  
  - Device names: `/dev/sda`, `/dev/sdb`, etc.  
  - Mounted at: `/run/media/<username>/`  
  - Prompt appears in Nautilus to open files.  

- ✅ Safely remove USB:  
  - Right-click device in Nautilus → **Safely Remove Drive**  
  - This unmounts device + removes mount point → then unplug safely.  

---

# ✅ Key Points to Remember
- **Udev** = handles device detection.  
- **Nautilus GUI** = configure removable media actions.  
- Common apps: Rhythmbox (music), Brasero (burner), Totem (videos), Shotwell (photos).  
- USB drives auto-mount under `/run/media/username/`.  
- Always **Safely Remove Drive** before unplugging.  



WORKING WITH LOADABLE MODULES #

# 📘 Linux Bible Notes – Kernel Modules (Drivers)

## 🔹 Kernel Modules Overview
- 🛠️ Kernel modules = drivers loaded into the kernel.  
- 📂 Stored in → `/lib/modules/<kernel-version>/`  
  Example: `/lib/modules/5.3.8-200.fc30.x86_64/`  

- 🔄 Modules can be **loaded, unloaded, listed, inspected** using commands.  

---

## 📂 Listing Loaded Modules
- `lsmod`  
  # List all modules currently loaded into kernel  

📑 Sample output fields:  
- **Module** → name of the driver  
- **Size** → memory size  
- **Used by** → which processes/modules are using it  

👉 Example:  
- `e1000` = Intel PRO/1000 network card driver  
- `nouveau` = open-source NVIDIA graphics driver  

---

## 📂 Getting Module Information
- `modinfo <module>`  
  # Show details of a module  

- `modinfo -d e1000`  
  # Show description → Intel(R) PRO/1000 Network Driver  

- `modinfo -a e1000`  
  # Show author of the driver  

- `modinfo -n e1000`  
  # Show exact file location of module object file  

⚡ Useful if:  
- Want to know what a module does  
- Check who wrote it  
- Find where it is stored  

---

# ✅ Commands to Remember (from this page)
- `lsmod` → list loaded kernel modules  
- `modinfo <module>` → show full info about a module  
- `modinfo -d <module>` → description  
- `modinfo -a <module>` → author  
- `modinfo -n <module>` → file location  




LOADING MODULES  #



# 📘 Linux Bible Notes – Loading & Removing Kernel Modules

## 🔹 Loading Modules
- Command: `modprobe <module>`  
  # Load a module into the running kernel  

📌 Example:
- `modprobe parport`  
  # Load `parport` (parallel port core functions)  

- `modprobe parport_pc io=0x3bc irq=auto`  
  # Load `parport_pc` module  
  - `io=0x3bc` → I/O address of device  
  - `irq=auto` → automatically detect interrupt request number  

⚠️ Notes:
- Modules loaded with `modprobe` are **temporary** (lost after reboot).  
- To load permanently → add command to startup scripts.  

---

## 🔹 Removing Modules
- Command: `rmmod <module>`  
  # Remove a module from running kernel  

📌 Example:
- `rmmod parport_pc`  
  # Remove the `parport_pc` module (if not busy).  

⚠️ Issues:  
- If module is busy → stop processes using it, then retry.  
- Some modules are **built-in** and cannot be removed (e.g., `usbcore`).  

📌 Example:
- `rmmod usbcore`  
  → Error: "Module usbcore is builtin."  

---

## 🔹 Alternative to rmmod
- Command: `modprobe -r <module>`  
  # Safer removal → also removes unused dependent modules.  

---

# ✅ Commands to Remember (from this page)
- `modprobe <module>` → load a module  
- `modprobe <module> option=value` → load with custom settings (e.g., `io`, `irq`)  
- `rmmod <module>` → remove a module  
- `modprobe -r <module>` → remove a module + its unused dependencies  


