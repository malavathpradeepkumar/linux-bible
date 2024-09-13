The pipe (|) metacharacter connects the output from one command to the input of 
another command. This lets you have one command work on some data and then have 
the next command deal with the results.

$ cat /etc/passwd | sort | less
cat = contents of the file, /etc/passwd = user account information, sort=alphabetical order, less=papper program for viewing long
files and outputs. 

 # SEQUENTIAL COMMANDS #

#  Sequential Execution: Commands separated by ; are executed sequentially. Each command will run regardless of whether 
#  the previous command was successful or not.

date ; troff -me verylargedocument | lpr ; date ; mail -s "Finished the long command" chris@example.com 
troff = troff is a text formatting program used to prepare documents for printing., -me = -me macro package,
 which provides a set of macros for formatting documents., verylargedocument = file name, | (pipe)=this takes the output 
 of the command on the left (troff -me verylargedocument) and passes it as input to the command on the right (lpr).
Purpose: To direct the formatted document output to the printer., lpr=This command sends files to the printer.
Purpose: To print the formatted document produced by troff, date=To mark the end time of the sequence of commands,
 allowing you to see how long the entire process took. -s= subject  %nroff also a text formating command%

 # BACKGROUND RUN COMMANDS #

$ troff -me verylargedocument | lpr &
& = This symbol is used to run the preceding command in the background. Purpose: To allow the terminal to be available
 for other commands while troff and lpr are running. Don’t close the shell until the process is completed,
or that will kill the process.

PROPER BACKGROUND EXECUTION

(sudo apt update && sudo apt upgrade -y) &
or use curly bracket if you run this command without bracket,the & only applies to the second command, sudo apt upgrade -y,
but because it's part of a sequence, the whole line doesn't behave as expected for background execution.
To properly run both commands in the background, you need to group them together using parentheses () or curly braces {}.
This ensures that the entire sequence is treated as a single job for background execution.

; (semicolon):
This is a command separator. It means that sudo apt update will be run first, and after 
it completes, sudo apt upgrade -y will be executed.

&&
&& ensures that sudo apt upgrade -y only runs if sudo apt update succeeds

{ sudo apt update && sudo apt upgrade -y; } &
The semicolon inside the braces is necessary to properly close the command block.

#  Command Substitution Overview # 

$(command)
This is the modern and preferred method because it’s more readable and can be nested.
`command`
This older method is less preferred due to readability issues, especially with nested commands.

$ vi $(find /home | grep xyzzy)  or vi `find /home | grep xyzzy`


find /home: This command searches for files and directories starting from /home.
grep xyzzy: Filters the results of find to include only those lines containing xyzzy.
vi $(...): The output from the find and grep commands (a list of filenames) is passed to the vi editor.
The filenames are then used as arguments for the vi editor, which opens each file for editing.
The grep command in Linux is used to search for specific patterns (usually text) in files or input streams. It's highly 
useful for filtering data based on regular expressions or plain text strings

# Expanding arithmetic expressions #

There may be times when you want to pass arithmetic results to a command. There are
two forms  $[expression] or $(expression)

echo "I am $((2012 - 1957)) years old."
echo " I am [$((2012-1957))] years old."
echo " I am $[2012-1957] years old."

echo "There are $(ls | wc -w) files in this directory."
$= This is command substitution. It runs the command inside the parentheses and replaces it with the output of that command.
wc -w:
The wc command stands for "word count". The -w flag specifically counts the number of words. In this case, 
it counts the number of filenames listed by the ls command.

# Expanding variables #

Variables that store information within the shell can be expanded using the dollar sign
($) metacharacter. When you expand an environment variable on a command line, the
value of the variable is printed instead of the variable name itself.
 ls -l $BASH
-rwxr-xr-x 1 root root 625516 Dec 5 11:13 /bin/bash

# Creating and using aliases #
Using the alias command, you can effectively create a shortcut to any command and
options you want to run later.

alias p='pwd ; ls –CF'
alias p='pwd ; ls -CF': This is creating an alias named p. When you type p in the terminal, it will execute
 the two commands defined within the quotes: pwd and ls -CF
 ls -CF:

ls is the command used to list the contents of a directory.
The -C option formats the output into multiple columns (if possible), making the listing more compact.
The -F option appends special characters to the file names based on their type:
A / for directories
A * for executable files
An @ for symbolic links

alias rm='rm -i'
-i: This option stands for "interactive mode." When this option is used, rm will ask for confirmation before
deleting each file or directory.

# To find out where a particular command is taken from # you can use #type# command use #which# command if your using other
than bash #

For exam-ple, to find out where the bash shell command is located.

$ type bash
$ which bash
#  Find all locations of a command using -a:
$ type -a ls

If a command is not in your PATH variable, you can use the locate command to try to
fi nd it. Using locate, you can search any part of the system that is accessible to you

$ locate chage

# COMMAND LINE COMPLETION #
$ echo $OS<Tab>   Variable — If the text you type begins with a dollar sign ($), the shell completes
the text with a variable from the current shell.

$ cd ~ro<Tab> Username — If the text you type begins with a tilde (~), the shell completes

$ fing<Tab>Command, alias, or function — If the text you type begins with regular
characters.

Hostname — If the text you type begins with an at (@) sign, the shell completes
the text with a hostname taken from the /etc/hosts file.

Pressing Tab twice offers some wonderful possibilities
$ echo $P<Tab><Tab>
$PATH $PPID $PS1 $PS2 $PS4 $PWD
$ echo $P

after displaying several posible ways if you typed another P, and then hit Tab again, the command line would be completed with $PPID.

# Command-line recall #

To view your history list, use the history command.
$ history
$ history 8  last recent 8 commands
$ !382   to run exact command
$ !! — Run previous command.
!?string? — Run command containing string. This runs the most recent command that contains a particular string of characters.
$ !?dat?

Ctrl+R Reverse
incremental search
After you press these keys, you enter a search string to
do a reverse search. As you type the string, a matching
command line appears that you can run or edit.

Ctrl+S Forward
incremental search
Same as the preceding function but for forward search.
(This may not work in all instances.)

Alt+P Reverse search After you press these keys, you enter a string to do a
reverse search. Type a string and press Enter to see the
most recent command line that includes that string.

Alt+N Forward search Same as the preceding function but for forward search.
(This may not work in all instances.)

Type fc followed by a history line number, and that command line is opened in a text editor. (for example, fc 100 105)

# Using Shell Variables #

$ set   to see all variable set for you current shell.
$ env to see environment variables
You can type echo $VALUE, where VALUE is replaced by the name of a particular environment variable you want to list.
 you can also type declare to get a list of the current environment variables and their values along with a list of shell functions.

  Shell Variables: Convention: Usually written in lowercase or camelCase.
Definition: Shell variables are local to the current shell session (the shell you're working in). They are 
only available to the shell in which they were created.
Scope: Limited to the shell where they are defined, meaning they won’t be accessible by child processes 
(other programs or subshells spawned from the current shell).
name="Pradeep"  # This is a shell variable
echo $name       # Outputs: Pradeep

name="Pradeep"      # Shell variable
export name         # Now it becomes an environment variable

Environment Variables:  Convention: Typically written in UPPERCASE.
Definition: Environment variables are global variables that are inherited by child processes of the shell (like other scripts, 
commands, or programs). They are part of the environment in which the shell and other programs run.
Scope: Available to the current shell session and any child processes (like subshells or programs started from the current shell). 
This makes them accessible system-wide within the current session.
export PATH="/usr/local/bin:$PATH"  # PATH is an environment variable
echo $PATH  # Outputs: system PATH including /usr/local/bin
<<'COMMENT'
Purpose of :$PATH
The :$PATH part appends the existing PATH environment variable to the new value you're setting (/usr/local/bin). This ensures that 
you are adding /usr/local/bin to the beginning of the existing PATH, rather than replacing the entire PATH value.
Without :$PATH: If you only wrote export PATH="/usr/local/bin", you would overwrite the current PATH variable. This would remove all 
existing directories in PATH, leaving only /usr/local/bin. As a result, the system might not be able to find other important commands 
or programs. With :$PATH: By appending :$PATH, you are preserving the original contents of the PATH variable. This ensures that the system 
can still locate programs in other directories already included in PATH, while giving priority to the /usr/local/bin directory.
COMMENT
Before running the script, your PATH might look something like this:

/usr/bin:/bin:/usr/sbin:/sbin

After running export PATH="/usr/local/bin:$PATH", the PATH will be:

/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin


# Common Shell Environment Variables #

# BASH: Full path to the bash executable, usually /bin/bash.
echo $BASH

# BASH_VERSION: Current version of bash.
echo $BASH_VERSION

# EUID: Effective user ID of the current user.
echo $EUID

# FCEDIT: Editor used by fc to edit command history, defaults to 'vi' if unset.
echo $FCEDIT

# HISTFILE: Location of the history file, typically $HOME/.bash_history.
echo $HISTFILE

# HISTFILESIZE: Max number of history entries before older ones are discarded.
echo $HISTFILESIZE

# HISTCMD: The number of the current command in the history list.
echo $HISTCMD

# HOME: Your home directory.
echo $HOME

# HOSTTYPE: Describes the system's hardware architecture.
echo $HOSTTYPE

# MAIL: Location of your mailbox, usually in /var/spool/mail.
echo $MAIL

# OLDPWD: Previous working directory before the last 'cd' command.
echo $OLDPWD

# OSTYPE: Current operating system, typically linux or linux-gnu.
echo $OSTYPE

# PATH: Directories to search for executable files.
echo $PATH

# PPID: Process ID of the parent process that started the current shell.
echo $PPID

# PROMPT_COMMAND: Command run before the shell prompt appears, e.g., to show the date.
echo $PROMPT_COMMAND

# PS1: Primary prompt string, allows customization of the shell prompt.
echo $PS1

# PWD: Current working directory.
echo $PWD

# RANDOM: Generates a random number between 0 and 99999.
echo $RANDOM

# SECONDS: Number of seconds since the shell was started.
echo $SECONDS

# SHLVL: Shell level (nested bash sessions).
echo $SHLVL

# TMOUT: Timeout value in seconds before the shell auto-logs out due to inactivity.
echo $TMOUT

Exiting the shell  press ctrl + D or exit command.

# Bash Configuration Files #

# /etc/profile: Sets up user environment information for all users.
# This file runs when you log in. It sets values for your PATH, mailbox, 
# history size, and includes settings from /etc/profile.d. directory.

# /etc/bashrc: Executes for every user who runs the bash shell.
# This file runs every time a bash shell is opened. It sets default 
# prompts and can define aliases. Users can override these with ~/.bashrc.

# ~/.bash_profile: Specific to each user and runs once when logging in.
# This file is used to set user-specific environment variables and 
# often runs ~/.bashrc to apply further customizations. It’s a good place to add
# environment variables that should be inherited by future shells.

# ~/.bashrc: Contains configurations specific to bash shell.
# This file is sourced when you log in and every time you open a new bash shell. 
# It is ideal for setting up aliases and shell-specific settings.

# ~/.bash_logout: Executes when the user logs out of the shell.
# This file runs every time you log out. By default, it clears the screen 
# when you exit the last bash shell.

$ nano $HOME/.bashrc
: '
With the fi le open in nano, move the cursor down to the bottom of the fi le (using the down arrow key). Type in the line you want 
(for example, you could type alias d= "date +%D"). To save the fi le, press Ctrl+O (the letter O) and to quit press Ctrl+X. The
next time you log in or open a new shell, you will be able to use the new alias (in this case, just type d).
'

 PS1 (Main Shell Prompt)
What it does: PS1 defines your primary command prompt, the one you interact with most of the time when you're typing commands.
By default, PS1 might look like this:
$  # Simple shell prompt
You can customize it to include additional information, such as your username, current directory, etc.

PS1="[User: \u] [Dir: \W]$ "  # Customize PS1

This will change your prompt to show your username and the current directory like this:

[User: thor] [Dir: ~]$ 

Now, every time you run a command, your prompt will show your username and the current directory.

PS2 (Continuation Prompt for Multi-line Commands)
What it does: PS2 is used when you type an incomplete command that spans multiple lines. By default, PS2 is >, which appears 
when the shell expects more input.

echo "This is a \
multi-line command"

PS2="continue> "  # Change PS2 to "continue> "

echo "This is a \
continue> multi-line command"

 
 
 PS3 (Select Prompt in Scripts)
What it does: PS3 is used when you use the select command in shell scripts. This command lets you present a list of options to the user, 
and PS3 defines the prompt asking the user to pick an option.

PS3="Choose an option: "  # Set PS3 for select prompt

select fruit in Apple Banana Cherry; do
    echo "You selected $fruit"
    break
done

When you run this, it will look like:

1) Apple
2) Banana
3) Cherry
Choose an option: 2
You selected Banana


PS4 (Debugging Prompt)
What it does: PS4 is used in debug mode (set -x) to show the trace of commands as they are executed. By default, it is +, 
but you can customize it.
set -x  # Enable debugging

Now run a command:

echo "Hello, world!"

You'll see something like this:

+ echo 'Hello, world!'
Hello, world!

Try this:
PS4="debug> "  # Customize the PS4 prompt for debugging
set -x  # Enable debugging again
Now, when you run the same command:
echo "Hello, world!"
You'll see:

debug> echo 'Hello, world!'
Hello, world!
This PS4 customization helps you see the execution trace more clearly during debugging.

# Characters to Add Information to bash Prompt #

# \! : Shows the current command history number (all commands for the user).
PS1="\! \$ "  # Example: Displays the history number before the prompt.

# \# : Shows the command number of the current command in the active shell.
PS1="\# \$ "  # Example: Displays the command number in the active shell before the prompt.

# \$ : Shows $ for a regular user or # for the root user.
PS1="\$ "      # Example: Displays $ for a regular user and # for the root user.

# \W : Shows only the base name of the current working directory.
PS1="\W \$ "   # Example: Displays the base name of the current directory before the prompt.

# \[ : Begins a sequence of non-printing characters for terminal control sequences.
# Example: This can be used to insert terminal control sequences like color changes.
# Usage: \[ \033[01;34m \]  # Start color sequence (e.g., blue).

# \] : Ends a sequence of non-printing characters.
# Example: This ends the terminal control sequence started with \[.
# Usage: \[ \033[00m \]  # End color sequence and reset to default.

# \\ : Shows a backslash.
PS1="\\\$ "    # Example: Displays a backslash followed by the prompt symbol.

# \d : Displays the day name, month, and day number of the current date.
PS1="\d \$ "   # Example: Displays the current date in "Wed Sep  6" format before the prompt.

# \h : Shows the hostname of the computer running the shell.
PS1="\h \$ "   # Example: Displays the hostname before the prompt.

# \n : Causes a newline to occur.
PS1="\n\$ "    # Example: Displays a newline before the prompt.

# \nnn : Shows the character corresponding to the octal number nnn.
PS1="\033[31m\n\033[0m"  # Example: Displays a newline with color codes (e.g., red) before the prompt.

# \s : Displays the current shell name (e.g., bash).
PS1="\s \$ "   # Example: Displays "bash" before the prompt.

# \t : Prints the current time in hours, minutes, and seconds.
PS1="\t \$ "   # Example: Displays the current time in "14:23:05" format before the prompt.

# \u : Prints the current username.
PS1="\u \$ "   # Example: Displays the current username before the prompt.

# \w : Displays the full path to the current working directory.
PS1="\w \$ "   # Example: Displays the full path to the current directory before the prompt.


# Adding environment variables #

# TMOUT: Sets the number of seconds the shell can be inactive before automatically exiting.
# This feature helps with security by closing the shell after a period of inactivity.
TMOUT=1800  # Set TMOUT to 1800 seconds (30 minutes) of idle time before the shell exits.

# PATH: Specifies directories to search for commands. You can add directories to the PATH variable.
# This example adds /getstuff/bin to the current PATH.
PATH=$PATH:/getstuff/bin  # Add /getstuff/bin to the PATH
export PATH                # Export the updated PATH variable

# WHATEVER (Custom Environment Variable): Create your own environment variables for shortcuts.
# This example sets a variable M to a specific directory path and exports it for use.
M=/work/time/files/info/memos  # Set the custom variable M
export M                       # Export the custom variable M

# Example Usage of Custom Variable
# To change to the directory stored in M:
cd $M

# To run a program from that directory:
$M/hotdog

# To edit a file from that directory:
vi $M/bun


# Getting Information About Commands #

When you fi rst start using the shell, it can be intimidating. All you see is a prompt. How
do you know which commands are available, which options they use,

Check the PATH — Type echo $PATH. You see a list of the directories containing commands that are immediately accessible to you. Listing the contents of
those directories displays most standard Linux commands. For example:

$ ls /bin

# arch: Displays the machine architecture (e.g., x86_64).
arch

# dd: Convert and copy files, commonly used for disk operations.
dd

# fusermount: Unmounts a FUSE filesystem.
fusermount

# loadkeys: Loads keyboard maps.
loadkeys

# mv: Moves or renames files and directories.
mv

# rnano: A simple text editor with basic functionality.
rnano

# taskset: Sets or retrieves a process's CPU affinity.
taskset

# awk: A versatile programming language for pattern scanning and processing.
awk

# df: Reports file system disk space usage.
df

# gawk: GNU implementation of the awk programming language.
gawk

# login: Begins a new login session.
login

# nano: A simple text editor.
nano

# rpm: Package manager for RPM-based distributions.
rpm

# tcsh: An enhanced version of the C shell.
tcsh

# basename: Strips directory and suffix from filenames.
basename

# dmesg: Prints kernel ring buffer messages.
dmesg

# gettext: Provides internationalization and localization support.
gettext

# ls: Lists directory contents.
ls

# netstat: Displays network connections, routing tables, and interface statistics.
netstat

# rvi: A variant of the vi editor.
rvi

# touch: Changes file timestamps or creates new empty files.
touch

# bash: GNU Bourne Again SHell, a command processor.
bash

# dnsdomainname: Displays the DNS domain name of the local host.
dnsdomainname

# grep: Searches for patterns in files.
grep

# lsblk: Lists information about block devices.
lsblk

# nice: Runs a command with modified scheduling priority.
nice

# rview: A viewer for the `rvi` editor.
rview

# true: Returns a successful exit status (used in scripting).
true

# cat: Concatenates and displays file contents.
cat

# domainname: Displays or sets the system's domain name.
domainname

# gtar: GNU version of the tar command.
gtar

# lscgroup: Lists control groups (cgroups).
lscgroup

# nisdomainname: Displays or sets the NIS domain name.
nisdomainname

# sed: Stream editor for filtering and transforming text.
sed

# umount: Unmounts file systems.
umount

# chgrp: Changes the group ownership of files.
chgrp

# echo: Displays a line of text or variable value.
echo

# gunzip: Decompresses files compressed with gzip.
gunzip

# lssubsys: Lists the available subsystems in the Linux cgroup hierarchy.
lssubsys

# ping: Sends ICMP ECHO_REQUEST packets to network hosts.
ping

# setfont: Sets the console font.
setfont

# uname: Prints system information.
uname

# chmod: Changes file modes or Access Control Lists (ACLs).
chmod

# ed: A line-oriented text editor.
ed

# gzip: Compresses files.
gzip

# mail: Sends and receives mail.
mail

# ping6: Sends ICMP ECHO_REQUEST packets to IPv6 network hosts.
ping6

# setserial: Configures serial ports.
setserial

# unlink: Deletes a single file.
unlink

# chown: Changes file ownership.
chown

# egrep: Extended grep, allows more complex pattern matching.
egrep

# hostname: Shows or sets the system's hostname.
hostname

# mailx: An enhanced mail command with additional features.
mailx

# ps: Reports process status.
ps

# sh: The Bourne shell or a compatible shell.
sh

# usleep: Sleeps for a specified number of microseconds.
usleep

# cp: Copies files and directories.
cp

# env: Displays or sets environment variables.
env

# ipcalc: Calculates IP address ranges and netmasks.
ipcalc

# mkdir: Creates directories.
mkdir

# pwd: Prints the current working directory.
pwd

# sleep: Pauses for a specified number of seconds.
sleep

# vi: A text editor with powerful features.
vi

# cpio: Copies files to and from archives.
cpio

# ex: A line-oriented text editor, predecessor to vi.
ex

# kbd_mode: Sets the keyboard mode for the console.
kbd_mode

# mknod: Creates block or character devices.
mknod

# readlink: Displays the value of a symbolic link.
readlink

# sort: Sorts lines of text files.
sort

# view: A read-only mode of the vi editor.
view

# csh: The C shell, a Unix shell with C-like syntax.
csh

# false: Returns a non-zero exit status (used in scripting).
false

# keyctl: Controls and retrieves keyring information.
keyctl

# mktemp: Creates a temporary file or directory.
mktemp

# red: A text editor with various features.
red

# stty: Configures terminal line settings.
stty

# zcat: Displays compressed files (gzip format) without decompressing them.
zcat

# cut: Removes sections from each line of files.
cut

# fgrep: Grep command that searches for fixed strings.
fgrep

# kill: Sends signals to processes (e.g., to terminate them).
kill

# more: A pager program to view file contents one screen at a time.
more

# redhat_lsb_init: Red Hat LSB (Linux Standard Base) initialization script.
redhat_lsb_init

# su: Switches to another user account.
su

# zsh: Z shell, an extended Bourne shell with many improvements.
zsh

# dash: Debian Almquist Shell, a lightweight shell.
dash

# find: Searches for files in a directory hierarchy.
find

# link: Creates a hard link to a file.
link

# mount: Mounts file systems.
mount

# rm: Removes files or directories.
rm

# sync: Synchronizes cached writes to persistent storage.
sync

# date: Displays or sets the system date and time.
date

# findmnt: Lists all mounted file systems.
findmnt

# ln: Creates links between files.
ln

# mountpoint: Checks if a directory is a mount point.
mountpoint

# rmdir: Removes empty directories.
rmdir

# tar: Archives files.
tar

# Use the help command #

$ help command   # the help command works only bash shell #

$ date --help | less

$ man command   # replace actuall command in place of command #

# man -k passwd
# This command searches the manual page descriptions (a keyword search) for "passwd."
# It lists all manual pages that mention "passwd" in their short descriptions.
# Equivalent to using the 'apropos' command.

# man passwd
# Displays the manual page for the 'passwd' command.
# The 'passwd' command is used to change a user's password.

# man 5 passwd
# Displays the manual page for the 'passwd' file, which is a system configuration file.
# Section 5 refers to "file formats and conventions." In this case, it explains the structure of the /etc/passwd file, which holds user account information.












