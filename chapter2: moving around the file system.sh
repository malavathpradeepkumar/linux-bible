: '
If you were to map out the fi les and directories in Linux, it would look like an upside-down tree.
At the top is the root directory (not to be confused with the root user), which is represented by
a single slash (/). Below that is a set of common directories in the Linux system, such as bin,
dev, home, lib, and tmp, to name a few. Each of those directories, as well as directories added
to the root directory, can contain subdirectories. 
'

# hierarchy of directories #

# /bin
# Contains essential command binaries needed for basic system operations and booting.
# Commands like cp, mv, rm, and ls are located here.

# /boot
# Stores files necessary for booting the system, including the kernel (vmlinuz), initrd, and GRUB configuration.

# /dev
# Contains device files, which represent hardware devices like disks, printers, and more as file-like interfaces.

# /etc
# Stores system-wide configuration files and scripts. This includes files like passwd, fstab, and network configurations.

# /home
# Contains personal directories for all users, where user-specific data and configurations are stored.

# /media
# Used as a mount point for removable media such as USB drives and CDs when they are inserted.

# /lib
# Contains essential shared libraries needed by the binaries in /bin and /sbin, as well as kernel modules.

# /mnt
# Provides a temporary mount point where administrators can manually mount filesystems.

# /misc
# Often used for miscellaneous mount points, including auto-mounted remote directories, though not commonly used on all systems.

# /opt
# Used to install optional or additional software packages that are not part of the default system setup.

# /proc
# A virtual filesystem that provides process and kernel-related information in real-time, such as system memory, CPU, and process details.

# /root
# The home directory for the root user (the system administrator), separate from the /home directory.

# /sbin
# Contains essential system binaries used by the root user for system administration, such as fsck, reboot, ifconfig.

# /tmp
# A temporary directory where programs can store temporary files. These files are usually deleted after reboot.

# /usr
# Contains user binaries, libraries, documentation, and source code for second-level applications (not required for booting).

# /var
# Stores variable files such as logs, mail spools, and files that are frequently written or modified during system operation.

# DIFFERENCE BETWEEN MOUNTING AND UNMOUNTING IN LINUX #

Mounting is the process of making a filesystem on a storage device accessible at a specific location in the directory tree. For example, 
when you insert your Sandisk pendrive into your Kali Linux system, you need to mount it to access its contents Insert the Pendrive: When 
you plug in your Sandisk pendrive, the system detects it but doesn’t immediately make it accessible in the directory tree.
Find the Device Identifier: you can use
$ lsblk or fdisk -l

Create a Mount Point: This is a directory where you will access the contents of the pendrive
$ sudo mkdir /media/my_pendrive
Mount the Device: Use the mount command to attach the filesystem of the pendrive to the mount point.
$ sudo mount /dev/sdb1 /media/my_pendrive
After this command, you can access the contents of your pendrive by navigating to /media/my_pendrive.

Unmounting
Unmounting is the process of detaching the filesystem from the directory tree, which means the system will no longer have access to the 
pendrive's contents until it's mounted again. Close Files and Directories: Before unmounting, make sure no files on the pendrive are open 
and no directory within the mount point is being used.
$ sudo umount /media/my_pendrive  or sudo umount /dev/sdb1
Mounting: Connects a filesystem to a directory in the system so you can access its files.

:'What is /dev/?
The /dev/ directory in Linux contains device files. These files represent hardware devices like disks, partitions, USB drives, and more. 
Each hardware device (such as your Sandisk pendrive) is mapped to a file under /dev/, which the system uses to interact with the device.
/dev/sdb represents the whole USB drive.
/dev/sdb1 represents the first partition on that drive.
'

:'What is /media/?
In Linux, the /media/ directory is typically used as a mount point for removable media like USB drives, external hard drives, CD/DVDs, etc. 
It’s a predefined directory where external storage devices are mounted to make their contents accessible to the system and users.
'
# takes you up three directory levels (to /), and then takes you into the /usr directory #
$ cd ../../../usr  # now you are in /home/thor type this command.  firt type just cd ../ then type pwd to oberseve
$ cd /../../../../home/thor/china/india/spain # now you are in /usr type this command


:'Understanding Relative Paths
You mentioned using cd ../../../usr from your current directory /home/thor. Here's how it works:

Current Directory: /home/thor

Command: cd ../../../usr

.. means "go up one level."
../../../ means "go up three levels."
After going up three levels, you move into the usr directory.Path Breakdown Starting at /home/thor, let's break it down step-by-step:
First ..: Moves up one level from /home/thor to /home. Second ..: Moves up one more level from /home to /. Third ..: Moves up again from / to 
the root directory /. Since you are already at the root level, you stay at /. At this point, you're at the root directory /. Then usr: Moves
into the usr directory from the root /. So, the absolute path you are accessing is /usr.
'

: 'Understanding Relative and Absolute Paths  # present i am in /home/thor # if run cd/../../../spain # doesn't work why#
Absolute Path: Starts from the root directory /. For example, /home/thor/china/india/spain is an absolute path that specifies the 
complete path from the root. Relative Path: Starts from your current directory and specifies the path relative to that directory.
Your Current Example Current Directory: /home/thor Command: cd /../../../spain,  Path Breakdown Leading / (root) The leading / makes this an 
absolute path starting from the root directory /../../../: This moves up three levels from the root directory / Since you are already at the 
root when starting with /, #(/home/thor) already representing / before /home # moving up does  not change your location; you stay at 
the root /, spain: From the root /, this is interpreted as /spain, not as /home/thor/china/india/spain.
'


$ ls -ld test1 test2 ../spain   # i am inside the spain direcoty if you want to see files as well as spin direcoty permission at a time.

$ ls -ld test1 test2 spain # if you ran this command inside the spain direcoty it will cause error why #

:'The command ls -ld test1 test2 spain is failing because spain is not a file or directory within the spain directory; rather, 
it is the directory you're currently inside.
'

# 2nd METHOD #  /home/thor/china/india/spain below command inside the spain directory.

$ ls -ld test1 test2 . ..

:' .(singile dot): Refers to the current directory (spain in this case), so you can see the permissions of spain itself.
.. (double dot): Refers to the parent directory (the directory that contains spain, which is india in your case), so you can see 
its permissions as well.

The -l option tells ls to display detailed information about files and directories in a long format.

-d (directory):  The -d option tells ls to show information about the directory itself, not its contents. Normally, running ls on 
a directory lists the files inside the directory, but -d makes ls treat the directory as a file so that it shows information about 
the directory as a whole. OUTPUT: drwxrwxr-x 2 user user 4096 Sep 16 17:52 spain
'

$ chmod 000 ../spain   # if you want to give 777 permision again use sudo chmod 777 ../spain
$ chmod 777 .. .

# USING METACHARACTERS AND OPERATORS #

: 'Whether you are listing, moving, copying, removing, or otherwise acting on fi les in your Linux system, certain special characters, 
referred to as metacharacters and operators, help you to work with fi les more effi ciently. Metacharacters can help you match one 
or more fi les without completely typing each fi le name. Operators enable you to direct information from one command or fi le to another 
command or file.
'

# USING FILE MATCHING METACHARACTERS # WORKS FILES AS WELL AS DIRECTORIES # LIST IT, OPEN IT AND REMOVE IT #
# * — Matches any number of characters.
# ? — Matches any one character.
# [...] — Matches any one of the characters between the brackets, which can include a hyphen-separated range of letters or numbers.

$ touch apple banana grape grapefruit watermelon

$ ls *a    # matching ending character a.
banana  zebra

ls a*  # matches any file that begins with an 'a' (apple)
output: apple

$ rm a*   # remove bigins with an 'a' that is apple

$ mv a* /home/thor/china/india  # move form spain dirctory to india directory #

$ ls *a*   # Any file that contains an 'a' in the name is matched #
apple  banana  cat  grape  grapefruit  island  lamp  parrot  rat  van  watermelon  zebra

$ ls g*t    # files beginning with 'g' and ending in 't' are matched
got  grapefruit  
            

# pattern matching with the question mark (?): #

$ ls ????e   #  any five-character file that ends in e #
apple  grape

$ ls g???e*   # File that begins with g and has e as its fifth character #
grape  grapefruit


# pattern matching: #

$ ls [abw]*  # any file beginning with a, b, or w is matched #
apple  banana  watermelon

$ ls *[etg]  # any file ending with e, t, or g is matched #
apple  cat  dog  egg  got  grape  grapefruit  parrot  rat

$ ls [hjl]*[nrp]   # without space between brackets, h, j, or l and also ends with either n, r, p is matched
hen  joker  lamp

$ ls [a-z]*    #  any fi lenames beginning with a letter from a through z are matched.
apple  banana  cat  dog  egg  fish  fox  got  grape  grapefruit  hen  island  joker  lamp  parrot  queen  rat  van  watermelon  zebra
                                                              

# 3. Square brackets ([]) - Matches any one of the enclosed characters
# Usage: Used for matching a specific set or range of characters
ls file[123].txt  # Lists file1.txt, file2.txt, file3.txt

# 5. Negation ([!]) - Matches any character NOT in the brackets
# Usage: Matches any character except those in the brackets
ls file[!1-3].txt  # Lists files except file1.txt, file2.txt, file3.txt

if you run above command in zsh shell you will get error why #

Zsh treats ! differently than Bash:

In Zsh, the ! symbol is used for history expansion. This means that Zsh looks for a previous command in your history when you type ! 
(like !1 would refer to the first command in history). So, when you tried ls file[!1-3], Zsh tried to expand !1, but no matching command 
was found in the history, hence the error zsh: no such event: 1.

Why use the backslash (\)?
In Zsh, you need to escape the ! so that the shell doesn't interpret it as a history event. Escaping a character means telling the shell 
to treat the character literally, not as a special symbol.

$ ls file[\!123]                             
file4  file5  file6
                                                                                                                                                                      
$ ls file[\!1-3]
file4  file5  file6


# 6. Curly brackets ({}) - Brace expansion, allows specifying multiple choices
# Usage: Matches a set of filenames or patterns
ls file{1,2,3}.txt  # Lists file1.txt, file2.txt, file3.txt

# 7. Backslash (\) - Escape character to take a literal meaning of metacharacters
# Usage: Escapes special characters
ls file\?.txt  # Lists file?.txt (filename with actual question mark)

# 8. Tilde (~) - Home directory
# Usage: Represents the home directory of the current user
ls ~/Documents  # Lists contents of the Documents folder in the home directory


# USING FILE REDIRECTION METACHARACTERS # PIPE(|) FOR COMMADS REDIRECTIONS NOT FOR FILES  #

:'The < and > signs (redirection operators) in Linux/Unix are used only for redirecting input and output between commands and files, 
not for user accounts, or other system resources
'


# With files, you can use less than (<) and greater than (>) signs to direct data to and from files.

: '< — Directs the contents of a file to the command. In most cases, this is the default action expected by the command and the use of 
the character is optional; using less bigfile is the same as less < bigfile.
'

┌──(thor㉿thor)-[~/china/india/spain] # sort means ascending and descending order alphabetical for letters and numerical for numbers.
└─$ sort file1      
my name is pradeep kumar i am from hyderabad my goal is lerning python, and i love python as well as linux i love zsh shell thank you.
                                                                                                                                                                      
┌──(thor㉿thor)-[~/china/india/spain]
└─$ sort < file1
my name is pradeep kumar i am from hyderabad my goal is lerning python, and i love python as well as linux i love zsh shell thank you.

: ' > — Directs the standard output of a command to a file. If the file exists, the content of that file is overwritten.The > symbol in 
Linux is used for output redirection. It directs the standard output (stdout) of a command to a file. If the file already exists, 
its content is overwritten. If the file doesn't exist, a new file is created.
'                                       

$ echo "Hello, World!" > output.txt

If output.txt exists, the text "Hello, World!" will replace everything in the file.
If output.txt doesn't exist, it will create the file and then write "Hello, World!" inside it.

2> — Directs standard error (error messages) to the file. the 2> redirection is used to redirect standard error (stderr) to a file. 
This is useful for capturing error messages separately from regular output.

$ ls /nonexistentdirectory 2> error.txt

If you run the above command, the error message (ls: cannot access /nonexistentdirectory: No such file or directory) 
will be written to error.txt.

Redirect Both stdout and stderr:

─(thor㉿thor)-[~/china/india/spain]
└─$ ls ~/Music / hela > output.txt 2> error.txt

in the above ~/Music direcoty is exist and hela direcotory is does not exist.
> output.txt: Redirects the standard output (stdout), which is the successful listing of /existing_directory, to output.txt.
2> error.txt: Redirects the standard error (stderr), which is the error message for /nonexistent_directory, to error.txt.

┌──(thor㉿thor)-[~/china/india/spain]
└─$ ls ~/china/india / hela > file5 2> file1  
                                                                                                                                                                      
┌──(thor㉿thor)-[~/china/india/spain]
└─$ ls /home/thor/china/india > file5 2> file1

$ ls ~/Music ~/china/india > output.txt 2> error.txt # both list Music and india directory if you want. #

# &> — Directs both standard output and standard error to the file.
the &> redirection operator is used to redirect both standard output (stdout) and standard error (stderr) to the same file. 
This means that all the normal output of the command, as well as any error messages, will be written to a single file.

┌──(thor㉿thor)-[~/china/india/spain]
└─$ ls /home/thor/china/india /kali &> file5  
                                                                                                                                                                      
┌──(thor㉿thor)-[~/china/india/spain]
└─$ cat file5

The >> redirection operator in Linux is used to append the output of a command to the end of an existing file, without overwriting the 
file's contents. If the file does not exist, it will create the file first.                 

──(thor㉿thor)-[~/china/india/spain]
└─$ echo "Hi malavath pradeep kumar" >> file5

Appending Error Messages: You can also append error messages using 2>> to add errors to an existing error log.

cat file5                    
ls: cannot access '/kali': No such file or directory
/home/thor/china/india:
file1
file1?
file2
file3
file4
file5
file6
hela
spain
Hi malavath pradeep kumar
ls: cannot access '/king': No such file or directory
                                                   

# Appending Both stdout and stderr: #

──(thor㉿thor)-[~/china/india/spain]
└─$ ls /home/thor/china/india /vizag >> output.txt 2>> error.txt

: ' the above output.txt there is alredy some contents have and new contents has added at the end of file and error.txt file has previous 
error message and newly vizag error message has added at the end of the file.
'
        # OR
┌──(thor㉿thor)-[~/china/india/spain]
└─$ ls /home/thor/china/india /nizamabad &>> error.txt

$ mail root < ~/.bashrc 

:' Explanation:
mail root: This command is used to send an email to the user root. The mail command is typically used in Unix/Linux systems to send emails 
from the terminal. < ~/.bashrc: This part of the command uses input redirection (<) to take the contents of the ~/.bashrc file and pass 
it as the input to the mail command. Result: The content of the ~/.bashrc file (a script that runs when the user logs in) is sent as an email 
to the root user.
'

$ mail < root < ~/. bashrc  # if you mention < this before root you will get error why #   

Why It's Incorrect:
< root: The shell tries to interpret root as a file or input source because of the < symbol, but root is not a file—it's the intended 
recipient of the email. This will result in an error since root is not a valid file.
Double Redirection: Using two input redirections (< root < ~/.bashrc) doesn't make sense in this context. The mail command expects one 
input stream to be redirected, not multiple.

:'The < and > signs (redirection operators) in Linux/Unix are used only for redirecting input and output between commands and files, 
not for user accounts, or other system resources.
'

: ' , the reason why there is no need for a pipe (|) or any other metacharacter between mail and root is because root is the argument 
(recipient) of the mail command, not part of the input or output redirection. A pipe (|) is used to pass the output of one command as the 
input to another command. In this case, there’s no need for a pipe because you’re not chaining commands together. Instead, you’re:
Calling the mail command, specifying root as the recipient.
'

──(thor㉿thor)-[~/china/india/spain]
└─$ man chmod | col -b > /tmp/chmod

: 'Explanation:
man chmod: This command displays the manual page (documentation) for the chmod command, which is used to change file permissions.
| col -b: The pipe (|) takes the output of man chmod and passes it to the col -b command. The col -b command removes backspace characters 
and formatting (like underlining and bold text) from the man page output, making it plain text. > /tmp/chmod: The > operator redirects the 
plain text output (from col -b) to a file called chmod in the /tmp directory. If the file exists, it will be overwritten.
'

man chmod, chmod is an argument to the man command, not a redirection or pipe operation.
man:
This is the command that displays the manual (man) pages for a given command or program in Unix/Linux systems.
How It Works:
The command man chmod tells the system: "Show me the manual page for the chmod command."
The man command searches for the manual page associated with chmod (stored in the system's manual database) and displays it on the 
terminal for you to read.
# col -b # full form of col is column used to filter and format text by removing control characters such as backspaces, tabs, and 
carriage returns.  -b flag means (no backspaces):

┌──(thor㉿thor)-[~/china/india/spain]
└─$ echo "I finished project on $(date)" >> ~/projects 

echo "I finished the project on $(date)": The echo command prints the string "I finished the project on $(date)". The $(date) part 
is a command substitution, which runs the date command and replaces it with the current date and time. 
>> ~/projects: The >> operator appends the output of the echo command to the file ~/projects. If the file does not exist, it will be 
created. The >> ensures that the new text is added to the end of the file without overwriting the existing contents.

The echo command is used to display text or output to the terminal.
"I finished the project on $(date)" is the argument passed to the echo command. Everything inside the quotes is treated as a 
single argument (a string of text) that echo will print.

So, "I finished the project on $(date)" will be transformed into something like "I finished the project on Tue Sep 21 14:45:00 UTC 2024" 
(depending on the current date and time).


# VIWE THE CONTENTS OF A FILE DIRECTLY IN THE TERMINAL #

1. cat (Concatenate and display file content)  This command outputs the entire content of the file to the terminal in one go.
$ cat filename

2. less (View file content one page at a time) useful for viewing large files.
$ less filename   Use the Space key to move to the next page. Press q to quit

3. more (View file content one page at a time)
$ more filename  Use Enter to move down one line at a time. Use Space to move down one page at a time. Press q to quit.

4. head (View the first few lines of a file) By default, it shows the first 10 lines of the file. You can adjust the number of lines 
$ head filename    head filename -n 20 first 20 lines  displayed using the -n option.

5. tail (View the last few lines of a file)   By default, it shows the first 10 lines of the file. You can adjust the number of lines 
 $ tail filename   displayed using the -n option.

6. nl (Numbered lines output)
$ nl filename This command displays the file content along with line numbers.


Here documents involve entering two less-than characters (<<) after a command, followed by a word. All typing following that word is taken 
as user input until the word is repeated on a line by itself.


Here Document (<<) Explanation:
A Here Document is a way to give multiple lines of input to a command without needing to use a file. You use the special 
operator << followed by a word, which acts as a delimiter. The delimiter is a word that marks where your input starts and ends. 
When the shell sees the delimiter, it knows when to stop reading your input.
 
How the Here Document Works:
After the command, you use << followed by a delimiter (like END).
Everything you type after this will be treated as input to the command until you type the delimiter word (END) on a line by itself.
Once the shell sees the delimiter (END), it stops reading the input and runs the command.


$ mail root thor cnegus rjones bdecker <<END
> I want to tell everyone that there will be a 10 a.m.
> meeting in conference room B. Everyone should attend.
>
> -- James
> END
$


The recipients of the email are root, cnegus, rjones, and bdecker (these are the usernames of people who will receive the email).

<<END:

This tells the shell to expect more input for the mail command. END is the delimiter, which marks the end of the input. You could use any 
word here, but we chose END for simplicity. Multiline Input:

The lines starting with > are the body of the email. This is what the recipients will see in their inboxes.
You can write as many lines as you want.

END:

Once you type END on a new line by itself, it signals to the shell that you have finished typing the input.
After seeing END, the shell sends the email using the message you typed.

     # OUTPUT #

I want to tell everyone that there will be a 10 a.m.
meeting in conference room B. Everyone should attend.

-- James

# TO SEE MAIL MESSAGE # mail -u thor #



sudo ex /etc/resolv.conf <<EOF
a
nameserver 100.100.100.100
.
w
q
EOF



: 'Breakdown of the Command
Command: sudo ex /etc/resolv.conf

This opens the ex editor for the file /etc/resolv.conf with superuser privileges.
Here Document: <<EOF

This indicates that the following lines until EOF are to be passed as input to ex.
Commands within ex:

a: Append text after the current line.
nameserver 100.100.100.100: The line you want to add.
.: Marks the end of the appended text.
w: Write the changes to the file.
q: Quit the editor.
Delimiter: The word EOF

This marks the end of the here document. You can use any word, but it must match at both the beginning and end.
Important Note
Permissions: As before, since you are modifying a system file, you will need superuser privileges, hence the use of sudo.

ex is the command-line mode of vi You can always switch to ex mode from within vi by typing : and then entering a command 
like w (write) or q (quit), which are both ex commands. vi is not a graphical text editor. It is a text-mode editor that runs inside 
the terminal  Editors like Gedit or VS Code are examples of graphical editors
'

# USING BRACE EXPANSION CHARACGTERS #

# By using curly braces ({}), you can expand out a set of characters across filenames.

┌──(thor㉿thor)-[~/china/india/spain]
└─$ touch file{1,2,3,4,5}  

──(thor㉿thor)-[~/china/india/spain]
└─$ touch {Pradeep,Sharath,Saikumar}-{Breakfast,Lunch,Dinner}    # Without space # after this command if you run ls you will see file
alphabetical order you will see pradeep first becuase p comes before s like that.

┌──(thor㉿thor)-[~/china/india/spain]
└─$ touch {a..f}-{1..5}                                      
the use of two dots between letters a and f and numbers 1 and 5 specifies the ranges to be used.     

# LISTING FILES AND DIRECTORIES #
 symbolic link creating syntax                  # ln -s target_path link_name #
A symbolic link (also known as a symlink or soft link) is a special type of file that points to another file or directory. It acts as a 
shortcut to access a target file or directory from a different location without duplicating the actual data. Key Points About 
Symbolic Links:Reference: A symbolic link contains the path to the original file or directory. Target Independence: If you delete the 
symbolic link, the original file or directory remains unchanged. Broken Links: If the target is moved or deleted, the symbolic 
link becomes a "broken" link, and accessing it will fail.

──(thor㉿thor)-[~/china/india/spain]
└─$ ln -s $(pwd) ~/korea

                        # OR #
─(thor㉿thor)-[~]
└─$ ln -s ~/china/india/spain ~/germany
                                           

Explanation:
ln -s: Creates a symbolic (soft) link.
$(pwd): This command outputs the current directory path (~/china/india/spain).
~/korea: The name and location of the symbolic link you're creating (in this case, korea in your home directory).

Test the Link

$ cd ~/korea

Is It Necessary?
If you want the symbolic link to be created in your home directory, then yes, you should use ~/ or specify the full path 
like /home/thor/korea. If you want to create the symbolic link in your current directory or any other specific directory, 
then you don't need ~/.

┌──(thor㉿thor)-[~/korea]
└─$ rm ~/korea

Important Notes:
Only the symbolic link will be deleted, not the target directory (spain in your case).
If the symbolic link points to a directory, do not use the rm -r or rm -rf commands, as they will delete the target directory, 
not just the symbolic link. a symbolic link points to a directory," it means that the symbolic link is acting as a reference or 
shortcut to a directory (or folder).

┌──(thor㉿thor)-[~/china/india/spain]
└─$ ls -la /home/thor 
total 6898080
drwxr-xr-x 49 thor thor       4096 Sep 23 08:02  .     
drwxr-xr-x  3 root root       4096 Jun  3 15:02  ..      

dot (.) represents /home/joe and two dots (..) represent /home — the parent directory of /joe.


In Linux file permissions, the execute permission is typically represented by the letter x. However, when you see an s in place of x 
in the permissions string, it indicates a special permission called the setuid or setgid bit.
Execute (x): When a file has the execute permission set, it means that the file can be run as a program. For example, a script or 
binary file can be executed by users.

Setuid and Setgid
Setuid (s): If the execute bit for the owner (first x in the owner's permissions) is replaced by an s (e.g., -rwsr-xr-x), it means that 
when a user runs this executable, it runs with the privileges of the file's owner, not the user who ran it. 

Setgid (s): If the execute bit for the group (first x in the group’s permissions) is replaced by an s (e.g., -rwxr-sr-x), it means that 
when a user runs this executable, it runs with the privileges of the group that owns the file.

Example Use Case
A common example of a setuid program is passwd, which allows a user to change their password. The passwd program is owned by the root user, 
and when executed, it runs with root privileges, even if a regular user is running it.

 The mount Command  -rwsr-xr-x

Owner (root): Can read, write, and execute the command.
Group and Others: Can read and execute it, but cannot modify it.
The setuid bit (s) means that when any user runs mount, the command runs with root privileges, enabling the user to execute certain 
functions of the command (like listing mounted filesystems) that would normally require higher permissions.

When Regular User (thor) Runs the Command:
If you, as the regular user (thor), run the mount command:
Normally, you would not have permission to perform actions like mounting filesystems because they require root privileges.
However, because the setuid bit is set, when you run mount, it executes with root privileges.
This means you can perform certain actions that normally require root access, like listing mounted filesystems, because the command 
runs as if it were executed by the root user.

The mount command runs with root privileges because of the setuid bit. If my_mount creates a temporary file (e.g., a lock file) during its 
operation, that file will inherit the group of my_mount, not thor's current group. 
For my_mount:
Any user can execute it, but the command's operation is controlled by the root user.
If a new file is created by this command, it will belong to the group associated with my_mount, which may have special permissions 
or capabilities that regular users do not have.


:' Sticky Bit (t)
Indicator: If you see a t at the end of the directory's permissions (e.g., drwxrwxr-t), it means the sticky bit is set.
Function:
This allows multiple users to write to the directory (e.g., /tmp), meaning they can add files. However, it prevents users from deleting or 
renaming files owned by other users within that directory. Only the file owner, the directory owner, or the root user can delete or 
rename those files. Example: In a directory with permissions drwxrwxr-t, any user can create files, but only the owner of a specific 
file can delete or modify it.



 Plus Sign (+)
Indicator: If you see a + at the end of the permission bits (e.g., -rw-rw-r--+), it indicates that the file has extended attributes, 
such as Access Control Lists (ACLs) or SELinux policies.
Function: Extended attributes allow for more granular permission settings beyond the standard user/group/other model. This is useful 
for defining specific permissions for multiple users or groups.
Example: In a file with permissions -rw-rw-r--+, there may be additional ACLs that specify detailed permissions for users beyond 
the owner, group, and others.

# If you see a capital S or T instead of the execute bits on a directory. #

Capital S or T
Capital S: Indicates that the set GID is set, but the execute permission for the group is not.
Capital T: Indicates that the sticky bit is set, but the execute permission for others is not.

# INDENTIFYING DIRECTORIES #

──(thor㉿thor)-[~]
└─$ echo $HOME        This environment variable stores your home directory name.                                  
/home/thor


~ — The tilde (~) represents your home directory on the command line. You can also use the tilde to identify someone else’s home directory. 
For example, ~joe would be expanded to the joe home directory (probably /home/joe). So, if I wanted to go to the directory /home/joe/test, 
I could type cd ~joe/test to get there.

■ . — A single dot (.) refers to the current directory.
■ .. — Two dots (..) refer to a directory directly above the current directory.
■ $PWD — This environment variable refers to the current working directory.
■ $OLDPWD — This environment variable refers to the previous working directory before
you changed to the current one. (Typing cd – returns you to the directory represented
by $OLDPWD.)


┌──(thor㉿thor)-[~]
└─$ ls -F   
With the -F option, a backslash (/) appears at the end of directory names, an asterisk (*) is added to executable 
files, and an at sign (@) is shown next to symbolic links.

$ ls --hide=g*   # file beginning with g does not appear in the output #

┌──(thor㉿thor)-[~/china/india]
└─$ ls -ld $HOME/spain
ls: cannot access '/home/thor/spain': No such file or directory
                                                                                                                                                                      
┌──(thor㉿thor)-[~/china/india]
└─$ ls -ld $HOME/china/india
drwxrwxrwx 3 thor thor 4096 Sep 23 10:15 /home/thor/china/india

#  -d option on a directory shows information about that directory instead of show- ing the fi les and directories the directory contains #

(thor㉿thor)-[~]
└─$ mkdir -p $HOME/nepal/netherland/bhutan/bangladesh     # To create multiple directory layers (-p is needed) #

$ sudo rmdir -p $HOME/nepal/netherland/bhutan/bangladesh  # The -p (or --parents) option allows you to create parent directories #

$ sudo rm -r $HOME/nepal/netherland/bhutan/bangladesh  # if you have contents in those directories # rm command with the -r (or --recursive).
$ sudo rm --recursive $Home/nepel   # $Home/nepal as same as full path is /home/thor/nepal.

The -R option lists all fi les in the current directory as well as any fi les or directories that are associated with the original
directory. The -S option lists fi les by size.

──(thor㉿thor)-[~/china]
└─$ ls -R
.:
india

./india:
 bank   file1  'file1?'   file2   file3   file4   file5   file6   germany   grameena   hela   spain

./india/spain:
bank  file1  file2  file3  file4  file5  germany  grameena  nepal

$ ls -S

# UNDERSTANDING FILE PERMISSIONS AND OWNERSHIP # nine bits assigned to each fi le for permissions

For a regular file, a dash appears in front of the nine-bit permissions indicator. Instead of a dash, you might see a d
(for a directory), l (for a symbolic link), b (for a block device), c (for a character device), s (for a socket), or p (for a
named pipe).



Block Device (b)
Definition: A block device is a type of device file that provides buffered access to hardware devices, allowing data to be 
read or written in blocks (usually 512 bytes or more). Examples: Hard drives, USB drives, and other storage devices.
Usage: Block devices allow for random access, meaning you can read or write data at any position on the device.

Character Device (c)
Definition: A character device is a type of device file that provides unbuffered, direct access to hardware devices, 
allowing data to be read or written one character at a time. Examples: Serial ports, keyboards, and mice.
Usage: Character devices are used for devices that need to process data in a sequential manner, typically handling streams of data.

 Socket (s)
Definition: A socket is a special file that provides a way for processes to communicate with each other, either on the same 
machine or over a network. Examples: Network sockets used in applications like web servers or database servers.
Usage: Sockets facilitate inter-process communication (IPC) by enabling data exchange between different processes, regardless of 
whether they are on the same machine or different machines.

Named Pipe (p)
Definition: A named pipe (also called a FIFO, or First In First Out) is a special file that allows for communication 
between processes. Unlike regular pipes, named pipes have a name in the filesystem and can be accessed by multiple processes.
Examples: Any processes that need to exchange data can use named pipes.
Usage: Named pipes allow one process to write data to the pipe while another process reads from it, maintaining the order of data.

Buffered I/O
Definition: Buffered I/O involves using a temporary storage area (buffer) to hold data while it is being transferred between the application and 
the device.
How It Works:
When data is written, it goes into the buffer first. The system can then write the contents of the buffer to the device in larger chunks, reducing the number of I/O operations.
Similarly, when reading, data is first read into the buffer and then from there to the application.

Unbuffered I/O
Definition: Unbuffered I/O means that data is transferred directly between the application and the device without any intermediate storage.
How It Works: When data is written, it goes straight to the device, and when data is read, it comes directly from the device to the 
application. A group in Linux is essentially a collection of users. Groups are used to simplify and manage access control to resources 
like files, directories, and devices. Instead of setting permissions for each user individually, you can assign permissions to a group. 
Any user in that group will automatically inherit those permissions.

1. Create the Users

sudo useradd alice
sudo useradd bob
sudo useradd charlie

You may also want to set passwords for them:

sudo passwd alice
sudo passwd bob
sudo passwd charlie

Create the Group
Now, create the group called project_team:

sudo groupadd project_team

3. Add Users to the Group  -aG adds users to the specified group without removing them from their current groups.

sudo usermod -aG project_team alice
sudo usermod -aG project_team bob
sudo usermod -aG project_team charlie

4. Create the Shared Directory
sudo mkdir /project_directory

5. Set Group Ownership of the Directory

sudo chown :project_team /project_directory

6. Set Permissions for the Directory
sudo chmod 770 /project_directory

Ensure New Files Are Owned by the Group
To ensure that any new files created in /project_directory inherit the project_team group ownership, set the "setgid" bit on the directory:

sudo chmod g+s /project_directory


# Changing permissions with chmod (numbers) #  # r=4, w=2, and x=1 #

# chmod 000 file


The chmod command also can be used recursively. For example, say you wanted to give an entire directory structure 755 permission 
(rwxr-xr-x), starting at the $HOME/myapps directory. To do that, you could use the -R option, as follows: $ chmod -R 755 $HOME/myapps
All fi les and directories below, and including, the myapps directory in your home directory will have 755 permissions set.

┌──(thor㉿thor)-[~]
└─$ chmod -R 777 $HOME  all directories like downloads and documents and music and china india spain will have 777 permission.

# Changing permissions with chmod (letters) #

Each fi le you can change permission for the user (u), group (g), other (o), and all users
(a). What you would change includes the read (r), write (w), and execute (x) bits. 

The following chmod command results in this permission: r-xr-xr-x
chmod a-w file

The following chmod command results in this permission: rwxrwxrw-
chmod o-x file  # others #

$ chmod go-rwx file   # group and others #

$ chmod ug+rx files

$ chmod -R o-w $HOME/myapps
$ chmod -R o-w $HOME

# Setting default file permission with umask. #

$ umask    # if you see umask like this just ignore the leading zero #
0002

What is umask?
umask (short for user file creation mask) in Linux determines the default file permissions that are set when a new file or directory is 
created. It essentially controls what permissions will not be set on newly created files and directories by subtracting certain permissions.


Now Applying It to Your Case:
On your Kali Linux, you said the current umask is 002.

To understand how the permissions are calculated when a new file or directory is created, let’s break it down by replacing this umask 
with your provided defaults.
1. Regular User's File Creation Permissions (rw-rw-r--): The default file permission on Linux is 666 (read and write for everyone).
When you apply umask 002: Default permissions for a file: 666 Umask: 002 Subtract the umask from the default permission:

666 - 002 = 664

So, the default file permission with a umask of 002 is rw-rw-r--, exactly what you see for regular users when creating a file


2. Regular User's Directory Creation Permissions (rwxrwxr-x):
The default directory permission on Linux is 777 (read, write, execute for everyone).
When you apply umask 002:
Default permissions for a directory: 777
Umask: 002
Subtract the umask from the default permission:

777 - 002 = 775

So, the default directory permission with a umask of 002 is rwxrwxr-x, which is what you observe when creating directories as a regular user.

Root User's File Creation Permissions (rw-r--r--):
The umask for root users is typically 022. Let's apply this to file creation.
Default permissions for a file: 666
Umask for root: 022
Subtract the umask from the default permission:

666 - 022 = 644
This gives the default file permission of rw-r--r-- for root users.
Root User's Directory Creation Permissions (rwxr-xr-x):
The default directory permission is 777.
Default permissions for a directory: 777
Umask for root: 022
Subtract the umask from the default permission

# HOW TO CREATE FILE AND DIRECTORY FULL PERMISSION LIKE 777 #

Understanding umask 000:
umask works by subtracting permissions. When the umask is set to 000, it does not remove any permissions from the default.
For files, the default permission is 666 (read and write for everyone). By using a umask of 000, you keep the 666 permissions.
For directories, the default permission is 777 (read, write, and execute for everyone). A umask of 000 results in directories retaining 777.
However, files cannot have 777 permissions by default because execute permission is typically not set on files unless explicitly done. 
You would still get 666 for files (read and write for all users), but you can manually change this.

$  umask 000

4. Making the umask Persistent:
If you want the umask to stay as 000 even after you log out, you can add the following line to your shell’s configuration 
file (like ~/.bashrc or ~/.zshrc for your thor user):

 umask 000    # ADD THIS TO ABOOVE  FILE #

 THEN RUN THIS  After adding this, run:

source ~/.bashrc  # for Bash users
source ~/.zshrc   # for Zsh users

$ umask 777 ; touch file01 ; mkdir dir01 ; ls -ld file01 dir01


If you want to permanently change your umask value, add a umask command to the .bashrc fi le in your home directory 
(near the end of that fi le). The next time you open a shell, your umask will be set to whatever value you chose.

# CHANGING FILE OWNERSHIP AS WELL AS DIRECTORIES #

As a regular user, you cannot change ownership of a file or directory to have them belong to another user. You can change ownership as 
the root user. For example, say you created a file called file1, while you were root user, in the user thor's home direc-
tory. Here’s how you could change it to be owned by thor.

┌──(root㉿thor)-[/home/thor/china/india/spain]  # Remember I am creating these in root observe pound symbol #
└─# touch file{1,2} ; mkdir {pradeep,sharath}
             
──(root㉿thor)-[/home/thor/china/india/spain]
└─# ls -l
total 8
-rw-r--r-- 1 root root    0 Sep 24 09:08 file1
-rw-r--r-- 1 root root    0 Sep 24 09:08 file2
drwxr-xr-x 2 root root 4096 Sep 24 09:08 pradeep
drwxr-xr-x 2 root root 4096 Sep 24 09:08 sharath

# on the above observe file1 and file2, belongs to root.
# chown thor file1 file2 pradeep sharath  # this is command pradeep and sharath are directories #

┌──(root㉿thor)-[/home/thor/china/india/spain]
└─# ls -l
total 8
-rw-r--r-- 1 thor root    0 Sep 24 09:08 file1
-rw-r--r-- 1 thor root    0 Sep 24 09:08 file2
drwxr-xr-x 2 thor root 4096 Sep 24 09:08 pradeep
drwxr-xr-x 2 thor root 4096 Sep 24 09:08 sharath

# now we changed not only file but also directories #   

Notice that the chown command changed the user to thor but left the group as root.
To change both user and group to thor, you could type the following instead:

┌──(root㉿thor)-[/home/thor/china/india/spain]
└─# chown thor:thor file1 file2 pradeep sharath
                                                                                                                                                                       
┌──(root㉿thor)-[/home/thor/china/india/spain]
└─# ls -l
total 8
-rw-r--r-- 1 thor thor    0 Sep 24 09:29 file1
-rw-r--r-- 1 thor thor    0 Sep 24 09:29 file2
drwxr-xr-x 2 thor thor 4096 Sep 24 09:29 pradeep
drwxr-xr-x 2 thor thor 4096 Sep 24 09:29 sharath


   OR

The command chown thor:thor . only changes the ownership of the current directory itself, but not its contents (files and subdirectories). 
If you want to change the ownership of all files and directories within the current directory, you need to use the -R 
option for recursive changes.

# chown -R thor:thor .     # .(dot) represent current directory observe dot after thor #

if you inserted a USB drive, which is mounted on the /media/myusb directory, and wanted to give full ownership of the contents of 
that drive to the user thor, you could type the following:

# chown -R joe:joe /media/myusb

$ cd -  # dash not tilde If you want to switch back to the last directory you were in, you can use: #

2nd method but you can only go back to previous diectory
$ pushd /home/thor/china/india/spain # first create a path
$ popd   # go back to previous directory #

4. Using Shortcuts with Tab Completion:
$ cd ~/ch
$ cd ~/china/


$ alias spain='cd ~/china/india/spain'
consider creating an alias in your shell configuration file (like ~/.bashrc or ~/.zshrc):

# MOVING, COPYING, AND REMOVING FILES #

Commands for moving, copying, and deleting fi les are fairly straightforward. To change the location of a fi le, use the mv command. 
To copy a fi le from one location to another, use the cp command. To remove a fi le, use the rm command. These commands can be
used to act on individual fi les and directories or recursively to act on many files and directories at once.


──(thor㉿thor)-[~/china/india/spain] 
└─$ mv books pens      # moves the file books to the file pens in the same directory (essentially renaming it)
if you run above command if you have any content in books that will store in pens, if you have any old content in pens file will be 
overwritten and books file will be deleted.

$ $ mv pens ~    # moves pens file to home directory #

┌──(thor㉿thor)-[~/books]
└─$ mv /home/thor/books/ /home/thor/china/india/spain      

The next command moves the books directory (and all of its contents) to the
/home/thor/china/india/spain directory.

By default, the mv command overwrites any existing files if the fi le you are moving to
exists. However, many Linux systems alias the mv command so that it uses the -i option
(which causes mv to prompt you before overwriting existing fi les). Here’s how to check if
that is true on your system:
$ alias mv
alias mv='mv -i'       # i-interactive#

┌──(thor㉿thor)-[~/china/india/spain]
└─$ mv books pens                                          
mv: overwrite 'pens'? 

    # cp COMMAND #

┌──(thor㉿thor)-[~/china/india/spain]
└─$ ls
books
observe we have only one file books 

$ cp books thor   # now thor is a copy of books file and its contents and thor will create a newfile and it has contents of books #

$ cp pens ~   # copies pens to your home directory (~), keeping the name pens.


$ cp -r /usr/share/doc/bash-completion* /tmp/a/
$ cp -ra /usr/share/doc/bash-completion* /tmp/b/

The two recursive
(-r) copies copy the bash-completion directory, and all files it contains, first to new /tmp/a/ and /tmp/b/ directories. If you 
run ls -l on those two directories with the archive (-a) option, the date/time stamps and permissions are maintained by the copy, 
but without the a, current date/time stamps are used and permissions are determined by your umask.


┌──(thor㉿thor)-[~/china/india/spain]
└─$ ls
books  bookst  pradeep  thor
                                                                                                                                                                       
┌──(thor㉿thor)-[~/china/india/spain]
└─$ cp books thor     #  in this exaple thor file is alredy exist so it will be overwritten if you give any not existing name like pradeep
cp: overwrite 'thor'?                                        you don't get any errors.
                                                                                                                                                                       
┌──(thor㉿thor)-[~/china/india/spain]
└─$ alias cp
cp='cp -i'


    # REMOVING FILES AND DIRECTORIES #

$ rm *   # the second removes all the fi les in the current directory (except that it doesn’t remove directories and or any 
files that start with a dot). If you want to remove a directory, you need to use the recursive (-r) option
to rm or, for an empty directory, you can use the rmdir command.

$ rmdir /home/joe/nothing/
$ rm -r /home/joe/bigdir/
$ rm -rf /home/joe/hugedir/

The rmdir command in the preceding code only removes the directory (nothing) if it is empty. The rm -r example removes the directory 
bigdir and all its contents (fi les and multiple levels of subdirectories), but will prompt you before each is removed. By
adding the force option (-f), the hugedir directory and all its contents are immediately removed, without prompting.

└─$ rm b*    # you can use also wildcard such as * #
rm: remove regular file 'books'? y
rm: remove regular file 'bookst'? y


$ ls
books  bootles
                                                                                                                                                                       
┌──(thor㉿thor)-[~/china/india/spain]
└─$ \rm b*
                                                                                                                                                                       
┌──(thor㉿thor)-[~/china/india/spain]
└─$ ls
 
 An alternative is to run rm, cp,
or mv with a backslash in front of it (\rm bigdir). The backslash causes any command to run unaliased.

■ Another alternative with mv is to use the -b option. With -b, if a file of the same name exists at the des-
tination, a backup copy of the old file is made before the new file is moved there.
    



















      
