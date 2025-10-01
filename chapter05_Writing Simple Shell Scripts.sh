nano hello.sh
At the very top, add this line:
#!/bin/bash
echo "Hello from Bash!"
chmod +x hello.sh
./hello.sh


✅ 1. Use Comments for Clarity
Start any comment line with #.

echo "Starting backup..."  # This starts the backup process

Use set -x for Debugging
Insert set -x at the top of your script to print each command as it's executed:

#!/bin/bash
set -x

echo "Starting script..."
date

        OR
bash -x myscript.sh

─$ for file in file*; do 
  echo "mv \"$file\" \"$file.bak\""
done

mv "file1" "file1.bak"
mv "file2" "file2.bak"

This is globbing: file* matches all files starting with file.
; – This semicolon tells the shell that the loop header is finished and the body starts next. In Bash, you can use a semicolon or a 
newline to separate commands. Since this is on one line, we use ;.

AFTER SEMICOLON THEN BODY WILL START BETWEEN DO AND DONE THAT IS BODY

# UNDERSTANDING SHELL VARIABLES
shell variable are  case-sensitive, meaning VAR and var are different.

NAME=value
❗ No spaces before or after the = sign.

CITY="Springfield"     # CITY stores a string value
PI=3.14159265          # PI stores a number


YOU CAN STORE THE OUTPUT OF A COMMAND USING:
VAR=$(command)
VAR=`command`

NUM_FILES=$(/bin/ls | wc -l)

 $()
This is called command substitution.

It runs a command inside and stores the output as the value.

So NUM_FILES=$(...) means: Run what’s inside the $(...), and save the result in NUM_FILES.

# BALANCE="$CurBalance"     #👉 This line copies the value of CurBalance into a new variable called BALANCE.
CurBalance
This is already a variable defined somewhere earlier in the script.
CurBalance=1000

✅ How to Escape:

Use backslash (\) before the special character
echo \$HOME

Use single quotes (') to escape a whole string
echo '$HOME * `date`'
echo "$HOME * `date`"

$ echo $HOME * `date`

✅ It does not need a hint
You don’t need to give a pattern like fi* or *.txt.
Just using * alone means:
List all files and folders in this folder (current directory)."

✅ Concept: Assigning and Referencing Variables in Bash
BALANCE=1000        # Assigning the number 1000 to the variable BALANCE (no $ used)
echo $BALANCE       # Referencing BALANCE using $ to print its stored value (1000)

🔹 Bash Script Example:

#!/bin/bash                      # This tells the system to use Bash to run the script

# Script to echo out command-line arguments
echo "The first argument is $1, the second is $2."       # $1 and $2 are the first and second command-line arguments
echo "The command itself is called $0."                  # $0 is the name or path of the script
echo "There are $# parameters on your command line"      # $# shows how many arguments were passed
echo "Here are all the arguments: $@"                    # $@ prints all the arguments as a list

$1, $2, ... $n → These are positional parameters. They hold values passed to the script in the order they were typed.

$? → Holds the exit status of the last command
0 = Success
Non-zero = Error

🔹 Script Example Using read Command:

#!/bin/bash

read -p "Type in an adjective, noun and verb (past tense): " adj1 noun1 verb1  
# -p shows the message to the user and waits for input
# The user's input is stored in variables: adj1, noun1, and verb1

echo "He sighed and $verb1 to the elixir. Then he ate the $adj1 $noun1."  
# Prints a sentence using the words entered by the user

     REMEBER IT'S WORKS ONLY IN BASH NOT ZSH IF YOU WANT TO RUN THIS SWITCH SHELL TO bash  and echo $0  CONFIRM PRESENT SHELL.

✅ How to run the same read command in Zsh
Zsh does not support read -p, so instead, use this format:

echo "Type in an adjective, noun and verb (past tense):"   # Show the prompt manually
read adj1 noun1 verb1                                       # Read user input into 3 variables
echo "He sighed and $verb1 to the elixir. Then he ate the $adj1 $noun1."  # Use the input


PARAMETER EXPANSION IN BASH

CITY="Delhi"         # Assign the value "Delhi" to CITY
echo $CITY           # Prints: Delhi (shortcut for ${CITY})
echo ${CITY}Metro    # Prints: DelhiMetro (braces help avoid confusion)


🔹 SECTION 2: Default Value If Variable Is Unset or Empty

CUP="Tea"                        # I already have a cup of Tea

CUP=${CUP:-"Water"}             # If I don't have Tea, give me Water. But I already have Tea.
BACKUP_CUP=${BACKUP_CUP:-"Water"}  # I don't have a backup cup, so I get Water in it.

echo $CUP                       # Output: Tea
echo $BACKUP_CUP                # Output: Water


Remove File Path — Keep Only Filename

💬 ${var##*/} → Removes the longest match from the start (path), leaves just the file name.

MYFILENAME=/home/digby/myfile.txt     # Full path of the file including name and extension

FILE=${MYFILENAME##*/}                # Remove everything up to the last '/', keep: "myfile.txt"


 SECTION 4: Extract Only Directory from File Path

 DIR=${MYFILENAME%/*}                  # Remove shortest match from the end starting at '/', keep: "/home/digby"


🔹 SECTION 5: Remove File Extension from Filename

NAME=${FILE%.*}                       # Removes the dot and extension, keeps: "myfile"

🔹 SECTION 6: Extract Only the File Extension
EXTENSION=${FILE##*.}                # Removes everything up to the last dot, keeps: "txt"



# Performing arithmetic in shell scripts


#!/bin/bash                                      # Shebang line tells system to run script with Bash shell

BIGNUM=1024                                      # Set variable BIGNUM to 1024 (no data type needed in Bash)

let RESULT=$BIGNUM/16                            # 'let' is a built-in Bash command to do integer arithmetic
                                                 # RESULT = 1024 / 16 = 64 (stored as integer)

RESULT=`expr $BIGNUM / 16`                       # 'expr' is an external command used for integer math
                                                 # Backticks ` ` capture the output and assign it to RESULT
                                                 # RESULT = 1024 / 16 = 64

RESULT=`echo "$BIGNUM / 16" | bc`                # 'echo' sends the expression as a string
                                                 # '|' (pipe) sends it to 'bc', a calculator tool that supports decimals
                                                 # RESULT = 64

let foo=$RANDOM                                  # 'RANDOM' is a built-in Bash variable that gives a random number (0–32767)
echo $foo                                        # Prints the random number stored in 'foo'

I=0                                              # Initialize variable I with 0

echo




# 📘 Heading: Note — Spacing Rules in let, expr, and bc (No commands on this page)

# ✅ Most shell script parts don’t care about spaces or tabs (called *freeform* syntax).
#    Example: You can write `echo Hello` or `    echo     Hello` — both work fine.

# ❗ But some arithmetic tools in shell scripting are strict about spacing:

# 1️⃣ let (Built-in for integer math)
# - ❌ Don't use spaces between numbers and operators (e.g., 5+5)
# - Example: `let RESULT=5+5` is correct, not `let RESULT = 5 + 5`

# 2️⃣ expr (External tool for integer math)
# - ✅ Requires spaces between numbers and operators
# - Example: `expr 5 + 5` is correct, not `expr 5+5`

# 3️⃣ bc (Calculator for floating-point math)
# - ✅ Accepts both with and without spaces
# - But 👉 it's a bit tricky since it handles decimals too (e.g., 5.5 / 2)

# 🧠 In short:
# - let → No spaces
# - expr → Needs spaces
# - bc → Doesn’t care about spaces but supports decimals (floating-point)



# 📘 Heading: Using programming constructs in shell scripts

# Shell scripts support programming logic just like other languages (e.g., Python, C).
# You can use:
# - Conditional logic like if...then...else
# - Looping like for, while, etc.

# 🧠 CONDITIONAL STATEMENTS: Run code only if a condition is TRUE

# -------------------------------------------
# ▶️ Example 1: Basic if statement with number test using `-eq` (means "equal")
VARIABLE=1                           # Set VARIABLE to 1
if [ $VARIABLE -eq 1 ] ; then       # Check if VARIABLE equals 1 (number comparison)
  echo "The variable is 1"          # If true, print this
fi                                  # 'fi' ends the if block

# -------------------------------------------
# ▶️ Example 2: if...else with string comparison using `=`
STRING="Friday"                     # Set STRING to "Friday"
if [ "$STRING" = "Friday" ] ; then # Check if STRING is exactly "Friday" (string comparison)
  echo "WhooHoo. Friday."          # If true, print this
else
  echo "Will Friday ever get here?"# If false, print this
fi

# -------------------------------------------
# ▶️ Example 3: Reverse test with `!=` (means "not equal")
STRING="FRIDAY"                     # Set STRING to "FRIDAY"
if [ "$STRING" != "Monday" ] ; then# If STRING is NOT "Monday"
  echo "At least it's not Monday"  # Print this
fi

# -------------------------------------------
# ▶️ Example 4: Using elif (means "else if") to test multiple conditions
filename="$HOME"                    # Set filename to home directory path
if [ -f "$filename" ] ; then       # Check if it's a regular file (-f means "is file")
  echo "$filename is a regular file"
elif [ -d "$filename" ] ; then     # Else if it's a directory (-d means "is directory")
  echo "$filename is a directory"
else                               # If neither file nor directory
  echo "I have no idea what $filename is"
fi

# -------------------------------------------
# 🧠 Notes:
# - Conditions are always placed inside square brackets: [ ]
# - Tests return:
#     0 → TRUE
#     1 → FALSE
# - Use double quotes around variables to avoid errors with spaces or empty values
# - Indentation (tabs or spaces) is just for readability (not required)

# 📌 Tip: To quickly see all test options, run:
# help test                          # Shows all available condition flags (like -f, -d, -eq, etc.)



| Operator    | Meaning                                         |
| ----------- | ----------------------------------------------- |
| `-a file`   | File exists (same as `-e`)                      |
| `-b file`   | Is a block special device (like hard disk)      |
| `-c file`   | Is a character device (like terminal)           |
| `-d file`   | Is a directory                                  |
| `-e file`   | File exists                                     |
| `-f file`   | Is a regular file (not directory, link, etc.)   |
| `-g file`   | SGID bit is set                                 |
| `-h file`   | Is a symbolic link (same as `-L`)               |
| `-k file`   | Sticky bit is set                               |
| `-L file`   | Is a symbolic link                              |
| `-n string` | String length is **greater than 0**             |
| `-O file`   | You own the file                                |
| `-p file`   | Is a named pipe                                 |
| `-r file`   | You can read the file                           |
| `-s file`   | File exists and is **not empty**                |
| `-S file`   | File is a **socket**                            |
| `-t fd`     | File descriptor `fd` is connected to a terminal |
| `-u file`   | SUID bit is set                                 |
| `-w file`   | File is writable by you                         |
| `-x file`   | File is executable by you                       |
| `-z string` | String length is **0**                          |



| Operator          | Meaning                                                |
| ----------------- | ------------------------------------------------------ |
| `expr1 -a expr2`  | Both expressions are **true** (AND)                    |
| `expr1 -o expr2`  | Either expression is **true** (OR)                     |
| `file1 -nt file2` | File1 is **newer** than file2                          |
| `file1 -ot file2` | File1 is **older** than file2                          |
| `file1 -ef file2` | File1 and file2 are **linked** (hard or symbolic link) |



# ────────────────────────────────────────────────────────────────
# Shorthand Test Syntax in Shell Scripts using [ test ], ||, &&, and One-liner if-else
# ────────────────────────────────────────────────────────────────

dirname="/tmp/testdir"                 # Set a variable named 'dirname' to the path "/tmp/testdir"

[ -d "$dirname" ] || mkdir "$dirname"  # [ -d "$dirname" ] → checks if directory exists
                                       # || (OR operator) → if the previous command fails (directory doesn't exist)
                                       # mkdir "$dirname" → then create the directory
                                       # This line is like saying: if directory doesn't exist, then create it

# ────────────────────────────────────────────────────────────────
# Using && (AND operator) for TRUE condition single-action execution
# ────────────────────────────────────────────────────────────────

[ $# -ge 3 ] && echo "There are at least 3 command line arguments."
                                       # [ $# -ge 3 ] → checks if number of command-line arguments is ≥ 3
                                       # && (AND operator) → if test is true
                                       # echo → display message that at least 3 arguments were passed
                                       # This is useful for quick checks in scripts that need arguments

# ────────────────────────────────────────────────────────────────
# Combining && and || in a single line to act like if...then...else
# ────────────────────────────────────────────────────────────────

dirname="mydirectory"                  # Set 'dirname' variable to "mydirectory"

[ -e "$dirname" ] && echo "$dirname already exists" || mkdir "$dirname"
                                       # [ -e "$dirname" ] → checks if file or directory exists
                                       # && → if it exists, echo that it already exists
                                       # || → else (if test failed), create the directory using mkdir
                                       # This is a compact way of doing:
                                       # if [ -e "$dirname" ]; then
                                       #   echo "$dirname already exists"
                                       # else
                                       #   mkdir "$dirname"
                                       # fi





# ────────────────────────────────────────────────────────────────
# The 'case' Command — Used Like switch-case in Programming
# ────────────────────────────────────────────────────────────────

# case is useful when you want to compare one value with multiple patterns.
# It replaces multiple nested if-elif-else blocks with cleaner syntax.

# Syntax structure of 'case':
# case "VARIABLE" in
#   pattern1)
#     commands
#     ;;
#   pattern2)
#     commands
#     ;;
#   *)
#     default commands
#     ;;
# esac

# ────────────────────────────────────────────────────────────────
# Real Example: Perform Backup Based on Day of the Week
# ────────────────────────────────────────────────────────────────

case `date +%a` in                     # `date +%a` prints current day as Mon, Tue, etc.
                                      # case takes that output and checks it against the below patterns

"Mon")                                 # If today is Monday
  BACKUP=/home/myproject/data0        # Set BACKUP path for Monday
  TAPE=/dev/rft0                      # Set TAPE device for Monday
  ;;                                  # End of this case block

"Tue" | "Thu")                         # If today is Tuesday OR Thursday
  BACKUP=/home/myproject/data1        # Set BACKUP path for Tue/Thu
  TAPE=/dev/rft1                      # Set TAPE device for Tue/Thu
  ;;                                  # End of this case block

"Wed" | "Fri")                         # If today is Wednesday OR Friday
  BACKUP=/home/myproject/data2        # Set BACKUP path for Wed/Fri
  TAPE=/dev/rft2                      # Set TAPE device for Wed/Fri
  ;;                                  # End of this case block

*)                                     # * is the default (like else) → used for all other days (Sat, Sun)
  BACKUP="none"                        # No backup done on weekend
  TAPE=/dev/null                       # Null device → discards data
  ;;                                  # End of default case

esac                                   # 'esac' ends the case block (case spelled backwards)




# ─────────────────────────────────────────────────────────────────────────────
# 'for', 'while', and 'until' Loops in Shell Scripting — With Full Explanations
# ─────────────────────────────────────────────────────────────────────────────

# ──────────────────────
# 1. 'for...do' Loop
# ──────────────────────

# This loop runs once for each item in a list (space-separated).
# Syntax: for VARIABLE in LIST; do ...; done

for NUMBER in 0 1 2 3 4 5 6 7 8 9    # Loop through each number
do
  echo "The number is $NUMBER"      # Print the current number
done                                # End of the loop

# ─────────────────────────────────────────────────────────────────

for FILE in `/bin/ls`               # Command substitution → runs `ls` inside /bin and loops through each filename
do
  echo $FILE                        # Print each file found in /bin
done

# NOTE: `ls -l` or other multi-word output would split fields incorrectly due to whitespace

# ─────────────────────────────────────────────────────────────────

for NAME in John Paul Ringo George  # Loop through names manually given
do
  echo "$NAME is my favorite Beatle"  # Output sentence with current name
done

# ─────────────────────────────────────────────────────────────────

# C-style for loop in shell
LIMIT=10                            # Set loop upper limit

for ((a=1; a<=LIMIT; a++))          # C-style loop (a=1; loop until a<=LIMIT; increment a by 1)
do
  echo "$a"                         # Print the current value of 'a'
done

# NOTE:
# - Use double parentheses ((...)) for arithmetic in C-style
# - Don't use $ before variable name inside ((...)) block


# ──────────────────────
# 2. 'while...do' Loop
# ──────────────────────

# Loop executes *as long as the condition is true*
N=0                                 # Start with N = 0

while [ $N -lt 10 ]                 # Run while N is less than 10
do
  echo -n $N                        # Print N without newline (-n)
  let N=$N+1                        # Increment N by 1 using 'let'
done                                # End of the loop

# ──────────────────────
# 3. 'until...do' Loop
# ──────────────────────

# Loop executes *until the condition becomes true* (i.e., while it is false)
N=0                                 # Reset N to 0

until [ $N -eq 10 ]                 # Run until N is equal to 10
do
  echo -n $N                        # Print N without newline (-n)
  let N=$N+1                        # Increment N
done                                # End of the loop

# ──────────────────────
# Summary:
# ──────────────────────
# - 'for': Loop through a known list of values.
# - 'while': Loop as long as a condition is true.
# - 'until': Loop as long as a condition is false (stop when true).
# - Use 'let' or (( )) for arithmetic.
# - Use 'echo -n' to avoid newlines.



# ────────────────────────────────────────────────────────────────
# Useful Text Manipulation in Linux — Using grep, cut, tr, awk, sed
# ────────────────────────────────────────────────────────────────

# These are external programs commonly used with Bash for processing text.
# Most of them work well with pipes and scripts using stdin → stdout.

# ───────────────
# 1. grep → (g)lobal (r)egular (e)xpression (p)rint
#    Used to search for specific patterns (text/regex) in a file or input.
# ───────────────

# EXAMPLE 1:
grep /home /etc/passwd
# This command searches for the string "/home" in the file /etc/passwd
# It returns all lines containing "/home", which usually represent user accounts
# because normal users' home directories are in /home/username

# EXAMPLE 2:
env | grep ^HO
# 'env' lists all environment variables
# The pipe '|' sends the output of env to grep
# '^HO' means: lines that start with "HO"
# The caret symbol (^) anchors the search at the start of the line
# This will match variables like HOME, HOSTNAME, HOSTTYPE etc.

# ───────────────
# TIPS:
# - grep is case-sensitive by default (use `-i` to ignore case)
# - Use `man grep` to see all options and examples
# - Common grep options:
#     -i : ignore case
#     -v : invert match (show lines that don't match)
#     -r : recursive search through directories
#     -n : show line numbers
#     -E : enable extended regular expressions (like egrep)

# ───────────────
# Coming Next:
# - 'cut' to extract columns
# - 'tr' to translate/delete characters
# - 'awk' to process text field-by-field
# - 'sed' to find/replace/edit text streams



# ──────────────────────────────────────────────────────────────────────────────
# Note: Understanding the Caret ( ^ ) in grep Patterns
# ──────────────────────────────────────────────────────────────────────────────

# When using grep, the caret symbol `^` has a special meaning in regular expressions.

# It represents:
#   ^ → the beginning of a line (anchor)

# So, in the command:
env | grep ^HO
# This is interpreted as:
# - Search for lines that START WITH the uppercase letters "HO"
# - Not the letters anywhere, only at the beginning
# - It will match things like:
#     HOME=/home/username
#     HOSTNAME=myhost
#     HOSTTYPE=x86_64

# 🧠 NOTE:
# The caret `^` is **not** the same as `^H` (which you might see as a backspace character)
# To use this command correctly, type these **individual characters**:
#   1. ^ → The caret character (Shift + 6)
#   2. H → Uppercase H
#   3. O → Uppercase O
# Do **not** press Ctrl + H (which creates `^H`, a backspace)

# ✔️ Correct keystrokes:   Shift+6  H  O
# ❌ Do NOT press Ctrl+H   (produces invisible ^H character)

# This ensures grep matches environment variables or lines
# that truly begin with "HO", as intended.




# ────────────────────────────────────────────────────────────────
# Character Translation with `tr` Command in Shell Scripting
# ────────────────────────────────────────────────────────────────

# tr → translate or delete characters
# Full form: `tr` = translate
# It reads input from stdin (standard input) and replaces/removes characters

# ─────────────────────────────────────────────────────
# EXAMPLE 1: Convert all UPPERCASE to lowercase letters
# ─────────────────────────────────────────────────────

FOO="Mixed UPpEr aNd LoWeR cAsE"                     # Define a variable with mixed case
echo $FOO | tr [A-Z] [a-z]                           # Use `tr` to convert A–Z to a–z
# [A-Z] → match uppercase A to Z
# [a-z] → replace with corresponding lowercase
# Output: mixed upper and lower case

# ─────────────────────────────────────────────────────
# EXAMPLE 2: Rename files by replacing spaces/tabs with _
# ─────────────────────────────────────────────────────

for file in * ; do                                   # Loop through all files in current dir
    f=`echo $file | tr [:blank:] [_]`                # Replace space/tab characters with underscore (_)
    # [:blank:] → POSIX character class for space or tab
    # tr [:blank:] [_] → convert each blank (space or tab) to underscore
    # `echo $file` outputs the filename; `tr` modifies it

    [ "$file" = "$f" ] || mv -i -- "$file" "$f"      # Rename the file only if changed
    # [ "$file" = "$f" ] → check if original and new name are same
    # If NOT same, then run mv to rename
    # -i → interactive; prompts before overwrite
    # -- → stops option parsing in case filename starts with -
done

# This script is useful when cleaning filenames that contain spaces or tabs,
# which can cause issues in shell scripting or automation tools.




# ────────────────────────────────────────────────────────────────
# Using `sed` - Stream Editor for Text Manipulation in Shell
# ────────────────────────────────────────────────────────────────

# sed → stream editor
# Full form: `sed` = stream editor
# It reads input line-by-line and performs text transformations based on given instructions

# ─────────────────────────────────────────────────────
# EXAMPLE 1: Print only lines matching a pattern
# ─────────────────────────────────────────────────────

sed -n '/home/p' /etc/passwd
# -n       → suppress automatic printing of each line
# '/home/p' → for lines matching 'home', print them
# Searches /etc/passwd for lines containing the word "home"
# Output:
# chris:x:1000:1000:Chris Negus:/home/chris:/bin/bash
# joe:x:1001:1001:Joe Smith:/home/joe:/bin/bash

# ─────────────────────────────────────────────────────
# EXAMPLE 2: Replace 'Mac' with 'Linux' in a file
# ─────────────────────────────────────────────────────

sed 's/Mac/Linux/g' somefile.txt > fixed_file.txt
# 's/Mac/Linux/g' → substitute all occurrences of 'Mac' with 'Linux' globally (g)
# Output is redirected to fixed_file.txt using `>`

# Same example using pipe:
cat somefile.txt | sed 's/Mac/Linux/g' > fixed_file.txt
# Reads file using `cat`, then pipes it to `sed` for processing
# Functionally the same as above, but less efficient

# ─────────────────────────────────────────────────────
# EXAMPLE 3: Delete extra spaces at the end of each line
# ─────────────────────────────────────────────────────

cat somefile.txt | sed 's/ *$//' > fixed_file.txt
# 's/ *$//' → matches zero or more spaces (*) at end of line ($), replaces with nothing
# Removes trailing spaces on each line in the file
# Output saved to fixed_file.txt

# `sed` is ideal for automated, scriptable text editing
# Useful in data cleaning, log processing, and search-replace tasks




# ────────────────────────────────────────────────────────────────
# Simple Shell Script: Telephone List (ph)
# ────────────────────────────────────────────────────────────────

#!/bin/bash                           # Interpreter to use: Bash shell
# (@)/ph                              # Script name or path hint
# A very simple telephone list script
# Usage:
#   ./ph new name number       → to add a new entry
#   ./ph name                  → to search for a name

PHONELIST=~/.phonelist.txt           # File where phone records are saved

# ────────────────────────────────────────────────────────────────
# CASE 1: No arguments provided
# ────────────────────────────────────────────────────────────────
if [ $# -lt 1 ] ; then               # $# → number of arguments
    echo "Whose phone number did you want? "
    exit 1                           # Exit with error
fi

# ────────────────────────────────────────────────────────────────
# CASE 2: Add new phone number
# ────────────────────────────────────────────────────────────────
if [ $1 = "new" ] ; then             # If first argument is 'new'
    shift                            # Shift positional parameters (remove 'new')
    echo $* >> $PHONELIST            # Append all remaining arguments to PHONELIST
    echo $* added to database        # Confirm addition
    exit 0                           # Exit successfully
fi

# ────────────────────────────────────────────────────────────────
# CASE 3: Search for a name in the phone list
# ────────────────────────────────────────────────────────────────
if [ ! -s $PHONELIST ] ; then        # Check if file exists and is not empty
    echo "No names in the phone list yet! "
    exit 1
else
    grep -i -q "$*" $PHONELIST      # Quietly search (case-insensitive) for input
    if [ $? -ne 0 ] ; then           # $? → exit code of last command (non-zero = not found)
        echo "Sorry, that name was not found in the phone list"
        exit 1
    else
        grep -i "$*" $PHONELIST     # Show matching line(s) if found
    fi
fi

exit 0                               # Normal script exit





# ────────────────────────────────────────────────────────────────
# HOW TO RUN THIS SCRIPT:
# ────────────────────────────────────────────────────────────────

chmod 755 ph
# Makes 'ph' script executable (rwxr-xr-x)

./ph new "Mary Jones" 608-555-1212
# Adds "Mary Jones 608-555-1212" to ~/.phonelist.txt

./ph Mary
# Searches and displays phone number(s) for "Mary"





# ──────────────────────────────────────────────────────────────────────────────
# Simple Shell Script: Backup Script (my_backup)
# ──────────────────────────────────────────────────────────────────────────────

#!/bin/bash                              # Use Bash shell for this script
# (@)/my_backup                          # Optional path/identifier comment
# A very simple backup script that copies all user home directories to tape

TAPE=/dev/rft0                           # Set the TAPE variable to the tape device path
                                        # NOTE: This device may differ. Check /var/log/messages or use `dmesg | grep -i tape`

# ──────────────────────────────────────────────────────────────────────────────
# STEP 1: Rewind the tape device to the beginning
# ──────────────────────────────────────────────────────────────────────────────
mt $TAPE rew                             # 'mt' (magnetic tape) rewinds the device specified by $TAPE

# ──────────────────────────────────────────────────────────────────────────────
# STEP 2: Get list of all home directories from /etc/passwd
# ──────────────────────────────────────────────────────────────────────────────
HOMES=`grep /home /etc/passwd | cut -f6 -d':'`
# Explanation:
#   grep /home /etc/passwd       → find lines with "/home" (typical for user home dirs)
#   cut -f6 -d':'                 → extract the 6th field (home directory path), using ':' as the delimiter
#   The result: list of paths like /home/user1 /home/user2 etc.

# ──────────────────────────────────────────────────────────────────────────────
# STEP 3: Back up the directories using tar
# ──────────────────────────────────────────────────────────────────────────────
tar cvf $TAPE $HOMES                    # tar (tape archive):
#   c → create new archive
#   v → verbose (show progress)
#   f → use the given file (in this case, tape device $TAPE)
#   $HOMES → list of home directories to include in the backup

# ──────────────────────────────────────────────────────────────────────────────
# STEP 4: Rewind and eject the tape after backup
# ──────────────────────────────────────────────────────────────────────────────
mt $TAPE rewoffl                        # mt rewoffl:
#   rew → rewind
#   offl → offline (eject the tape)

# This script creates a full backup of all user home directories to the specified tape device.
# Make sure you have permission to use the tape device and `tar`/`mt` commands.



# ──────────────────────────────────────────────────────────────────────────────
# Exercise Script: myavengersscript - A Fun Script Based on the Avengers
# ──────────────────────────────────────────────────────────────────────────────

#!/bin/bash                                     # Use Bash shell interpreter

# This script is for fun and practice. It prints Avengers-themed messages
# using basic shell scripting features like date, variables, positional parameters, 
# user input, and loops — just like exercises from the book.

# ───── Task 1: Print system info ─────
echo "Today is $(date)."                        # Show current date and time
echo "You are in $(pwd) and your host is $(hostname)."  # Show current directory and hostname

# ───── Task 2: Accept 3 positional parameters ─────
ONE=$1                                          # Assign 1st parameter to variable ONE
TWO=$2                                          # Assign 2nd parameter to variable TWO
THREE=$3                                        # Assign 3rd parameter to variable THREE
echo "There are $# parameters that include $*." # Show number and all passed parameters
echo "The first is $ONE, the second is $TWO, the third is $THREE."

# ───── Task 3: Ask user for street and town ─────
read -p "What street did you grow up on? " mystreet
read -p "What town did you grow up in? " mytown
echo "The street I grew up on was $mystreet and the town was $mytown."

# ───── Task 4: Ask about favorite OS ─────
read -p "What is your favorite operating system? " os
case "$os" in
  [Ww]indows) echo "Eww... really? You like pain, huh? 😆";;
  [Mm]ac)     echo "Overpriced and overrated, huh? 😏";;
  [Ll]inux)   echo "Great choice! Welcome to the Avengers team! 🛡️";;
  *)          echo "Is '$os' an operating system? 🤨";;
esac

# ───── Task 5: Avengers loop ─────
for avenger in IronMan CaptainAmerica Thor Hulk BlackWidow Hawkeye; do
  echo "I have an Avenger... $avenger!"
done
