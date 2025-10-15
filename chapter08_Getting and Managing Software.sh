# 📘 Linux Bible Notes – Getting and Managing Software (Intro + Desktop Tools)

## 🔹 Overview
- 📦 Linux software comes in **packages** (RPM for Fedora/RHEL, DEB for Debian/Ubuntu).  
- 🛠️ Tools exist to:  
  - Install software  
  - Update software  
  - Remove software  
  - Query (check info about) software  
- ⚡ Modern distros make this easy → graphical tools + powerful CLI (dnf, yum, rpm, apt).  

---

## 🔹 Installing Software from Desktop (Fedora/Ubuntu)
- Fedora → **Software window** (GNOME Software).  
- Ubuntu → **Ubuntu Software** window.  
- 📌 Open it:  
  - Go to **Activities → type “Software” → Enter**.  
- 🔧 Features:  
  - 📥 Install apps (search by name, categories, Editor’s Picks).  
  - 📂 Installed tab → shows installed software.  
  - 🔄 Updates tab → shows packages with updates.  
  - ❌ Remove → click “Remove” button next to app.  
- ⚡ Default repo = Fedora’s official software repo (hundreds of apps).  
- 📌 Optional → Enable **third-party repos** (for free but not redistributable apps).  

---

## 🔹 Why Go Beyond the Software Window?
1. **More repositories**  
   - Fedora/RHEL include only free & open-source software.  
   - For non-free or commercial software (e.g., Flash, codecs) → enable extra repos:  
     - Example: `rpmfusion.org`.  

2. **Tens of thousands of packages**  
   - GUI tools show only **desktop apps**.  
   - Many CLI tools, services, programming libs, docs are hidden.  
   - Use CLI (`dnf`, `yum`, `rpm`) to access them.  

3. **Flexibility**  
   - GUI install often pulls multiple related packages (docs, fonts, plugins, language packs).  
   - With CLI, you can pick **exact packages** you want.  

4. **Complex queries**  
   - `yum` / `dnf` / `rpm` allow searching, filtering, and detailed info about packages.  

5. **Software validation**  
   - `rpm` can check signatures → confirm package not modified.  
   - Detect tampered/corrupted files.  

6. **Enterprise scale**  
   - GUI fine for one desktop.  
   - Enterprises need **CLI tools + automation** to manage many systems.  
   - Tools built on top of `rpm` are designed for that.  

---

## 🔹 Transition to Next Sections
- Next → how packaging works:  
  - **RPM packages** (used in RHEL/Fedora/CentOS).  
  - **DEB packages** (used in Debian/Ubuntu/Mint).  
- Then → CLI tools:  
  - `dnf` / `yum` (modern, dependency resolution).  
  - `rpm` (low-level, manual).  

---

# ✅ Key Points to Remember
- GUI **Software windows** = easiest for casual desktop apps.  
- For advanced usage: CLI (`dnf`, `yum`, `rpm`).  
- Use CLI for:  
  - More repos (rpmfusion, custom repos).  
  - Access hidden packages.  
  - Exact control of installs.  
  - Validation and enterprise management.  
- Fedora/RHEL → RPM-based.  
- Ubuntu/Debian → DEB-based.  





# 📘 Linux Bible Notes – Understanding Linux RPM and DEB Software Packaging

## 🔹 Early Days of Software Installation
- 📂 Originally software came as **source code** → user had to compile manually.  
- 📦 Early distribution method = **tarball** (`.tar.gz` or `.tgz`)  
  - Tarball = one compressed file containing many files (executables, docs, configs, libraries).  
  - Files spread into system dirs:  
    - 📂 `/usr/share/man` → manuals  
    - 📂 `/etc` → configs  
    - 📂 `/bin` → commands  
    - 📂 `/lib` → libraries  

---

## ⚠️ Problems with Tarball Installations
1. 🔗 **Dependencies** → user had to manually find and install required libraries/tools.  
2. 📑 **Tracking files** → no easy way to list what was installed and where.  
3. ❌ **Removing software** → no uninstall process unless you had original file list.  
4. 🔄 **Updating** → no metadata; hard to know version installed → difficult bug fixes or upgrades.  

---

## 🔹 Solution → Linux Package Management
- Packages evolved into **standard formats with metadata** to handle:  
  - Dependencies automatically 🔗  
  - File tracking 📑  
  - Easy removal ❌  
  - Easy updates 🔄  

---

## 📀 Two Main Packaging Formats
### 1. DEB Packaging
- 📂 **File extension** → `.deb`  
- 👥 Created by: **Debian GNU/Linux project**  
- 🌐 Used in: Debian, Ubuntu, Linux Mint, KNOPPIX, etc.  
- 🛠️ Tools:  
  - `dpkg` (low-level, install/remove DEB files).  
  - `apt-get` / `apt` (high-level, handles dependencies, repos).  

---

### 2. RPM Packaging
- 📂 **File extension** → `.rpm`  
- 👥 Created by: **Red Hat (originally Red Hat Package Manager)**  
- 📌 Now called: **RPM Package Manager** (recursive name).  
- 🌐 Used in: RHEL, Fedora, CentOS, SUSE, Oracle Linux.  
- 🛠️ Tools:  
  - `rpm` (basic install, query, remove packages).  
  - `yum` (added later → handled dependencies automatically).  
  - `dnf` (modern replacement for yum → default in Fedora/RHEL 8+).  

---

## 🔹 RPM vs DEB Debate
- ⚡ **RPM** → preferred in enterprise for stability, large-scale management.  
- ⚡ **DEB** → very popular among community/enthusiasts (easy to use, apt is powerful).  
- 📌 Both provide:  
  - Easy installation 📥  
  - Dependency resolution 🔗  
  - Updates 🔄  
  - Removal ❌  
  - Security validation 🔐  

---

# ✅ Key Points to Remember
- 📦 Early tarballs were simple but lacked dependency + management.  
- 📀 Two main formats today:  
  - **.deb** (Debian/Ubuntu family, managed with `apt`/`dpkg`).  
  - **.rpm** (RHEL/Fedora family, managed with `dnf`/`yum`/`rpm`).  
- 🔐 Both include metadata to track files, handle dependencies, and verify authenticity.  
- ⚡ RPM = enterprise focus, DEB = community popularity.  



# 📘 Linux Bible Notes – Understanding DEB Packaging

## 🔹 What is a DEB Package?
- 📦 **DEB (.deb)** = Debian software package format.  
- 📂 Internally an **ar archive** file containing:  
  - Executables (commands 🖥️)  
  - Configuration files ⚙️  
  - Documentation 📚  
  - Libraries 📂  
- 📝 Metadata inside DEB:  
  - Dependencies 🔗  
  - Licensing 📜  
  - Package size 💾  
  - Descriptions 📝  
  - Other info for package managers  

---

## 🔹 Tools for Managing DEB Packages
1. 🖥️ **Ubuntu Software Center**  
   - GUI tool for Ubuntu/Debian-based systems.  
   - 🌐 Lets you search packages by keyword or by category.  
   - 📥 Install/remove software easily.  

2. 🖥️ **aptitude**  
   - Text-based, screen-oriented tool (runs in terminal).  
   - Use **arrow keys** to navigate, **Enter** to select.  
   - Can upgrade, install, or view packages.  

3. 🖥️ **apt* family (most common)**  
   - Includes: `apt-get`, `apt`, `apt-config`, `apt-cache`, etc.  
   - Used to install, update, upgrade, query, and remove software.  

---

## 🔹 Important apt Commands (with sudo 🔑)
- `sudo apt-get update`  
  - Refresh package list from repositories 🌐.  
  - Must be run before installing/upgrading packages.  

- `sudo apt-cache search vsftpd`  
  - Search repository for a package by keyword 🔎.  

- `sudo apt-cache show vsftpd`  
  - Show details about a package (description, dependencies, size, version).  

- `sudo apt-get install vsftpd`  
  - Install the package (here: **vsftpd** = Very Secure FTP Daemon).  

- `sudo apt-get upgrade`  
  - Upgrade all installed packages if newer versions available.  

- `sudo apt-cache pkgnames`  
  - List all package names available in repo.  

---

## 🔹 Notes
- 🔑 Administrative commands use **sudo** (Ubuntu practice).  
- 📖 To learn more → run:  
  - `man apt`  
  - `man apt-get`  
- 🖥️ The **apt** command (newer) combines most functions of `apt-get` and `apt-cache` with simpler syntax.  

---

# ✅ Key Points to Remember
- 📦 **DEB** = standard package format for Debian/Ubuntu family.  
- 🛠️ Tools: Ubuntu Software Center (GUI), aptitude (TUI), apt* (CLI).  
- 🔑 Always use `sudo` for package management.  
- 🌐 Run `apt-get update` before installing/upgrading.  
- ⚡ Common workflow:  
  1. `sudo apt-get update`  
  2. `sudo apt-cache search <pkg>`  
  3. `sudo apt-get install <pkg>`  
  4. `sudo apt-get upgrade`  




# 📘 Linux Bible Notes – Understanding RPM Packaging (with Debian equivalents)

## 🔹 What is an RPM?
- 📦 **RPM (Red Hat Package Manager)** = package format for RHEL, Fedora, CentOS, SUSE.  
- 📂 Contains: executables 🖥️, configs ⚙️, docs 📖, libraries 📚, plus **metadata** (dependencies, version, license, source, etc.).  
- 🔑 Metadata allows system to know:  
  - Where package came from 🌐  
  - What version/build 📅  
  - What dependencies are needed 🔗  

---

## 🔹 Checking Installed RPM Packages (RHEL/Fedora)
- `rpm -q firefox`  
  - **-q = query**  
  - Shows if Firefox installed + version.  
  - Example output:  
    ```
    firefox-67.0-4.fc30.x86_64
    ```
    - **firefox** = base name  
    - **67.0** = version  
    - **4.fc30** = release, Fedora build  
    - **x86_64** = 64-bit architecture  

---

## 🔹 More Detailed Info
- `rpm -qi firefox`  
  - **-qi = query info**  
  - Shows: Name, Version, Release, Architecture, Install Date, Size, License, URL, Summary, Description.  
  - Example fields:  
    - 📦 **Name**: firefox  
    - 🏷️ **Version**: 67.0  
    - 🔖 **License**: MPLv1.1 / GPLv2+ / LGPLv2+  
    - 🌐 **URL**: https://www.mozilla.org/firefox/  
    - 📖 **Description**: Mozilla Firefox web browser.  

---

## 🔹 Where Do RPMs Come From?
- 📌 **Upstream projects** → create software (e.g., Mozilla for Firefox).  
- 📂 Distributions (Fedora, RHEL) → compile code → binaries + docs + configs → package into `.rpm`.  
- 🔐 Packages signed (GPG key   (  SEE THIS LINE CODE IN BOOK MAY BE CHAT CUT AFTER THIS SEE IN BOOK WHICH TOPIC IS COMING AFTER THAT)





# 📘 Linux Bible Notes – Managing RPM Packages with YUM (and DNF + Debian Equivalents)

## 🔹 Why YUM?
- ⚡ **Problem solved**: RPM dependency hell (manual installs failed if deps missing).  
- 🛠️ **YUM (Yellowdog Updater, Modified)** introduced:  
  - Treats packages as part of **repositories** 🌐 not just single files.  
  - Automatically resolves dependencies 🔗.  
  - Pulls required packages from repos during install.  

---

## 🔹 Repositories
- 📂 **Repos** = collections of RPMs, metadata, signatures.  
- 🌐 Can be hosted on:  
  - Web server → `http://`  
  - FTP server → `ftp://`  
  - Local media (CD/DVD) 📀  
  - Local filesystem → `file://`  
- 📂 Repo configs:  
  - `/etc/yum.conf` (main config).  
  - `/etc/yum.repos.d/*.repo` (separate repo files).  

Example repo file (`/etc/yum.repos.d/myrepo.repo`):  



[myrepo]
name=My repository of software packages
baseurl=http://myrepo.example.com/pub/myrepo

enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/MYOWNKEY




- `[myrepo]` → repo ID.  
- `baseurl` → repo location.  
- `enabled=1` → repo active.  
- `gpgcheck=1` → verify with GPG key.  
- `gpgkey=` → path to GPG key.  

---

## 🔹 Transition to DNF
- **DNF = Dandified YUM** (modern replacement).  
- 🌐 Default in Fedora 18+, RHEL 8+.  
- **yum** command today = symlink → `dnf`.  
- Same syntax, but DNF has strict API, plugin system, better performance.  
- 📂 Config files moved: `/etc/dnf/dnf.conf`.  

---

## 🔹 Basic Syntax





Example:  
- `yum install firefox`  
- `dnf install firefox`  

YUM/DNF → find latest version in repo, resolve deps, download + install.  

---

## 🔹 Important Settings (`/etc/yum.conf`)
- `gpgcheck=1` → validate packages with GPG key 🔐.  
- `installonly_limit=3` → keep last 3 versions of same package (esp. kernels).  
- `clean_requirements_on_remove=True` → auto-remove unused deps ❌.  
- `cachedir=/var/cache/yum/...` → where cache files stored 📂.  
- `logfile=/var/log/yum.log` → YUM log 📖.  
- `debuglevel=2` → log verbosity (increase for more details).  
- `exactarch=1` → only install matching CPU arch packages.  
- `plugins=1` → enable plugin support.  

👉 Extra repos go into `/etc/yum.repos.d/*.repo`.  

---

## 🔹 YUM/DNF Useful Commands
- 📥 Install:  
  - `dnf install <package>`  
- ❌ Remove:  
  - `dnf remove <package>`  
- 🔄 Update all:  
  - `dnf update`  
- 🔎 Search:  
  - `dnf search <keyword>`  
- 🔎 Info:  
  - `dnf info <package>`  
- 📦 List installed:  
  - `dnf list installed`  

---

## 🔹 Debian/Ubuntu Equivalent (APT)
- 📦 Same concept: uses **repositories** stored in `/etc/apt/sources.list` and `/etc/apt/sources.list.d/*.list`.  

### 🛠️ apt commands:
- 📥 Install: `sudo apt install <package>`  
- ❌ Remove: `sudo apt remove <package>`  
- 🔄 Update repos: `sudo apt update`  
- 🔄 Upgrade all: `sudo apt upgrade`  
- 🔎 Search: `apt search <keyword>`  
- 🔎 Info: `apt show <package>`  
- 📦 List installed: `dpkg -l`  

Example sources file (`/etc/apt/sources.list.d/myrepo.list`):  




---

# ✅ Key Points to Remember
- 📦 YUM/DNF solve **dependency hell** → use repos, not manual RPMs.  
- 📂 Repo configs in `/etc/yum.repos.d/*.repo` (RHEL/Fedora) or `/etc/apt/*.list` (Debian).  
- 🔐 GPG check ensures authenticity.  
- ⚡ YUM = older, DNF = modern (default in RHEL8+, Fedora).  
- 💻 CLI usage is almost identical to APT on Debian.  



# 📘 Linux Bible Notes – Downloading & Installing RPM Packages with YUM/DNF

## 🔹 Step 1: Downloading Metadata
- 📂 Each YUM/DNF repository has a `repodata/` directory.  
- ⚡ Presence of `repodata` = confirms valid repository.  
- 📥 Metadata (package info, dependencies, groups) is downloaded to local cache:  
  - `/var/cache/yum` (YUM)  
  - `/var/cache/dnf` (DNF)  
- ⏱️ Timeout for refreshing metadata:  
  - YUM → 6 hours  
  - DNF → 48 hours  
- 🔧 Can adjust with:  
  - `metadata_expire=<time>` in `/etc/yum.conf` or `/etc/dnf/dnf.conf`.

---

## 🔹 Step 2: Dependency Resolution
- 🛠️ User requests package → YUM/DNF checks required dependencies 🔗.  
- ⚡ If deps needed → lists them → asks confirmation (yes/no).  
- 📥 Packages + dependencies downloaded into cache dirs before install.  

---

## 🔹 Step 3: Installation Process
- After download, YUM/DNF uses **rpm** under the hood:  
  1. 🔑 Run **pre-install scripts** (e.g., create users, prepare directories).  
  2. 📂 Copy files to correct locations in Linux filesystem (per metadata).  
  3. 🔧 Run **post-install scripts** (configure services, enable features).  

---

## 🔹 Step 4: Updating Local RPM Database
- 📂 Metadata of installed packages is stored in:  
  - `/var/lib/rpm` (RPM database).  
- 📑 Database contains: package name, version, files installed, scripts, changelogs.  
- 🛠️ Query with:  
  - `rpm -qa` → list all installed packages.  
  - `rpm -ql <package>` → list files installed by package.  
  - `rpm -qi <package>` → show package info.  
  - `rpm -V <package>` → verify integrity (check for tampering).  

---

## 🔹 Debian/Ubuntu Equivalent (APT)
- 📥 Metadata stored in `/var/lib/apt/lists/` (downloaded during `apt update`).  
- 📂 Installed package database = `/var/lib/dpkg/status`.  
- 🛠️ Equivalent commands:  
  - `apt update` → refresh metadata.  
  - `apt install <package>` → install package.  
  - `dpkg -L <package>` → list files installed.  
  - `apt show <package>` → package details.  
  - `debsums -s` → verify integrity (if `debsums` installed).  

---

# ✅ Key Points to Remember
- 📥 Metadata downloaded first → cached locally.  
- 🔗 YUM/DNF automatically resolves dependencies.  
- ⚙️ Install process runs **pre-install → file copy → post-install scripts**.  
- 📂 Installed package info stored in `/var/lib/rpm` (RHEL/Fedora) or `/var/lib/dpkg/status` (Debian).  
- 🛠️ `rpm` (RHEL) and `dpkg/apt` (Debian) allow queries & verification.  
- ⚡ Repositories must have `repodata` (RHEL) or `Packages.gz` (Debian).  





# 📘 Linux Bible Notes – YUM with Third-Party Repositories + Managing Software

## 🔹 Third-Party Repositories
- 📂 Fedora/RHEL official repos → only **open & redistributable software**.  
- ⚠️ Third-party repos may:  
  - ❌ Contain closed-source or patent-restricted software.  
  - ⚡ Cause package conflicts.  
  - 🐌 Slow installation (extra metadata downloads).  

👉 Recommended safe repos:  
- 🌐 **RPM Fusion** (Fedora): http://rpmfusion.org  
- 🌐 **EPEL (Extra Packages for Enterprise Linux)** (RHEL): https://fedoraproject.org/wiki/EPEL  

### 🛠️ Enable RPM Fusion (Fedora)
```bash
# Enable Free repo
rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm  

# Enable Nonfree repo (codecs, multimedia, etc.)
rpm -Uvh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-stable.noarch.rpm






🛠️ Debian/Ubuntu Equivalent

📂 Enable extra repos in:

/etc/apt/sources.list

or /etc/apt/sources.list.d/*.list


deb http://deb.debian.org/debian/ bookworm main contrib non-free
deb http://security.debian.org/debian-security bookworm-security main contrib non-free



yum search editor         # 🔎 Find packages by keyword
yum info emacs            # 📑 Show details of package
dnf search editor         # Same with DNF
dnf info emacs


apt search editor         # 🔎 Find by keyword
apt show emacs            # 📑 Show details


yum provides dvdrecord    # Find which package gives this file/command



apt-file search dvdrecord


yum list emacs            # Show version & repo of package
yum list available        # Packages available but not installed
yum list installed        # Installed packages
yum list all              # All packages



apt list emacs
apt list --installed
apt list --all-versions


yum deplist emacs | less  # Show dependencies and providers


apt depends emacs         # Show dependencies
apt rdepends emacs        # Reverse dependencies


📌 Installing and Removing Packages (Linux Bible Notes)

🛠️ Command: Install a package (with dependencies)  
# yum install emacs  
- 📥 Installs `emacs` + required dependencies.  
- 🔗 Dependencies auto-added (example: `emacs-common`, `ImageMagick-libs`, `fftw-libs-double`).  
- ⚡ Shows download size vs installed size.  
- 🔑 Confirmation: asks "Is this ok [y/N]" → press `y`.  
- 🛠️ Option: `-y` = auto-yes (skip manual confirmation).  

📂 Config file (RHEL/Fedora): `/etc/yum.conf`  
📂 Config file (Debian/Ubuntu): `/etc/apt/sources.list`  

---

🛠️ Command: Reinstall a package (restore missing files)  
# yum reinstall zsh  
- Example: if `/bin/zsh` deleted by mistake, reinstalls missing files.  
- ⚡ Normal `yum install zsh` → says "nothing to do" (because package already installed).  
- Use `reinstall` instead.  

Debian/Ubuntu Equivalent:  
# sudo apt install --reinstall zsh  

---

❌ Command: Remove a package (with unused dependencies)  
# yum remove emacs  
- Removes `emacs` + dependencies not needed by other packages.  
- ⚡ Shows freed disk space (real size used on system, not download size).  

Debian/Ubuntu Equivalent:  
# sudo apt remove emacs  
# sudo apt autoremove   ← removes leftover dependencies  

---

🕑 Command: View history of yum actions  
# yum history  
- Shows all previous install/remove actions with ID.  

🔎 Command: View details of a transaction  
# yum history info 12  
- Shows packages installed/removed in transaction ID 12.  

❌ Undo a transaction (remove all packages installed in one operation)  
# yum history undo 12  
- Removes all packages installed in transaction 12.  
- ✅ Useful if you installed many packages by mistake.  

Debian/Ubuntu Equivalent:  
# grep "install " /var/log/apt/history.log   ← see history  
# sudo apt remove <pkgname>                 ← manual undo (no direct undo option like yum)  

---

✅ Summary  
- 📥 `yum install pkg` → installs with dependencies.  
- 🔑 `-y` → skip confirmation.  
- 🛠️ `yum reinstall pkg` → restore missing files.  
- ❌ `yum remove pkg` → remove + unused dependencies.  
- 🕑 `yum history` → show past installs/removals.  
- 🔎 `yum history info <ID>` → details of that action.  
- ❌ `yum history undo <ID>` → undo a whole install/remove.  
- Debian: use `apt install`, `apt remove`, `apt autoremove`, `apt install --reinstall`. No full history undo, only logs.  


📌 Updating Packages & Groups (Linux Bible Notes)

🛠️ Command: Check available updates  
# yum check-update  
- 🔎 Lists packages with newer versions in repos.  
- Example output: `firefox`, `NetworkManager`, etc.  

Debian/Ubuntu Equivalent:  
# sudo apt update      ← refresh repo lists  
# apt list --upgradable ← show upgradeable packages  

---

🛠️ Command: Update all packages  
# yum update  
- 📥 Downloads and installs all new versions of installed packages.  
- 🔗 Resolves dependencies automatically.  
- ⚡ Multiple packages can be updated in one transaction.  
- 🔑 Asks for confirmation (`y`).  

Debian/Ubuntu Equivalent:  
# sudo apt upgrade  

---

🛠️ Command: Update a single package  
# yum update cups  
- 📥 Updates `cups` package.  
- 🔗 If dependencies need update, they are included.  

Debian/Ubuntu Equivalent:  
# sudo apt install --only-upgrade cups  

---

📦 Package Groups in YUM  

🔎 Command: List all package groups  
# yum grouplist | less  
- Shows installed groups, available groups, and environment groups.  
- Example groups: `GNOME Desktop Environment`, `LibreOffice`, `C Development Tools`.  

Debian/Ubuntu Equivalent:  
# sudo apt-cache search task-   ← lists available task groups  
# tasksel --list-tasks          ← shows Debian task groups  

---

🔎 Command: View details of a group  
# yum groupinfo LXDE  
- Shows description and package types:  
  - Mandatory Packages (always installed)  
  - Default Packages (installed by default, but optional to skip)  
  - Optional Packages (can be added manually)  

Debian/Ubuntu Equivalent:  
# tasksel show lxde-desktop  

---

📥 Command: Install a group  
# yum groupinstall LXDE  
- Installs all packages in LXDE group.  
- Example: 101 packages installed, 5 updated.  

Debian/Ubuntu Equivalent:  
# sudo tasksel install lxde-desktop  

---

❌ Command: Remove a group  
# yum groupremove LXDE  
- Removes all packages that belong to LXDE group.  

Debian/Ubuntu Equivalent:  
# sudo tasksel remove lxde-desktop  



📌 Maintaining RPM Database & Cache + Installing/Removing with rpm  

📂 Cache Location  
- Packages/metadata stored in: `/var/cache/yum/`  
- Config file: `/etc/yum.conf` (option `keepcache=0` by default removes pkg files after install)  

---

🛠️ Clear cached data  

# yum clean packages  
❌ Removes cached package files (.rpm)  
# yum clean metadata  
❌ Removes repo metadata (forces fresh download next yum run)  
# yum clean all  
❌ Removes both cached pkgs + metadata  

Debian/Ubuntu Equivalent:  
# sudo apt clean         ← remove all cached .deb files  
# sudo apt autoclean     ← remove only outdated .deb files  

---

🔎 Check & Fix RPM database  

# yum check  
- Checks for RPM DB problems.  
- Example error: “rpmdb open failed” (corruption).  

# rpm --rebuilddb  
- Rebuilds the local RPM database.  
- Use when DB corrupted (e.g., power loss during install).  

📌 Note: `rpm` is the real tool for DB repair, not yum.  

Debian/Ubuntu Equivalent:  
(no rpm db; dpkg used)  
# sudo dpkg --audit      ← check broken packages  
# sudo dpkg --configure -a ← fix half-installed pkgs  

---

📥 Download RPM from repos without installing  

# yumdownloader firefox  
- Downloads latest firefox.rpm into current dir.  

# dnf download firefox  
- Modern command (yumdownloader deprecated).  

Debian/Ubuntu Equivalent:  
# apt download firefox  

---

📦 Installing, Upgrading, Freshening with rpm  

🛠️ Install package (only if not already installed)  
# rpm -i zsh-5.5.1-6.el8.x86_64.rpm  
- `-i` = install  

🛠️ Upgrade (install even if already present)  
# rpm -Uhv zsh-5.5.1-6.el8.x86_64.rpm  
- `-U` = upgrade (replace older if present)  
- `-h` = show hash progress bar  
- `-v` = verbose  

🛠️ Freshen (update only if package already installed)  
# rpm -Fhv *.rpm  
- `-F` = freshen (skip pkgs not already installed)  

---

🔗 Special options  

# rpm -Uhv --replacepkgs emacs-26.1.rpm  
- Reinstalls same version (if files deleted).  

# rpm -Uhv --oldpackage zsh-5.0.2.rpm  
- Downgrades to older version.  

---

❌ Remove package  

# rpm -e emacs  
- Removes package by base name only.  
- ⚠️ Dependencies are not auto-removed (unlike yum).  
- Example: removing `emacs` leaves behind `emacs-common` if not required by others.  
- If you try to remove `emacs-common` first → fails with “Failed dependencies”.  

Debian/Ubuntu Equivalent:  
# sudo dpkg -i pkg.deb           ← install .deb  
# sudo dpkg -r pkgname           ← remove (no dep cleanup)  
# sudo apt install ./pkg.deb     ← preferred install (handles deps)  



📌 Querying & Verifying RPM Packages  

🛠️ Query Installed Package Info  

# rpm -qi zsh  
- `-q` = query  
- `-i` = info (name, version, release, description)  

# rpm -ql zsh  
- `-l` = list files installed by package  

# rpm -qd zsh  
- `-d` = list documentation files  

# rpm -qc zsh  
- `-c` = list configuration files  

---

🔗 Dependency / Capability Queries  

# rpm -q --requires emacs-common  
- Shows required dependencies (needed commands/libs).  

# rpm -q --provides emacs-common  
- Shows what the package provides (features, libraries, virtual pkg names).  

# rpm -q --scripts httpd  
- Shows pre/post install/remove scripts inside the package.  

# rpm -q --changelog httpd | less  
- Shows changelog history (who changed what, when, and why).  

---

📂 Querying RPM Metadata Tags  

# rpm --querytags | less  
- Lists all available info tags (e.g., ARCH, VERSION, RELEASE, etc).  

# rpm -q binutils --queryformat "The package is %{NAME} and the release is %{RELEASE}\n"  
- Custom output using tags.  

---

🛠️ Querying an RPM File (not installed yet)  

# rpm -qip zsh-5.7.1-1.fc30.x86_64.rpm  
- Info from a package file (`-p` = query file).  

# rpm -qlp zsh-5.7.1-1.fc30.x86_64.rpm  
- List files inside the rpm.  

# rpm -qdp zsh-5.7.1-1.fc30.x86_64.rpm  
- Show docs from the rpm.  

# rpm -qcp zsh-5.7.1-1.fc30.x86_64.rpm  
- List config files in the rpm.  

---

🛠️ Verifying Packages  

# rpm -V zsh  
- `-V` = verify package integrity.  
- Compares installed files against RPM database fingerprints.  

Example output: 


missing c /etc/zshrc
S.5....T. /bin/zsh



🔑 Meaning of letters in verify output:  
- `S` = Size differs  
- `M` = Mode differs (permissions/type)  
- `5` = MD5 checksum differs  
- `D` = Device major/minor mismatch  
- `L` = Symlink path mismatch  
- `U` = User ownership differs  
- `G` = Group ownership differs  
- `T` = Modification time differs  
- `P` = Capabilities differ  

✅ Dots (`.`) = no problem.  

---

🛠️ Restore Package After Tampering  

# rpm -i --replacepkgs zsh-5.7.1-1.fc30.x86_64.rpm  
- Reinstalls same package version (force replace).  

or  

# yum reinstall zsh  
- Easier way with dependency handling.  

Then recheck:  
# rpm -V zsh → no output = package clean.  

---

📂 Backup Database  

- RPM DB location: `/var/lib/rpm/`  
- Good practice: copy to read-only media (CD/DVD/USB) for integrity checks.  

---

🐧 Debian/Ubuntu Equivalent  

- Query package info: `dpkg -s pkgname`  
- List files: `dpkg -L pkgname`  
- Docs/config: look under `/usr/share/doc/pkgname/` or `/etc/`  
- Check required dependencies: `apt-cache depends pkgname`  
- Provides: `apt-cache showpkg pkgname`  
- Verify installed files: `debsums -s pkgname` (needs `debsums` package)  



📌 Managing Software in the Enterprise (Linux Bible Notes)

🌐 RHEL Enterprise Package Management  
- Fedora → 1 big repo (public).  
- RHEL → subscription-based (Red Hat Subscription Management).  
  - Paid entitlements unlock multiple channels: RHEL OS, Virtualization, Software Collections, etc.  

⚡ Advantages of RPM in Enterprise  
- RPM installs without user interaction (no prompts).  
- Enables automation and large-scale deployments.  

---

🛠️ Kickstart Files  
- 📂 File containing answers to install questions + list of packages.  
- Provided at installer boot → auto-install completes without manual input.  
- Can include pre/post scripts (add users, edit configs).  
- Location: usually `/root/anaconda-ks.cfg` (default generated after install).  

---

🌐 PXE Boot (Preboot eXecution Environment)  
- Boot from network NIC (PXE-enabled).  
- Loads installer kernel + kickstart file.  
- Blank machine can boot from NIC → full OS install over network.  
- ⚡ Used in enterprise for mass deployments.  

---

🛠️ Satellite Server (Spacewalk)  
- Central RHEL management platform.  
- Deploy new systems + updates.  
- Automates software updates (schedule from Satellite).  
- Distributes **Errata** (package fixes/security patches) automatically.  

---

📦 Container Images  
- Bundle many RPMs into one image.  
- Easier to add, run, and delete than individual RPMs.  
- Useful for modern enterprise deployments (Docker/Podman model).  

---

🐧 Debian/Ubuntu Enterprise Equivalents  
- Kickstart → **Preseed / Autoinstall YAML** (Ubuntu).  
- PXE boot → also supported (with iPXE + Preseed/Autoinstall).  
- Satellite server → Ubuntu has **Landscape** or open-source tools like **Foreman**.  
- Containers → same concept via Docker/Podman images with `.deb` packages inside.  


