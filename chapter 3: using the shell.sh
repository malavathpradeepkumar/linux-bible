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

# Command Substitution Overview #

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


