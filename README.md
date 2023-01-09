PowerShell Script to set audiodg.exe's process affinity to High, and to only use CPU 1.

This script is meant to solve VoiceMeeter microphone crackling sound issues.

## How to Use
1. Download the exe file from the [releases](https://github.com/RayWarthog/set-audiodg-affinity/releases) page. (Or compile yourself following the steps below.)
2. Create a task in Task Scheduler to run the exe on log in with admin rights (This is required to run scripts with admin privileges on startup):
    1. Open the windows start menu, search for 'Task Scheduler' and open it.
    2. Right-Click in the top middle panel, select 'Create New Task...'
        - In the General tab:
            - Give it a name under the 'Name' field (eg. SetAudiodgAffinityAtLogin)
            - Under Security Options:
                i) Choose 'Run only when user is logged on'
                ii) Check 'Run with highest privileges'.
        - In the Trigger tab:
            i) Click New...
            ii) Choose 'At log on'.
            iii) Create the trigger.
        - In the Actions tab:
            i) Click New...
            ii) Choose 'Start a program' as the action, and choose the exe script.
            iii) Create the Action.

## Compiling to exe
Running the script as exe instead of a powershell script would hide the console window.

An easy way to compile the powershell script to exe is to use [Win-PS2EXE](https://github.com/MScholtes/Win-PS2EXE):
1. Choose the set-audiodg-affinity.ps1 script as source.
2. Choose a folder as output.
3. Tick -noConsole, -noOutput and -requireAdmin options.
4. Compile.
