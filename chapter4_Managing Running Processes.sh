# Understanding Processes
: 'A process is a running instance of a command. For example, there may be one vi command on the
system. But if vi is currently being run by 15 different users, that command is represented by 15
different running processes. 
'
/proc is a virtual filesystem. ✅   #  in this directory you will see many numbers those are
When a process starts, the Linux kernel creates a new directory in /proc named after its PID.
When the process ends, that folder disappears immediately.  # those numbered folder dissappeard.
It shows live system and process info directly from the kernel.

# Listing processes with ps

$ find /proc -maxdepth 1 -type d -name 146451
-maxdepth 1 → only look directly in /proc (not deep inside)

─$ ps u
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
thor      146451  1.5  0.0  10892  6900 pts/0    Ss   04:24   0:21 /usr/bin/zsh
thor      161089  400  0.0   9532  4380 pts/0    R+   04:46   0:00 ps u


S: Sleeping — the process is idle, waiting for an event (like input or a timer).
s: Session leader — this process is the leader of a session (group of related processes).
So, Ss means a sleeping process that is a session leader (like your main shell).
R: Running — the process is currently executing or runnable (ready to run).
+: Foreground process group — this process is in the foreground, meaning it has control of the terminal

%MEM (RANDOM ACCESS MEMORY CONSUMING)
%CPU(FOR PROCESSOR)
 VSZ is the amount of memory allocated for the process, whereas RSS is the
amount that is actually being used

Many processes running on a computer are not associated with a terminal. A normal Linux
system has many processes running in the background. 

$ ps aux | less
$ ps ux | less

Options breakdown
a = Show processes for all users, not just yours.
u = Display the processes in user-oriented format (more columns like CPU, MEM usage, user, etc.).
x = Also show processes not attached to a terminal (like daemons).

─$ ps -eo 'pid,user,uid,group,gid,vsz,rss,comm' | less
ps = process status
-e = show all processes (same as -A)
-o = output format — lets you specify which columns you want to see( like pid and gid and rss like that)

$ ps -u thor
( if you use dash like -u that means is a option to filter a specific user. without u user oriented format)

$ ps -u thor -o 'pid,user,group,gid'

─$ ps -eo 'pid,user,uid,group,gid,vsz,rss,comm' --sort=-rss | less
--sort=-rss = sort by RSS descending (largest memory first)
--sort=rss	Ascending (smallest to largest RSS)

# Listing and changing processes with top
$top
PID  USER   PR  NI  VIRT   RES   SHR S  %CPU %MEM  TIME+   COMMAND
2321 thor   20   0 589524 73436 53476 S  14.9  0.9  0:05.63 qterminal

Column	Name	Meaning / Description
PR	Priority	The process priority used by the kernel scheduler. Lower value = higher priority.
NI	Nice Value	"Niceness" — affects priority. Range: -20 (high priority) to +19 (low priority).
SHR	Shared Memory	Amount of memory shared with other processes (in KB).
S	State	Current process state (e.g., S = sleeping, R = running, etc. — as explained earlier).

# ALL THE INFORMATION RE-DISPLAYED EVERY 5 SECONDS.

■■ Press h to see help options, and then press any key to return to the top display.
■■ Press M to sort by memory usage instead of CPU, and then press P to return to sort-
ing by CPU.
■■ Press the number 1 to toggle showing CPU usage of all your CPUs if you have more
than one CPU on your system.
■■ Press R to reverse sort your output.
■■ Press u and enter a username to display processes only for a particular user.

RENICE IS A COMMAND USED TO CHANGE THE PRIORITY (NICENESS) OF A RUNNING PROCESS.

-20 (highest priority)
0 (default priority)
19 (lowest priority)
type the process ID of the process you
want to renice. When prompted to Renice PID to value, type in a number from
–20 to 19.


KILLING A PROCESS

run top press k then enter process id and then 
15` (SIGTERM): politely ask the process to terminate (clean shutdown)
`9`  (SIGKILL): force kill the process immediately (no cleanup)

$ sudo htop  # for gui#

# Managing Background and Foreground Processes


sleep 30 &	Run command in background   # if you use (&) It is NOT paused, NOT halted — it's actively running.
jobs	Show list of jobs
bg	Resume a paused job in background
fg	Resume a job in foreground
Ctrl + L	Redraw terminal screen
jobs -l    #    to know process id very important command

T ip
To avoid having the output appear, you should have any process running in the background send its output to a file or
to null (add 2> /dev/null to the end of the command line).

# Starting background processes

[1]  - running    sleep 45
[2]  + running    sleep 50
+ means this is the default job for commands like fg (the most recent background job).
- means this is the next most recent job.

sleep 100 &        # Job 1
sleep 200 &        # Job 2
sleep 300 &        # Job 3


fg %  most recent background
fg %sleep
fg %?300
fg %?ep
%- = Refers to the job that was paused or backgrounded just before the most recent one

Stopped job example:
[5]+  Stopped    sleep 100

To resume in background:
bg %5

Job now running in background:
[5]  Running    sleep 100 &

# Killing processes with kill and killall

# sleep 1000 &   TEST PROCESS
kill -SIGHUP 12345  reload config files.
kill -SIGINT 12345   like ctrl + c in the terminal interrupt the process
Signal    Number   Description
-------   ------   ---------------------------------------------------------------
SIGHUP       1     Hang-up detected on controlling terminal or death of controlling process.
SIGINT       2     Interrupt from keyboard.
SIGQUIT      3     Quit from keyboard.
SIGABRT      6     Abort signal from abort(3).
SIGKILL      9     Kill signal (cannot be caught or ignored).
SIGTERM     15     Termination signal.
SIGCONT 19,18,25   Continue if stopped.
SIGSTOP 17,19,23   Stop process (cannot be caught or ignored).
# killall zsh   terminate bunch of processes in zsh

nice -n +5 updatedb &
sudo nice -n -20 updatedb &
sudo renice -n -5 20284    CHANGE PRIORITY
Negative (-20 to -1) → Higher priority (less nice)

0 → Default priority
Positive (1 to 19) → Lower priority (more nice)
-n = niceness value

But:
It only applies to one process (and not to the user's entire set of processes).
Child processes (spawned later) don’t inherit the niceness unless explicitly set.
It doesn’t limit total resource usage — just scheduling preference.

# LIMITING PROCESSES WITH CGROUPS

What are cgroups?
Cgroups allow you to:

Limit: Set max memory, CPU usage, etc.
Isolate: Run processes with dedicated resources.
Measure: Monitor the resource usage of processes.
Prioritize: Assign more CPU time to certain processes.

sudo mkdir /sys/fs/cgroup/mygroup
echo $((100 * 1024 * 1024)) | sudo tee memory.max
sudo tee memory.max: Runs tee as root to write input to the file memory.max
ps aux --sort=-rss | head -n 10
echo <PID> | sudo tee /sys/fs/cgroup/mygroup/cgroup.procs
Purpose: Move the process into the cgroup, enforcing resource limits on it
cat /sys/fs/cgroup/mygroup/memory.current
Purpose: Monitor how much memory processes inside the cgroup are using


# Exercises

ps -ef | less

-e or -A
Meaning: Show all processes running on the system.
Details: Without this, ps might only show processes running in the current terminal. The -e option includes system-wide processes, 
including those run by other users.
-f
Meaning: Full-format listing.
UID: root – this process is owned by the root user.
PID: 1 – process ID is 1 (this is usually the init or systemd process).
PPID: 0 – has no parent; it’s the first user-space process.
C: 0 – very low or no CPU usage.
STIME: 15:38 – it started at 3:38 PM.
TTY: ? – not attached to any terminal.
TIME: 00:00:03 – has used 3 seconds of CPU time.

$ ps -ef --sort=user | less

 