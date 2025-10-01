📌 Managing User Accounts (Linux Bible Notes)

📥 Install Cockpit (Web UI for managing users)  
# yum install cockpit -y  
# systemctl enable --now cockpit.socket  

📂 Config files updated when user is created:  
- `/etc/passwd` → stores user accounts  
- `/etc/group`  → stores group accounts  

---

🌐 Access Cockpit  
- Open browser → http://hostname:9090  
- Login as root (or sudo user)  
- Go to **Accounts → Create New Account**  

---

🛠️ Fields when creating new user (Cockpit GUI)  

- **Full Name** → stored as comment in `/etc/passwd`  
  (use real name, upper+lowercase allowed).  

- **Username** → login name  
  - Best practice: lowercase, ≤ 8 chars (though up to 32 allowed).  
  - Do not start with number.  
  - Avoid confusing names (e.g., Jsmith vs jsmith).  

- **Password**  
  - At least 8 chars (upper+lowercase, numbers, symbols).  
  - Should not be dictionary word / repeated pattern.  
  - Strength indicator shown (red→green).  

- **Access**  
  - Lock Account (disable login).  
  - Account details stored in `/etc/passwd`.  

---

🛠️ Modifying User in Cockpit  

1. Select user → modify options.  
2. Editable fields:  
   - Full Name (comment field).  
   - Roles:  
     - **Server Administrator** → adds user to `wheel` group (sudo/root).  
     - **Image Builder** → adds user to `weldr` group.  
   - Access: lock account permanently / lock until date / never lock.  
   - Password:  
     - Set new password.  
     - Force Change (user must reset next login).  
     - Can set password expiry (default = never).  
   - Authorized SSH Keys:  
     - Add public key for passwordless SSH login.  

3. Changes apply immediately (no restart needed).  

---

🐧 Debian/Ubuntu Equivalent  

📥 Install Cockpit:  
# sudo apt install cockpit -y  
# sudo systemctl enable --now cockpit.socket  

🌐 Access: http://hostname:9090 (same process).  

Config files:  
- `/etc/passwd` → users  
- `/etc/group`  → groups  

(Next section of book: `useradd` & `usermod` command line usage).  



📌 Adding Users with useradd (Linux Bible Notes)

🛠️ Command: useradd  
# useradd [options] username  

📂 Config files updated:  
- `/etc/passwd` → main user info  
- `/etc/shadow` → encrypted password data  
- `/etc/group`  → group membership  
- `/etc/skel/`  → default files copied into home dir  

---

🔹 Common useradd options  

-c "comment"   → Full name / description (stored in /etc/passwd)  
-d home_dir    → Custom home directory path  
-D             → Save new defaults for future users  
-e YYYY-MM-DD  → Expiration date for account  
-f days        → Days after password expiry to disable acct (-1 = never, 0 = immediate)  
-g group       → Primary group (must exist in /etc/group)  
-G grouplist   → Supplementary groups (comma-separated)  
-k skel_dir    → Skeleton dir (default = /etc/skel, must use with -m)  
-m             → Create home directory (default in RHEL/Fedora)  
-M             → Do not create home directory  
-n             → Don’t auto-create private group (Fedora/RHEL specific)  
-o             → Allow duplicate UID (use with -u)  
-p passwd      → Encrypted password string (use passwd later if skipped)  
-s shell       → Login shell (default: /bin/bash)  
-u user_id     → Specific UID (default: next available ≥ 1000)  

---

📥 Example 1: Simple add  
# useradd -c "Sara Green" sara  
# passwd sara  
- Creates user `sara`  
- Adds entry in `/etc/passwd` and `/etc/group`  
- Creates `/home/sara` with contents of `/etc/skel/`  
- Prompts for password setup  

---

📥 Example 2: Advanced add  
# useradd -g users -G wheel,apache -s /bin/tcsh -c "Sara Green" sara  
- Primary group: `users`  
- Supplementary groups: `wheel, apache`  
- Shell: `/bin/tcsh`  
- Comment: "Sara Green"  
- Creates `/home/sara`  

Result in `/etc/passwd`:  
sara:x:1002:1007:Sara Green:/home/sara:/bin/tcsh  

Result in `/etc/group`:  
sara:x:1007:  

---

📂 File formats  

/etc/passwd fields → `username:password:UID:GID:comment:home:shell`  
- `x` in password field = real password stored in `/etc/shadow`.  

/etc/group fields → `groupname:password:GID:userlist`  
- Example: `sara:x:1007:` (private group created for user).  

---

🐧 Debian/Ubuntu differences  
- useradd works the same but defaults differ:  
  - `-m` required to create home dir (not default like RHEL).  
- Skeleton files copied from `/etc/skel/`.  
- Groups: by default added to `users` group (if private groups disabled).  



📌 Setting User Defaults (Linux Bible Notes)

📂 Config files for defaults  
- `/etc/login.defs` → password & UID/GID policies  
- `/etc/default/useradd` → useradd command defaults  
- `/etc/skel/` → skeleton files copied to new user’s home  

---

🔑 Common keywords in /etc/login.defs  

PASS_MAX_DAYS 99999   → max password lifetime  
PASS_MIN_DAYS 0       → min days before password change allowed  
PASS_MIN_LEN 5        → min password length  
PASS_WARN_AGE 7       → warn user 7 days before password expiry  

UID_MIN 1000 / UID_MAX 60000       → range for normal user IDs  
SYS_UID_MIN 200 / SYS_UID_MAX 999  → range for system accounts  

GID_MIN 1000 / GID_MAX 60000       → range for normal groups  
SYS_GID_MIN 201 / SYS_GID_MAX 999  → range for system groups  

CREATE_HOME yes → auto-create home dir when user added  

---

🛠️ View useradd defaults  

# useradd -D  
Shows defaults stored in `/etc/default/useradd`:  
GROUP=100  
HOME=/home  
INACTIVE=-1       ← -1 = disable never  
EXPIRE=           ← empty = no default expiry date  
SHELL=/bin/bash  
SKEL=/etc/skel  
CREATE_MAIL_SPOOL=yes  

---

🛠️ Change useradd defaults  

# useradd -D [options]  

Options allowed with `-D`:  
- -b default_home   → set default home base dir (ex: /home/everyone)  
- -e expire_date    → default account expiry date (YYYY-MM-DD)  
- -f inactive_days  → days after password expiry before disabling account  
- -g default_group  → default group for new users  
- -s default_shell  → default shell (ex: /bin/ash, /bin/tcsh)  

📥 Example:  
# useradd -D -b /home/everyone -s /bin/tcsh  
- Sets new default base dir = `/home/everyone`  
- Sets new default shell = `/bin/tcsh`  

---

📂 Skeleton directory (/etc/skel)  
- Files in `/etc/skel/` copied into every new user’s home dir.  
- Common: `.bashrc`, `.profile`, startup scripts.  

---

🛠️ Related user management commands  
- usermod → modify an existing account (groups, shell, etc.)  
- userdel → delete an account (and optionally its home dir).  

---

🐧 Debian/Ubuntu Notes  
- Same files: `/etc/login.defs`, `/etc/default/useradd`, `/etc/skel/`.  
- Defaults:  
  - Home dir = `/home/username` (unless -M used).  
  - Default shell = `/bin/bash`.  
- Command behavior same as RHEL.  



📌 Modifying Users with usermod (Linux Bible Notes)

🛠️ Command: usermod  
# usermod [options] username  

📂 Updates: `/etc/passwd`, `/etc/shadow`, `/etc/group` depending on change.  

---

🔹 Common usermod options  

-c "comment"   → Change description (full name).  
-d home_dir    → Change home directory path.  
   - Use with `-m` to move existing contents to new home.  

-e YYYY-MM-DD  → Set account expiration date.  
-f days        → Days after password expiry before disabling account.  
   - `-1` = never disable (default).  
   - `0` = disable immediately after password expiry.  

-g group       → Change primary group (must exist in `/etc/group`).  
-G grouplist   → Replace all secondary groups with new list.  
-aG grouplist  → Append new groups, keep existing ones.  

-l newname     → Change login name.  

-L             → Lock account (adds `!` at start of password in `/etc/shadow`).  
-U             → Unlock account (removes `!`).  

-s shell       → Change login shell (e.g., `/bin/bash`, `/bin/zsh`).  

-u uid         → Change user ID number.  
-o             → Allow non-unique UID (only valid with `-u`).  

---

📥 Examples  

# usermod -s /bin/csh chris  
- Changes login shell of `chris` to `csh`.  

# usermod -Ga sales,marketing chris  
- Adds `chris` to groups `sales, marketing`.  
- `-aG` ensures old groups remain.  
- Without `-a`, existing secondary groups removed.  

# usermod -d /mnt/homes/chris -m chris  
- Changes home dir to `/mnt/homes/chris` and moves files.  

# usermod -L chris  
- Locks `chris` account (cannot login).  

# usermod -U chris  
- Unlocks `chris` account.  

---

🐧 Debian/Ubuntu Notes  
- Same syntax, works identically.  
- Remember: always use `-aG` when adding groups, or you risk removing existing memberships.  



📌 Deleting Users with userdel (Linux Bible Notes)

🛠️ Command: userdel  
# userdel [options] username  

📂 Updates: `/etc/passwd`, `/etc/shadow`, `/etc/group`  

---

🔹 Options  

-r   → Remove user’s home directory + mail spool.  
(no -r) → Leaves home directory + files untouched.  

---

📥 Examples  

# userdel -r chris  
- Removes user `chris` from system.  
- Deletes `/home/chris` and mail spool.  

# userdel chris  
- Removes user account only.  
- Leaves `/home/chris` intact.  

---

⚠️ Files left behind  

- After deletion, files owned by UID still exist on disk.  
- Ownership shows as numeric UID (e.g., `504`) instead of username.  
- Security risk: files without valid owner can be misused.  

---

🔎 Finding files before/after deletion  

# find / -user chris -ls  
- Lists all files owned by user `chris`.  

# find / -uid 504 -ls  
- Lists all files owned by UID 504 (after user deleted).  

# find / -nouser -ls  
- Lists files that belong to no valid user (orphaned files).  

✅ Best practice: reassign ownership of important files before deleting user.  

---

🐧 Debian/Ubuntu Notes  
- Same syntax.  
- Use `sudo userdel -r username` to remove account + home dir.  
- Use `sudo deluser --remove-home username` (Debian-specific alternative).  



📌 Understanding Group Accounts (Linux Bible Notes)

📂 Example files & directories  
$ ls -ld /var/salesdocs /var/salesdocs/file.txt  
drwxrwxr-x. 2 root sales 4096 Jan 14 09:32 /var/salesstuff/  
-rw-rw-r--. 1 root sales    0 Jan 14 09:32 /var/salesstuff/file.txt  

- Directory `/var/salesstuff/` → group `sales` has **rwx** (read/write/execute).  
- File `file.txt` → group `sales` has **rw-** (read/write).  
- Any member of `sales` group can read/modify those.  

---

🔑 Group Basics  

- Each user has **1 primary group**.  
- RHEL/Fedora: default primary group = same as username.  
  Example `/etc/passwd`:  
  `sara:x:1002:1007:Sara Green:/home/sara:/bin/tcsh`  
  → `1007` = group ID.  

  Entry in `/etc/group`:  
  `sara:x:1007:`  

- A user can belong to **multiple supplementary groups**:  
  Example:  
  `sales:x:1302:joe,bill,sally,sara`  
  `marketing:x:1303:mike,terry,sara`  

- Only **root** can add users to groups. Users cannot self-assign.  

---

🛠️ Working with groups  

1. **Default file ownership**  
   - Files created by user → owned by their primary group.  
   - Example:  
     `sara` creates `file1` → group = `sara`.  

2. **Change primary group temporarily** (with newgrp)  
   [sara]$ newgrp sales  
   [sara]$ touch file2  
   [sara]$ ls -l file*  
   file1 → group = sara  
   file2 → group = sales  

   `exit` → returns to old primary group.  

3. **Temporary group membership using password**  
   - Root sets password:  
     # gpasswd sales  
   - User joins temporarily:  
     $ newgrp sales  
     (enters password)  

   → primary group = `sales` for that session.  

---

🐧 Debian/Ubuntu Notes  
- Behavior same (primary group = username by default).  
- `newgrp` and `gpasswd` also available.  
- Group files:  
  - `/etc/group` → group details.  
  - `/etc/gshadow` → stores group passwords (used by gpasswd).  



📌 Creating & Modifying Group Accounts (Linux Bible Notes)

🛠️ Create groups → groupadd  
# groupadd kings  
- Creates group `kings` with next available GID.  

# groupadd -g 1325 jokers  
- Creates group `jokers` with GID = 1325.  

📂 File updated: `/etc/group`  

---

🔎 GID ranges (Fedora/RHEL)  
- 0 → root group  
- 1–199 → reserved system groups (admin/service accounts)  
- 200–999 → can be used for custom admin groups  
- 1000+ → regular user groups  

(Older UNIX/Linux: system/admin groups up to 99 or 500 depending on distro).  

---

🛠️ Modify groups → groupmod  
# groupmod -g 330 jokers  
- Changes GID of `jokers` to 330.  

# groupmod -n jacks jokers  
- Renames group `jokers` → `jacks`.  

---

🛠️ Assign users to group (via usermod)  
# usermod -aG jacks sara  
- Adds user `sara` to supplementary group `jacks`.  
- `-aG` = append (without `-a`, old groups removed).  

---

🐧 Debian/Ubuntu Notes  
- Commands are the same (`groupadd`, `groupmod`).  
- GID ranges:  
  - 0–999 → system groups  
  - 1000+ → regular groups  



📌 Managing Users in the Enterprise – Access Control Lists (ACLs)

📂 ACLs vs. Basic Permissions  
- Traditional model → 1 user + 1 group per file.  
- ACLs → allow multiple users & groups with custom permissions.  
- Effective permission = **union** of all groups a user belongs to.  

---

🛠️ Enabling ACLs  
- Fedora/RHEL → enabled by default on new filesystems.  
- If adding disk later → mount with `acl` option.  
- Must be **owner of file** to set ACLs.  

---

🛠️ Commands for ACLs  

- Set ACL:  
  setfacl -m u:username:perms filename  
  setfacl -m g:groupname:perms filename  

- Remove ACL:  
  setfacl -x u:username filename  

- View ACLs:  
  getfacl filename  

---

📥 Example: user mary shares file  

[mary]$ touch /tmp/memo.txt  
[mary]$ ls -l /tmp/memo.txt  
-rw-rw-r--. 1 mary mary 0 Jan 21 09:27 /tmp/memo.txt  

[mary]$ setfacl -m u:bill:rw /tmp/memo.txt  
[mary]$ setfacl -m g:sales:rw /tmp/memo.txt  

[mary]$ ls -l /tmp/memo.txt  
-rw-rw-r--+ 1 mary mary 0 Jan 21 09:27 /tmp/memo.txt   ← `+` shows ACL set  

[mary]$ getfacl /tmp/memo.txt  
# file: tmp/memo.txt  
# owner: mary  
# group: mary  
user::rw-  
user:bill:rw-  
group::rw-  
group:sales:rw-  
mask::rw-  
other::r--  

---

🔑 ACL Mask (limits effective permissions)  

- Group permission sets a **mask** = max allowed for ACL users/groups.  

Example:  
[mary]$ chmod 644 /tmp/memo.txt  
[mary]$ getfacl /tmp/memo.txt  

# file: tmp/memo.txt  
user::rw-  
user:bill:rw-   #effective:r--  
group:sales:rw- #effective:r--  
mask::r--  
other::r--  

⚠️ Even though bill & sales have `rw-`, effective permission = `r--` because mask blocks writes.  

✅ Fix: raise group permission with chmod (e.g., `chmod 664`) so ACLs take effect.  

---

🐧 Debian/Ubuntu Notes  
- ACLs available via `acl` package.  
  # sudo apt install acl  
- Same commands: `setfacl`, `getfacl`.  
- Must mount filesystem with `acl` option if not enabled by default.  



📌 Setting Default ACLs (Linux Bible Notes)

📂 Purpose  
- Default ACLs = inherited by **new files/directories** created inside a directory.  
- Set with `d:` prefix in `setfacl`.  

---

🛠️ Example: Set default ACL for directory  

[mary]$ mkdir /tmp/mary  
[mary]$ setfacl -m d:g:market:rwx /tmp/mary/  

[mary]$ getfacl /tmp/mary/  
# file: tmp/mary/  
user::rwx  
group::rwx  
other::r-x  
default:user::rwx  
default:group::rwx  
default:group:sales:rwx  
default:group:market:rwx  
default:mask::rwx  
default:other::r-x  

🔎 Explanation:  
- `default:group:market:rwx` → new files/dirs inside `/tmp/mary/` inherit these perms.  

---

🛠️ Test by creating subdir  

[mary]$ mkdir /tmp/mary/test  
[mary]$ getfacl /tmp/mary/test  

# file: tmp/mary/test  
user::rwx  
group::rwx  
group:sales:rwx  
group:market:rwx  
mask::rwx  
other::r-x  
default:user::rwx  
default:group::rwx  
default:group:sales:rwx  
default:group:market:rwx  
default:mask::rwx  
default:other::r-x  

✅ Inheritance confirmed: subdir has same default ACLs.  

---

🛠️ Test by creating file  

[mary]$ touch /tmp/mary/file.txt  
[mary]$ getfacl /tmp/mary/file.txt  

# file: tmp/mary/file.txt  
user::rw-  
group::rwx   #effective:rw-  
group:sales:rwx   #effective:rw-  
group:market:rwx  #effective:rw-  
mask::rw-  
other::r--  

⚠️ Note: Regular files **never get execute (x)** by default → so effective perms reduced to `rw-`.  

---

🐧 Debian/Ubuntu Notes  
- Same commands (`setfacl`, `getfacl`).  
- Default ACL inheritance works the same way.  
- Needs `acl` package installed if not present.  



📌 Enabling ACLs (Linux Bible Notes)

📂 Default Behavior  
- Fedora/RHEL (xfs, ext2/3/4) → ACL enabled automatically when created by installer (`anaconda`) or mkfs.  
- Only need to enable ACL if filesystem was created on another system.  

---

🛠️ Check if ACL enabled  

# mount | grep home  
/dev/mapper/mybox-home on /home type ext4 (rw)  

# tune2fs -l /dev/mapper/mybox-home | grep "mount options"  
Default mount options: user_xattr acl  

- `user_xattr` → extended attributes (used by SELinux).  
- `acl` → ACL support enabled.  

---

🛠️ Enable ACL via superblock  

# tune2fs -o acl /dev/sdc1  
- Implants ACL option into filesystem superblock.  

# tune2fs -l /dev/sdc1 | grep "mount options"  
Default mount options: acl  

- Permanent → works even when mounted manually or at boot.  

---

🛠️ Enable ACL via /etc/fstab (boot-time)  

/ dev/sdc1  /var/stuff  ext4  acl  1 2  

- 4th field contains mount options → add `acl` (append with comma if others present).  
- Example: `defaults,acl`.  

To remount with new options immediately:  
# mount -o remount /dev/sdc1  

---

🛠️ Enable ACL via manual mount  

# mount -o acl /dev/sdc1 /var/stuff  

- Temporary → ACL active until reboot.  
- To persist, must add `/etc/fstab` entry.  

---

🐧 Debian/Ubuntu Notes  
- ext4 usually has ACL enabled by default.  
- To ensure:  
  # tune2fs -l /dev/sdXN | grep "mount options"  
- To add: edit `/etc/fstab` or use `mount -o acl`.  
- Same commands (`tune2fs`, `mount`).  



📌 Adding Directories for Collaboration (Linux Bible Notes)

📂 Special permission bits (beyond rwx)  
- These are **extra bits** added with chmod.  
- Default numeric perms have a leading `0` (example: 0775).  
- Replace leading `0` with 1, 2, or 4 for special bits.  

---

🔑 Special permission bits  

Set User ID (SUID) → 4 → u+s  
- Executed program runs with **owner’s privileges**.  
- Mostly used for special commands (not for directories).  

Set Group ID (SGID) → 2 → g+s  
- On a **directory**:  
  - New files inside inherit the directory’s **group ID**.  
  - Useful for collaboration (all files stay owned by shared group).  

Sticky Bit → 1 → o+t  
- On a **directory**:  
  - Only **file owner or root** can delete/rename files.  
  - Common example: `/tmp`.  

---

📥 Examples  

# chmod 2775 /mnt/xyz  
- Adds SGID bit (2).  
- New files inside `/mnt/xyz` → same group as directory.  

# chmod 1777 /shared  
- Adds sticky bit (1).  
- Any user can create files, but only owner/root can delete them.  

# chmod 3777 /teamshare  
- Both SGID (2) + sticky bit (1).  
- Files inherit group, and users cannot delete each other’s files.  

---

📂 Table (from book)  

Name           | Numeric | Letter  
---------------|---------|-------  
Set User ID    | 4       | u+s  
Set Group ID   | 2       | g+s  
Sticky Bit     | 1       | o+t  

---

🐧 Debian/Ubuntu Notes  
- Same behavior (chmod supports u+s, g+s, o+t).  
- Default `/tmp` permissions = `1777` (world writable + sticky bit).  



📌 Creating Group Collaboration Directories (Set GID Bit)

🛠️ Steps to set up a shared directory for group collaboration  

1️⃣ Create a group  
# groupadd -g 301 sales  
- Creates group `sales` with GID = 301.  

2️⃣ Add users to group  
# usermod -aG sales mary  
- Adds user `mary` to supplementary group `sales`.  

3️⃣ Create directory  
# mkdir /mnt/salestools  

4️⃣ Assign group ownership  
# chgrp sales /mnt/salestools  
- Directory now owned by group `sales`.  

5️⃣ Enable Set GID (SGID) bit  
# chmod 2775 /mnt/salestools  
- `2` = SGID  
- `775` = rwx for owner, rwx for group, r-x for others  
- Directory perms: `drwxrwsr-x`  
- The **s** in `rws` shows SGID is active.  

6️⃣ Test as group member  
# su - mary  
[mary]$ touch /mnt/salestools/test.txt  
[mary]$ ls -ld /mnt/salestools /mnt/salestools/test.txt  

drwxrwsr-x. 2 root sales 4096 Jan 22 14:32 /mnt/salestools/  
-rw-rw-r--. 1 mary sales    0 Jan 22 14:32 /mnt/salestools/test.txt  

✅ Result:  
- Normally file would belong to group `mary`.  
- But because of SGID on dir → file belongs to group `sales`.  
- Any `sales` member can read/write it.  

---

📂 About Set UID & Set GID on executables  

- Normally: programs run with **user’s own permissions**.  
- With SUID/SGID set → run with **owner’s or group’s permissions**.  

Examples:  
# ls -l /bin/su  
-rwsr-xr-x. 1 root root 30092 Jan 30 07:11 su  

- The `s` in user execute bit (`rws`) shows **SUID root**.  
- `su` runs with root privileges (but requires password).  

Other examples: `newgrp` (SGID).  

---

🐧 Debian/Ubuntu Notes  
- Same commands (`groupadd`, `chgrp`, `chmod 2775`).  
- SGID directories behave the same → files inherit directory’s group.  
- Default `/srv` or custom `/shared` often configured this way for team work.  



📌 Creating Restricted Deletion Directories (Sticky Bit)

📂 Purpose  
- Normally: if a directory is writable, any user can delete files inside.  
- Sticky bit (`t`) → only **file owner** or **root** can delete/rename files.  
- Common example: `/tmp`.  

---

🛠️ Example  

$ ls -ld /tmp  
drwxrwxrwt. 116 root root 36864 Jan 22 14:18 /tmp  

- `t` replaces last execute bit → sticky bit enabled.  

---

🛠️ Create your own sticky directory  

[mary]$ mkdir /tmp/mystuff  
[mary]$ chmod 1777 /tmp/mystuff  
[mary]$ cp /etc/services /tmp/mystuff/  
[mary]$ chmod 666 /tmp/mystuff/services  
[mary]$ ls -ld /tmp/mystuff /tmp/mystuff/services  

drwxrwxrwt. 2 mary mary   4096 Jan 22 15:28 /tmp/mystuff/  
-rw-rw-rw-. 1 mary mary 640999 Jan 22 15:28 /tmp/mystuff/services  

✅ Effect:  
- Directory open for all (`1777` = rwx for all + sticky).  
- Any user can write to `services` file.  
- ❌ But only **mary** (owner) or **root** can delete it.  

---

📌 Centralizing User Accounts  

🔑 Local authentication (default):  
- `/etc/passwd` → account info (UID, GID, shell, home).  
- `/etc/shadow` → encrypted passwords.  

⚡ Enterprise need:  
- Avoid creating users on every machine.  
- Central authentication server manages accounts.  
- Linux queries server at login.  

---

🌐 Supported centralized authentication methods (via `authconfig`):  

- **LDAP** (Lightweight Directory Access Protocol)  
  - Standard for directory services (accounts, phone books, etc.).  
  - Widely used in enterprises.  
  - Open-source option: **389 Directory Server** (Fedora project).  

- **NIS** (Network Information Service)  
  - Old Sun Microsystems system.  
  - Shares accounts, host configs.  
  - ⚠️ Weak security (clear text) → mostly replaced.  

- **Winbind**  
  - Integrates with **Windows Active Directory (AD)**.  
  - Lets Linux authenticate against AD servers.  
  - Often used in companies with Windows desktops + Linux servers.  

---

🐧 Debian/Ubuntu Notes  
- Sticky bit works the same (`chmod 1777 dir`).  
- Central authentication options:  
  - `sssd` + `realmd` for AD.  
  - `libnss-ldap` / `libpam-ldapd` for LDAP.  
  - `yp-tools` for NIS (rarely used).  
