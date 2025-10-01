# 📘 Linux Bible Notes – Installing Linux in the Enterprise

## 🔹 Problem
- Installing Linux manually on **dozens or thousands of systems** = inefficient.  
- ✅ Solution → Automate installation (boot over network + scripts).  

---

## ⚙️ Steps in the Installation Process

1. **Launch installation medium**
   - Boot from: CD, DVD, USB, Hard Disk, or Network (PXE).  
   - BIOS checks boot order → looks for bootable medium or PXE server.  

2. **Start anaconda kernel**
   - `anaconda` = official Red Hat/Fedora installer.  
   - Boot loader loads:  
     - Kernel  
     - Initial RAM disk (initrd/initramfs)  

   ➡️ Installer prompts where to find software packages if not on same medium.  

3. **Add boot options**
   - Boot options → extra instructions for `anaconda`.  
   - Example: pass **kickstart file location** → contains:  
     - root password  
     - partitioning info  
     - timezone  
     - user accounts  
     - post-install commands  

   📌 Kickstart = **automated installation file**.  

4. **Find software packages**
   - Packages don’t need to be on boot medium.  
   - Sources:  
     - `cdrom` (local CD/DVD)  
     - `http` (web server)  
     - `ftp` (FTP server)  
     - `nfs` (NFS share)  
     - `nfsiso` (NFS ISO image)  
     - `hd` (local hard disk)  

5. **Modify installation with Kickstart scripts**
   - Run pre- or post-install commands.  
   - Example: create users, copy files, fetch data from network, set permissions.  

---

## 🛠️ Enterprise Installation Technologies

- **Install Server**  
  - Copy RHEL installation packages to a server.  
  - Server types: HTTP, FTP, NFS.  
  - Point installer to this server instead of using DVDs.  
  - 📖 Guide: [RHEL 8 Installation Source](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/performing_a_standard_rhel_installation/index#prepareinstallation-source_preparing-for-your-installation)

- **PXE Server (Preboot eXecution Environment)**  
  - Most NICs support PXE boot.  
  - BIOS can boot directly from NIC.  
  - PXE server shows install menu → launch RHEL installation.  
  - 📖 Guide: [Booting with PXE](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/performing_a_standard_rhel_installation/index#booting-theinstallation-using-pxe_booting-the-installer)

- **Kickstart Files**  
  - Fully automate installations.  
  - Default kickstart from last install → `/root/anaconda-ks.cfg`.  
  - Reuse or edit that file to replicate installations.  
  - 📖 Guide: [Kickstart Installation](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html-single/performing_an_advanced_rhel_installation/index/#performing_an_automated_installation_using_kickstart)  

---

# ✅ Key Points to Remember
- `anaconda` = RHEL/Fedora installer.  
- **Kickstart files** automate entire process.  
- Software packages can come from **cdrom, http, ftp, nfs, nfsiso, hd**.  
- `/root/anaconda-ks.cfg` → auto-generated kickstart file after install.  
- Enterprise installs often use **PXE + install server + kickstart** together.  




# 📘 Linux Install – Important Boot Options (Modern Use)

## ⚙️ Essential Boot Options
- `ks=`  
  # Use a Kickstart file for automated install  
  Example: `ks=cdrom:/root/ks.cfg`  

- `inst.repo=`  
  # Point installer to software repo (DVD, http, ftp, nfs, disk)  
  Example: `inst.repo=http://mirror.centos.org/centos/8/BaseOS/x86_64/os/`  

- `inst.text` or `text`  
  # Run installer in text mode (useful if GUI fails or using SSH)  

- `inst.vnc`  
  # Enable VNC remote installation (control install from another PC)  

---

## 🎥 Video/Display Related
- `xdriver=vesa`  
  # Use safe VESA video driver if graphics not working  

- `resolution=1024x768`  
  # Force screen resolution  

---

## 🔌 Networking / Hardware Related
- `noipv6`  
  # Disable IPv6 if causing issues  

- `acpi=off`  
  # Disable ACPI (power mgmt) → sometimes needed for old/buggy hardware  

- `nomodeset`  (**extra, very common today**)  
  # Disable kernel video drivers → useful if install screen is black / stuck  

---

# ✅ Highly Useful in Modern Installs
- `ks=` → Kickstart automation  
- `inst.repo=` → point to repo (DVD, HTTP, NFS, etc.)  
- `inst.text` → text-based installer  
- `inst.vnc` → remote (VNC) install  
- `nomodeset` → fix black screen during install  
- `xdriver=vesa` → fallback video driver  
- `noipv6` → disable IPv6 if causing problems  




# 📘 Linux Install – Kickstart & Repo Boot Options (Modern Use)

## 🔹 Forcing Installer to Ask Repo
- `askmethod`  
  # Force installer to ask where to get packages (CD, DVD, Disk, NFS, HTTP, FTP).  

---

## 🔹 VNC Installation (Remote Install)
- `vnc`  
  # Run installation as a VNC server.  

- `vncconnect=hostname[:port]`  
  # Connect installer to a VNC client at given host:port.  

- `vncpassword=<password>`  
  # Require password (≥8 chars) for VNC access.  

---

## 🔹 Specifying Repository Location
- `repo=hd:/dev/sda1:/myrepo`  
  # From local hard disk (partition + path).  

- `repo=http://server/myrepo`  
  # From web server.  

- `repo=ftp://ftpserver/myrepo`  
  # From FTP server.  

- `repo=cdrom`  
  # From local CD/DVD.  

- `repo=nfs::server:/myrepo/`  
  # From NFS share.  

- `repo=nfsiso::server:/dir/rhel.iso`  
  # From ISO image on NFS server.  

---

## 🔹 Specifying Kickstart File Location
- `ks=cdrom:/dir/ks.cfg`  
  # From CD/DV





# 📘 Linux Install – Miscellaneous Boot Options & Storage

## 🔹 Useful Boot Options
- `rescue`  
  # Boot into Linux **rescue mode** (repair a broken system).  

- `mediacheck`  
  # Verify installation media (CD/DVD/ISO) for checksum errors.  

---

## 🔹 Specialized Storage Devices (Enterprise Use)

- **Firmware RAID**  
  - RAID built into BIOS → can boot OS.  

- **Multipath Devices**  
  - Multiple paths to same storage (via iSCSI or FCoE).  
  - Benefits: performance + redundancy.  

- **SAN (Storage Area Network)**  
  - External enterprise storage (used in data centers).  

---

## 🔹 Info Needed for Setup
- **iSCSI**  
  - Target IP address.  
  - Authentication credentials (from storage admin).  

- **FCoE (Fibre Channel over Ethernet)**  
  - Network interface connected to FCoE switch.  
  - Scan interface for available devices.  

---

# ✅ Key Points to Remember
- `rescue` → repair mode boot.  
- `mediacheck` → validate install media.  
- Enterprise installs may use **RAID, iSCSI, FCoE, SAN** for storage.  
- Always ask storage admin for **IP, credentials, or interface details** when configuring iSCSI/FCoE.  





# 📘 Linux Install – Partitioning Hard Drives

## 🔹 Why Partition?
- 🖥️ **Dual-boot** → Linux + Windows need separate partitions.  
- 📂 **Multiple partitions in Linux** → prevents one directory from filling the whole system.  
- 🔒 **Security** → if /var fills up, it won’t break the whole OS.  
- 💾 **Backups** → easier to back up /home separately.  
- ⚡ **Different filesystems** → some features (quotas, read-only, journaling).  

---

## 🔹 Important Partition Types
- **Linux partition** → ext4 (common), XFS (default in RHEL 8).  
- **LVM (Logical Volume Manager)** → allows resizing & flexible storage (recommended).  
- **RAID partition** → redundancy or speed (for servers).  
- **Swap partition** → virtual memory.  

---

## 🔹 Partitioning Tips
- ✅ Install **Windows first** when dual-booting.  
- ✅ Use **Linux tools** (`fdisk`, `parted`, installer GUI) for Linux partitions.  
- 📦 **MBR** → max 4 primary partitions.  
- 📦 **GPT** → up to 128 partitions (modern default).  
- 📦 **LVM** → unlimited logical volumes (recommended for `/home` etc.).  

---

## 📂 Recommended Separate Partitions
| Directory | Why Separate? |
|-----------|----------------|
| `/boot` | Stores kernels/bootloader. Keep small (~1 GB). |
| `/usr` | Contains apps & utilities. Can be mounted read-only for security. |
| `/var` | Stores logs, web, FTP data. Prevents attack/fill-up from crashing OS. |
| `/home` | Stores user files. Easier backups, can grow with LVM, supports quotas. |
| `/tmp` | Temp files. Keeps apps working even if disk fills. |

---

## 🔹 Modern Defaults
- Most modern installs →  
  - `/` (root)  
  - `/home` (LVM, resizable)  
  - `swap`  
  - `/boot` (sometimes separate)  
- Servers may also separate `/var` (logs, web/ftp) for securit




# 📘 Linux Install – Using the GRUB Boot Loader

## 🔹 What is GRUB?
- **GRUB (GRand Unified Bootloader)** = the program that loads Linux (and other OS).  
- **GRUB Legacy (v1)** = old, not used today.  
- **GRUB 2** = current default in RHEL, Fedora, Ubuntu.  

---

## ⚙️ Useful Boot Options at GRUB
- You can edit kernel boot line in GRUB (press `e` key at menu).  
- Add runlevel number at end → boot into specific mode:  
  - `1` → Single-user mode (recovery, reset root password).  
  - `3` → Multi-user, with network, no GUI (safe if GUI broken).  
  - `5` → Full GUI mode.  
- Remove `rhgb quiet` → show detailed boot messages instead of splash screen.  
- Press **Esc** during boot → also shows messages.  

---

## 🔹 GRUB 2 Key Files
- BIOS systems: `/boot/grub2/grub.cfg`  
- EFI systems: `/etc/grub2-efi.cfg`  
- ⚠️ Do not edit `grub.cfg` directly. It is **auto-generated** from:  
  - `/etc/default/grub` (main settings like timeout, default kernel, splash options)  
  - `/etc/grub.d/` (scripts that build entries)  
- After editing config files → regenerate `grub.cfg`:  
  - `grub2-mkconfig -o /boot/grub2/grub.cfg`  

---

## 🔹 GRUB 2 Features
- Supports scripting (loops, variables, functions).  
- Uses **UUIDs or labels** to identify disks (safer than `/dev/sda` → avoids errors if new disks are added).  
- Fedora/RHEL: Boot menu entries are stored in `/boot/loader/entries/*.conf`.  

---



- `linux` → path to kernel file.  
- `initrd` → path to initial RAM disk (drivers needed at boot).  
- `options` → boot parameters (networking, graphics, security, etc.).  

---

## 🔹 Other Boot Loaders
- **SYSLINUX** (not used for installed systems):  
  - `isolinux` → boot CDs/DVDs (ISO9660).  
  - `syslinux` → boot USB sticks.  
  - `pxelinux` → PXE network booting.  

---

# ✅ Key Points to Remember
- GRUB 2 is the **default Linux bootloader** (ignore Legacy).  
- Boot modes: `1` (single-user), `3` (multi-user without GUI), `5` (GUI).  
- Remove `rhgb quiet` → see detailed boot logs.  
- Config: edit `/etc/default/grub` + `/etc/grub.d/`, then run `grub2-mkconfig`.  
- GRUB uses **UUIDs** instead of device names.  
- Fedora/RHEL boot menu entries stored in `/boot/loader/entries/`.  
- SYSLINUX = for CDs, USBs, PXE boot, not for installed systems.  
