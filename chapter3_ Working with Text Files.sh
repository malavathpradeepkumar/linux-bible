a—The add command, A—Add at end command, Input text starting at the end of the current line.
i—The insert command, I—The insert at beginning command, o—The open (a line) below command, O-open a line above.

There are times when you have to press Esc twice. Move the cursor up, down, left, or right, Backspace and the spacebar, 
h (left), l (right), j (down), or k (up)

w and W both move the cursor to the beginning of the next word
w (lowercase) 
Example: In the sentence Hello, world!, if the cursor is at the start of Hello, pressing w will move the cursor to ,, and pressing w 
again will move it to world.

W(UPPERCASE)
Example: In the same sentence Hello, world!, pressing W from the start of Hello will move the cursor directly to world, skipping 
over the punctuation.

b—Moves the cursor to the beginning of the previous word (delimited by spaces,
tabs, or punctuation).
■B—Moves the cursor to the beginning of the previous word (delimited by spaces
or tabs).

0 (zero)—Moves the cursor to the beginning of the current line.
■$—Moves the cursor to the end of the current line.

■H—Moves the cursor to the upper-left corner of the screen (fi rst line on the
screen).
■M—Moves the cursor to the fi rst character of the middle line on the screen.
■L—Moves the cursor to the lower-left corner of the screen (last line on the
screen).

e: Move to the end of the current word  # w is move the begining of the current word #
gg: Move to the beginning of the file.
G: Move to the end of the file.
PgUp: Moves the cursor up one screen/page.
PgDn: Moves the cursor down one screen/page.


Deleting, copying, and changing text
In vi, movement keys refer to the keys that help move the cursor around the text. These keys are used in combination with commands 
like x, d, y, and c for deleting, copying, or changing text.  example: Arrow Keys: H, J, K, L (vi-specific movement keys):
Other Special Movement Keys: b,w,0,$. pageup, pagedown.


■x—Deletes the character under the cursor.
■X—Deletes the character directly before the cursor.
■d<?>—Deletes some text.
■c<?>—Changes some text.
■y<?>—Yanks (copies) some text.

■dw—Deletes (d) a word (w) after the current cursor position.
■db—Deletes (d) a word (b) before the current cursor position.
■dd—Deletes (d) the entire current line (d).
■c$—Changes (c) the characters from the current character to the end of the cur-
rent line ($) and goes into input mode.
■c0—Changes (c) from the previous character to the beginning of the current line
(0) and goes into input mode.
■cl—Erases (c) the current letter (l) and goes into input mode.
■cc—Erases (c) the line (c) and goes into input mode.
■yy—Copies (y) the current line (y) into the buffer.
■y)—Copies (y) the current sentence ( ) ), to the right of the cursor, into the
buffer.
■y}—Copies (y) the current paragraph ( } ), to the right of the cursor, into the
buffer
Undo: Press u to undo the last change.
Redo: Press Ctrl + r to redo the last undone change.

# Any of the commands just shown can be further modified using numbers
■3dd—Deletes (d) three lines (3d), beginning at the current line.
■3dw—Deletes (d) the next three words (3w).
■5cl—Changes (c) the next five (5) letters (l) (that is, removes the letters and # you can also use h, j, k.
enters input mode).
■12j—Moves down (j) 12 lines (12).
■5cw—Erases (c) the next five (5) words (w) and go into input mode.
■4y)—Copies (y) the next four (4) sentences ( ) ).

■P—Puts the copied text to the left of the cursor if it’s letters or words; puts the
copied text above the current line if it contains lines of text.
■p—Puts the buffered text to the right of the cursor if it’s letters or words; puts the
buffered text below the current line if it contains lines of text.

Repeating commands
After you delete, change, or paste text, you can repeat that action by typing a period (.).

for example in vi pradeep has 3 times, with the cursor on the beginning of the name pradeep, you type cw and type sharath to change 
pradeep to sharath.  You search for the next occurrence of pradeep in the file, position the cursor at the beginning of that name, and 
press a period. The word  changes to sharath and you can search for the next occurrence.

Exiting vi
To wrap things up, use the following commands to save or quit the fi le:
■ZZ—Save the current changes to the fi le and exit from vi.
■:w—Save the current fi le but continue editing.
■:wq—Same as ZZ.
■:q—Quit the current fi le. This works only if you don’t have any unsaved
changes.
■:q!—Quit the current fi le and don’t save the changes you just made to
the file.

:!command—You can run a shell command while you are in vi using :!
followed by a shell command name. For example, type :!date to see the current
date and time, type :!pwd to see what your current directory is, or type :!jobs
to see whether you have any jobs running in the background. When the com-
mand completes, press Enter and you are back to editing the fi le. You could even
use this technique to launch a shell (:!bash) from vi, run a few commands
from that shell, and then type exit to return to vi. (I recommend doing a save
before escaping to the shell, just in case you forget to go back to vi.)

■Ctrl+G—If you forget what you are editing, pressing these keys displays the
name of the fi le that you are editing and the current line that you are on at
the bottom of the screen. It also displays the total number of lines in the fi le, the
percentage of how far you are through the fi le, and the column number the
cursor is on. This just helps you get your bearings after you’ve stopped for a cup
of coffee at 3 a.m.

# Skipping around in the file

■Ctrl+f—Page ahead, one page at a time.
■Ctrl+b—Page back, one page at a time.
■Ctrl+d—Page ahead one-half page at a time.
■Ctrl+u—Page back one-half page at a time.
■G—Go to the last line of the fi le.
■1G—Go to the fi rst line of the fi le. (Use any number to go to that line in the file.)
■35G—Go to any line number (35 in this case).

# Searching for text.

■/hello—Searches forward for the word hello.
■?goodbye—Searches backward for the word goodbye.

In vi, after performing a search using /hello, you need to use additional commands to navigate through all the matches. When you hit Enter, 
it only takes you to the first occurrence. To move to the next occurrence of the search term, use the following commands:

n: Moves to the next match (forward search).
N: Moves to the previous match (backward search).

■/hello—Searches forward for the word hello.
■?goodbye—Searches backward for the word goodbye.

/Tony  # in  Scope: It searches from the current cursor position to the end of the file (or earlier if searching backward with ?Tony).


■/Tony.*Hulk   —Searches forward for a line that has the word The in it and also,
after that at some point, the word Hulk.   remember same line not paragraph. also you can use backword search ?

■?[pP]rint—Searches backward for either print or Print. Remember that case
matters in Linux, so make use of brackets to search for words that could have
different capitalization.   you can also search for forward.

After you have entered a search term, simply type n or N to search forward or backward for the same term again, respectively.

# Using ex mode #

: 'The vi editor was originally based on the ex editor, These are ex mode commands in vi, which you access by typing a colon (:). When you 
type a colon, you move to the command-line at the bottom of the screen (the "ex mode" line), where you can issue commands to find, 
substitute, or manipulate text in your file.
'
# /Tony and :g/Tony in vi 

# /Tony — Search Command (Forward Search), Scope: It searches from the current cursor position to the end of the file 
# (or earlier if searching backward with ?Tony).

1. :g/Tony — Global Command (Ex Mode)
What it does: :g/Tony is used to find every line in the entire file that contains "Tony" and perform an action 
(e.g., print, substitute, delete). By itself, :g/Tony simply prints each line that contains the word "Tony."
Scope: It searches the entire file, not just from the cursor position.

You can extend this command to perform operations on the matching lines, such as substitution or deletion 
(e.g., :g/Tony/d to delete all lines containing "Tony").

■:g/Local—Searches for the word Local and prints every occurrence of that line
from the file. (If there is more than a screenful, the output is piped to the more
command.)

2. :s/rakesh/pradeep — Substitutes "pradeep" for the word "rakesh" on the current line:
What it does: This substitutes the first occurrence of the word "rakesh" on the current line with "pradeep".
Where to run it: In vi, move the cursor to the line where you want to make the substitution, then type :s/Local/Remote and press Enter.

3. :g/Local/s//Remote — Substitutes the first occurrence of "Local" with "Remote" on every line in the file:
What it does: This searches through every line in the file. If "Local" is found, it substitutes the first occurrence on each line with "Remote".
Where to run it: From any line in vi, type :g/Local/s//Remote and press Enter.
# :g/rakesh/s//pradeep

 # REMEMBER IF YOU MENTION 2ND SLASH THAT IS REPLACING 
The first slash / indicates the start of the pattern ("rakesh").
The second slash / indicates where the replacement text begins. Since there’s nothing after the second slash, it means you’re 
replacing "rakesh" with nothing.

4. :g/Local/s//Remote/g — Substitutes every occurrence of "Local" with "Remote" in the entire file:
What it does: This searches through every line in the file, and on each line, it replaces all occurrences of the word "Local" with "Remote".
Where to run it: From any line in vi, type :g/Local/s//Remote/g and press Enter
# :g/rakesh/s//pradeep/g

5. :g/Local/s//Remote/gp — Substitutes every occurrence of "Local" with "Remote" and prints the lines with changes:
What it does: It works the same as the previous command, replacing all occurrences of "Local" with "Remote", but it also prints each line 
where a change is made so you can review the results. Where to run it: In vi, type :g/Local/s//Remote/gp and press Enter.
# :g/rakesh/s//pradeep/gp

g at the end of a command (e.g., s//Remote/g) — Stands for "global," meaning substitute all occurrences on each line, not just the first one.
p at the end of a command — Prints the line after the substitution.

Viewing All Occurrences

:g/Tony | more
This will display all the occurrences, and you can use Space to go to the next page or Enter to scroll one line at a time.

When you use the :g/rakesh/d command in vi, it instructs vi to delete all lines that contain the word "rakesh." That's why all the 
text gets deleted if any line includes "rakesh.

Correct Command to Delete Only the Name
  # :%s/rakesh//g  #
g: Global flag
Usage of Slashes: You have two slashes here:
The first slash / indicates the start of the pattern ("rakesh").
The second slash / indicates where the replacement text begins. Since there’s nothing after the second slash, 
it means you’re replacing "rakesh" with nothing.

:% means to apply the command to the entire file.
s/rakesh//g means substitute "rakesh" with nothing (delete it) globally (for every occurrence on each line).
  
#  :%s/raeksh/neelesh/g  #   susitute with neelesh in place of rakesh with every occurence.

# Learning more about vi and vim #

type the command # vimtutor # in terminal
Exiting the Tutor: To exit vimtutor, press Esc to ensure you’re in normal mode, then type :q and press Enter.
'


# FINDING FILES #

commands such as locate (to find commands by name), find (to find files based on lots of different attributes), and grep (to search
within text files to find lines in files that contain search text).

# Using locate to find files by name #

Overview of the locate Command
The locate command is used to quickly find files by name on a Linux system. It works differently from the find command, as 
it searches through a pre-built database of file names rather than searching the entire filesystem in real-time.
Key Points Explained
Database and Updating:
The updatedb command is responsible for creating and updating the database that locate uses. It typically runs automatically once a day 
on most Linux distributions. If a file is added after the last updatedb run, it won’t be found by locate until the next update occurs.

Speed: The locate command is generally faster than find because it searches a database rather than scanning the entire filesystem.

Disadvantages of Using locate:
Missing New Files: If you add files after the last database update, those files won't be found until updatedb runs again.
Limited Coverage: Not every file on your system is included in the locate database. Some files may be excluded based on configuration settings

Configuration (/etc/updatedb.conf):
The updatedb.conf file determines which files and directories are included or excluded from the locate database.
Pruning: Some types of filesystems and paths are excluded (pruned) to keep the database relevant and manageable. For example:
Remote filesystems (like NFS) and temporary directories (like /tmp) are not included.
Specific directory paths and certain file types are excluded to avoid cluttering the database.

User Permissions:

As a regular user, you can only locate files you have permission to see. For instance, if you don’t have permission to 
view files in the /root directory, they won’t show up in your locate results.

Updating the Database:

If you need to include files added after the last updatedb run, you can run updatedb manually. This command typically needs to be 
executed as the root user:   #  sudo updatedb #

$ locate .bashrc
# locate .bashrc    # this is for root #

When run as a regular user, locate only fi nds .bashrc in /etc/skel and the user’s own home directory. Run as root, the same command 
locates .bashrc fi les in every- one’s home directory.

$ locate muttrc
File Type: muttrc is a configuration file, usually named .muttrc or muttrc, that stores settings for the Mutt email client.

$ locate -i muttrc  # Regardless of case #

$ locate --help

$ locate services

locate Command: String Search: When you enter a string with locate, it searches for that string anywhere in the file's path or name.
This command finds any files or directories that contain the string "services" anywhere in their path.

When you use locate, you are not restricted to finding files that match the filename exactly. Instead, you are looking for occurrences 
of the string you enter (like "services") in any part of the file path.

Summary
With find: You must provide the exact filename or pattern, and it will only return files that exactly match.
With locate: You can enter any string, and it will return all paths where that string appears, making it more flexible for searching.

So, yes, when using locate, the string you enter doesn’t need to be an exact filename; it just needs to appear somewhere in the path of 
the files you are searching for.



# SEARCHING FOR FILES WITH FIND #

1. Live Search:
Unlike the locate command, which uses a pre-built database, find performs a live search of the filesystem. This means it scans the current state of the filesystem at the moment you 
run the command. This live searching may be slower than locate, but it provides up-to-date results.

2. Limiting Search Scope:
You can specify a starting point in the filesystem to limit where find searches. This can speed up the search process.
Example: find /etc will only search within the /etc directory and its subdirectories.

3. File Attributes for Searching
The find command can search for files based on a variety of attributes, including:
Filename: Search for files with specific names.
Ownership: Find files owned by a specific user or group.
Permissions: Look for files with certain permission settings.
Size: Search based on file size (e.g., find files larger or smaller than a specified size).
Modification Times: Find files modified within a certain timeframe.
Combinations: You can also combine multiple search criteria to refine your search.

$ find
When run by itself, this command will find all files and directories starting from the current directory (where you run the command).

$ find /etc
This command searches for all files and directories starting from the /etc directory.

$ find $HOME -ls
This command searches for all files and directories in the user's home directory ($HOME), and the -ls option gives a long listing format, 
showing details like ownership, permissions, size, and modification times for each file found.
This option provides a detailed listing of each file found, similar to the output of the ls -l command
'

# Finding files by name #

-iname 'passwd': This will match files named "passwd", "PASSWD", "Passwd", etc.
-name 'passwd': This will only match files named exactly "passwd" (case-sensitive).

$ find /etc -name passwd

# find /etc -iname '*passwd*'

'*passwd*': This is the search pattern. The asterisks (*) are wildcards, meaning "any characters before or after the word 'passwd'". 
It will match filenames that contain the word "passwd" anywhere in their name, regardless of what comes before or after it.
f you use the -name option without asterisks (wildcards), the command will only find files that match exactly the name "passwd"


$ ls
file1  file2  file3  file4  file5
                                                                                                                                                                      
┌──(thor㉿thor)-[~/china/india/spain]
└─$ ls *f
ls: cannot access '*f': No such file or directory
                                                                                                                                                                      
┌──(thor㉿thor)-[~/china/india/spain]
└─$ ls f*
file1  file2  file3  file4  file5
   
What it does: ls *f This looks for files or directories whose names end with the letter "f" (where any characters can come before the "f").
What it does: f* This searches for files or directories whose names start with the letter "f" (where any characters can come after the "f").
when you use *passwd* in a find command, it doesn't specifically search for a file whose first letter is "p" and last letter is "d."
Instead, the wildcard * means "match any characters." So, *passwd* will search for any file or directory name that contains the string passwd 
anywhere in the name, not necessarily as the first or last characters.
Breakdown of *passwd*:
* before "passwd": Matches any number of characters before "passwd". This could be:
No characters at all: passwd
One or more characters: MYPASSWD, my_passwd, etc.
passwd: This is the exact string that must be present somewhere in the filename.
* after "passwd": Matches any number of characters after "passwd". This could be:
No characters at all: passwd
One or more characters: passwdfile, passwd_2023.txt, etc.

Using asterisks, you can match any filename that includes the word passwd.

To create a file with spaces in its name, like malavath pradeep kumar, you need to enclose the filename in quotes or escape the spaces. 
$ touch "malavath pradeep kumar"
$ touch malavath\ pradeep\ kumar

$ ls                 
'malvath pradeep kumar'
                                                                                                                                                                      
┌──(thor㉿thor)-[~/china/india/spain]
└─$ ls *"pradeep kumar"
'malvath pradeep kumar'
    

for example a name called malavath pradeep kumar.  if you use * before pradeep kumar it will look for ending with kumar.
$ ls         
'king pradeep kumar'  'malvath pradeep kumar'
                                                                                                                                                                      
┌──(thor㉿thor)-[~/china/india/spain]
└─$ ls *"kumar"
'king pradeep kumar'  'malvath pradeep kumar'

$ ls        
'king pradeep kumar'
                                                                                                                                                                      
┌──(thor㉿thor)-[~/china/india/spain]
└─$ ls "king"*
'king pradeep kumar'
'

       
# FINDING FILES BY SIZE #  

$ find /usr/share/ -size +10M
# finds files larger than 10MB
$ find /mostlybig -size -1M
finds files less than 1MB.

$ find /bigdata -size +500M -size -5G -exec du -sh {} \;

/bigdata directory with sizes between 500 MB and 5 GB, 

-exec: This option allows you to run a command on each file that find locates. In this case, you're executing the du command 
on each matching file.

du: Disk usage command that shows the size of files or directories.

-sh: These options mean:
-s: Summarize the total size of each file (instead of showing sizes of individual blocks).
-h: Print the sizes in a human-readable format (e.g., MB, GB, etc.).

{}: This is a placeholder for each file found by the find command. It passes each found file to the du command.
\;: This terminates the -exec option. It tells find to run the du command separately for each file.
\;: Ends the -exec command.
'

# FINDING FILES BY USER

$ find /home -user thor -ls
$ find /home -user thor -or -user root -ls
Purpose: Finds all files in /home owned by either thor or root, and lists them.

$ find /etc -group ntp -ls
Network Time Protocol (NTP) is a protocol used to synchronize the clocks of computers over a network. It ensures that all systems maintain 
accurate and consistent time, which is crucial for various network operations, including logging, security, and time-stamping events.
      
# find /var/spool -not -user root -ls
Purpose: Finds all files in /var/spool that are not owned by the user root.

chattr (change attribute) is a command in Linux that allows you to change the attributes of a file or directory. providing various options to 
control how files are accessed or modified.

Common Uses of chattr
Preventing Accidental Deletion:

You can set the immutable attribute on a file, making it impossible to modify or delete the file even by the root user.
Data Integrity:

By using the append-only attribute, you can ensure that data can only be added to a file and not removed, which is useful for logging files.
Backup and Recovery:

Setting specific attributes can help protect critical files from being changed during system maintenance or updates.


Common Options for chattr
+i: Set the immutable attribute. The file cannot be modified, deleted, or renamed.
-i: Remove the immutable attribute.
+a: Set the append-only attribute. Data can only be appended to the file.
-a: Remove the append-only attribute.
+s: Set the secure deletion attribute. When the file is deleted, its contents are overwritten to make recovery difficult.
-s: Remove the secure deletion attribute.
+e: Set the extent format attribute, which can improve the performance of certain file types.

$ chattr [options] filename
          OR
$ # chattr +ae file
                                                                                                                                                                       
# To check the attributes of a file in Linux, including whether it is immutable, you can use the lsattr command

$ lsattr filename.txt

output _ ----i-------- filename.txt

i: Immutable attribute is set. The file cannot be modified or deleted.
a: Append-only attribute is set. Data can only be added to the file etc.





nmcli is a command-line interface used to interact with NetworkManager, which is a service that manages network connections in Linux. 
It allows users to configure, manage, and troubleshoot network settings, both for wired and wireless connections.

$ nmcli connection show

$ nmcli device wifi connect "SSID" password "your_password"
$ nmcli connection down "connection_name"

# FINDING FILES BY PERMISSION #

: 'With a hyphen (-) in front of the num-ber, all three of the bits indicated must match; with a plus (+) in front of it, any of the
numbers can match for the search to fi nd a file. The full, exact numbers must match if neither a hyphen or plus is used.
'

1. Searching for files with exact permissions using find:

$ find /bin -perm 755 -ls
-perm 755 finds files with exactly 755 permission (rwxr-xr-x).


2. Searching for directories with write permission using -perm and -type:
$ find /home/chris/ -perm -222 -type d -ls
-type d restricts the search to directories only.

With a Hyphen (-):
When you use a hyphen in front of the permission number (like -222), it checks that all the specified bits must match.
t means every bit in the permission set must match what you specify. In this case, files must have write permission for all three 
categories (user, group, and others) to be matched.

With a Plus (+):
When you use a plus sign (like +222), it checks if any of the specified bits match.

find /home -perm +222
This will find files where write permission is enabled for anyone (user, group, or others). So, a file that has write permission 
for just the user or just the group will still match.

$ find . -perm -555 -ls  # if you mention .(dot) after find that is your current directory if you mention without d and f directly -ls 
you can list files and directories.

$ $ find /myreadonly -perm +222 -type f
if you run this command with plus sign you will get error. update command is.
$ find /home/thor -perm /555 -type f

-perm +222 finds files with write permission for the user, group, or others (at least one of them).

4. Finding files with open write permission for "others":
$ find . -perm -002 -type f -ls

find . searches the current directory (.).
-perm -002 looks for files with write permission for others.
Permissions: -rw-rw-rw- (read/write for user, group, and others)


IMP  $ find . -perm -000 -type d -ls
This should only return directories where no permissions (read, write, or execute) are set for anyone (user, group, or others).
This happens because the - symbol in the find command means "any of the permission bits can match." So, the -000 flag in this context is 
interpreted as matching any directory or file where none of the permission bits are set for at least one of the user, group, or others.

# DO NOT FORGET DASH(-) BEFORE 000.

$ find . -perm 000 -type d -ls    # For directories with no permissions
find . -perm 000 -type f -ls    # For files with no permissions

   

# FINDING FILES DATE AND TIME #
: ' Date and time stamps are stored for each file when it is created, when it is accessed, when its content is modified, or when its meta 
data is changed. Meta data includes owner, group, time stamp, file size, permissions, and other information stored in the file’s inode. 
You might want to search for file data or meta data changes for any of the following reasons:
'

■
You just changed the contents of a configuration file and you can’t remember
which one. So you search /etc to see what has changed in the past 10 minutes:
$ find /etc/ -mmin -10   # So, the full form of mmin is last "modified in minutes".

■
You suspect that someone hacked your system three days ago. So you search
the system to see if any commands have had their ownership or permissions
changed in the past three days:
$ find /bin /usr/bin /sbin /usr/sbin -ctime -3

-ctime: Stands for "change time", which refers to when the file’s metadata (such as permissions or ownership) was last changed.
-3: Means files that have been changed within the last 3 days.


■
You want to find files in your FTP server (/var/ftp) and web server (/var/www)
that have not been accessed in more than 300 days, so you can see if any need to be deleted:
$ find /var/ftp /var/www -atime +300

-atime: Stands for access time, which refers to when the file was last read or accessed.
+300: Means files that haven’t been accessed in over 300 days.

-atime -300: Finds files accessed in the last 300 days.
-atime +300: Finds files accessed more than 300 days ago

4. Time Options Summary
-atime / -amin: Access time (last time the file was accessed).
-ctime / -cmin: Change time (when metadata like ownership or permissions was changed).
-mtime / -mmin: Modification time (when the file’s content was last modified).
-n: Files modified/accessed/changed in the last n minutes/days (e.g., -10 for the last 10 minutes/days).
+n: Files modified/accessed/changed more than n minutes/days ago (e.g., +300 for files not accessed in more than 300 days).
n: Files modified/accessed/changed exactly n minutes/days ago (no + or -).

find /etc -amin -10
Explanation: This command searches for files in the /etc directory that were accessed in the last 10 minutes.

2. Change Time (-ctime / -cmin):

find /etc -ctime 5
Explanation: This searches for files where the metadata (like ownership or permissions) was changed exactly 5 days ago.

4. Exact Time (No + or -):

find /etc -mtime 3
Explanation: This command finds files in /etc that were modified exactly 3 days ago (neither before nor after).

# USING NOT AND OR WHEN FINDING FILES #

:'With the -not and -or options, you can further refine your searches. There may be times when you want to find fi les owned by a 
particular user, but not assigned to a par- ticular group. You may want fi les larger than a certain size, but smaller than another
size. Or, you might want to fi nd files owned by any of several users. The -not and -or options can help you do that.
'

■
There is a shared directory called  ~thor/china This command line enables you to find files that are owned by either thor or root.

find ~thor/china \( -user thor -o -user root \) -ls
-o: This stands for "or." It allows you to specify multiple conditions where either can be true.

:'The parentheses \( ... \) in the find command are used for grouping expressions or conditions. This allows you to apply logical operators 
like -o (or) and -and (and) more effectively.'

Purpose of Parentheses \( ... \):
Grouping Conditions:

When you want to combine multiple search criteria, parentheses help you group them together.
This ensures that the logical operators (-o, -and, etc.) apply only to the conditions inside the parentheses.
Control Operator Precedence:

Similar to mathematical operations, parentheses dictate the order of operations. They tell the command which conditions should be 
evaluated first. Without parentheses, the command may not behave as you expect because the default operator precedence might lead to 
unintended results.

Inside the parentheses: -user thor -o -user root
This means "find files that are owned by either user thor or user root."

Overall Command Without Parentheses:
find ~thor/china -user thor -o -user root -ls
The command might not work as intended. This is because it could be interpreted as:
"Find files owned by thor and print the details" or
"Find files owned by root and print the details"

■
This command line searches for files owned by the user thor, but only those that are not assigned to the group thor.

# find ~thor/china -user thor -not -group thor -ls

Filters for files that are owned by user thor. Excludes files that are part of the group thor.

■
You can also add multiple requirements on your searches. Here, a file must be
owned by the user thor and must also be more than 1MB in size:

# find ~thor/china -user thor -and -size +1M -ls 

# FINDING FILES AND EXECUTING COMMANDS #

:'One of the most powerful features of the find command is the capability to execute commands on any files you fi nd. With the -exec option, 
the command you use is exe- cuted on every fi le found, without stopping to ask if that’s okay. The -ok option will stop at each matched files 
and ask if you want to run the command on it or not. The advantage of using -ok is that, if you are doing something destructive, you can
make sure that you okay each fi le individually before the command is run on it. The syntax for using -exec and -ok is the same:
'

$ $ find [options] -exec command {} \;

With -exec or -ok, you run find with any options you like to fi nd the fi les you are
looking for. Then enter the -exec or -ok option, followed by the command you want
to run on each fi le. The set of curly braces indicates where on the command line to
read in each fi le that is found. Each fi le can be included in the command line multiple
times, if you like. To end the line, you need to add a backslash and semicolon (\;).

$ find [options] -exec command {} \;

-exec command {}: This tells find to execute a specified command on each file found. The {} is a placeholder that represents each file found 
during the search. The command can be any valid command, and you can use the {} multiple times in the command.
\;: This signifies the end of the command to be executed. The backslash is necessary to escape the semicolon so that the shell does not 
interpret it as the end of the command.

 Using -exec
When you use -exec, the command is executed on every file that meets the search criteria without any confirmation. This can be powerful 
but also potentially dangerous if the command alters or deletes files.

$ find /etc -iname iptables -exec echo "I found {}" \;

/etc: This is the directory being searched.
-iname iptables: This option searches for files named iptables, case-insensitively.
-exec echo "I found {}" \;: For each file found, the command echo "I found {}" is executed, replacing {} with the file name.
'

3. Using -ok
The -ok option works similarly to -exec, but it prompts the user for confirmation before executing the command on each found file. 
This is useful for preventing accidental modifications or deletions.


$ find ~thor/china -user thor -ok mv {} ~thor/china/india \; # more clarity # -ok mv file.txt ~thor/china/india # {} in the place of file.txt

-ok mv {}:

-ok: This option is used instead of -exec to prompt the user for confirmation before executing the specified command on each file found. 
It ensures that the user has to confirm the action for each file before it is moved. mv {}: The mv command is used to move files. The {} 
acts as a placeholder for each file that find identifies that matches the criteria (owned by thor). ~thor/china/india: This is the destination 
directory where the files will be moved. It's also located within the user's home directory. So, if india does not exist, the command 
will fail. \;: This indicates the end of the command that follows -ok. The backslash (\) escapes the semicolon (;) so that the shell does 
not interpret it as the end of the command.

If the user responds with y (yes), the file will be moved to the specified destination. If the user presses Enter without typing y, 
the file will not be moved.

# find /usr/share -size +5M -exec du {} \; | sort -nr #

-exec du {}: For each file found, the du command is executed to show its disk usage.
| sort -nr: The output is piped to sort, which sorts the results numerically in reverse order (largest files first).

sort -nr:

sort: This command is used to sort lines of text. In this case, it will sort the output from the du command.
-n: This option tells sort to compare numbers numerically rather than lexicographically (as strings). This means that it will sort the 
values based on their numeric values. -r: This option tells sort to reverse the order of the sort. Instead of sorting from smallest to 
largest, it will sort from largest to smallest.

 Safety and Practical Considerations
Using -exec: Be cautious when using -exec for destructive commands (like rm, mv, or chmod) as it executes the command immediately on every 
file found. Using -ok: This is safer for potentially destructive commands since it allows you to review each file before taking action.

Documentation:

man find    # to learn find command #

# SEARCHING IN FILES WITH GREP #

The grep command is primarily designed to search through text within files rather than directories themselves.

If you want to search for fi les that contain a certain search term, you can use the grep command. With grep, you can search a single file 
or search a whole directory structure of files recursively. When you search, you can have every line containing the term printed on your 
screen (stan- dard output) or just list the names of the files that contain the search term. By default, grep searches text in a case-sensitive 
way, although you can do case-insensitive searches as well. Instead of just searching fi les, you can also use grep to search standard output. 
So, if a command turns out a lot of text and you want to find only lines that contain certain text, you can use grep to 
filter just want you want.

$ grep desktop /etc/services
desktop: The search term you're looking for.
/etc/services: The file in which you want to search for the term.
What It Does: This command searches the /etc/services file for lines containing the term "desktop." It outputs all matching lines.

$ grep thor ./file1             # thor is not a file, thor is a search term # it is inside of file1 #       
jgdadjfdfdjfdsjfdfdjfjdfdjfdjf king thor

2. Case-Insensitive Search

$ grep -i desktop /etc/services

-i: This option makes the search case-insensitive, meaning it will match "desktop," "Desktop," "DESKTOP," etc.
What It Does: It searches the /etc/services file for the term "desktop," regardless of case.
    