# Requires admin rights!

#
# Method 1:
# 
# Create a task in task scheduler to run this file
#
# Run a program, mshta as the program, second line as the parameters
#
# mshta
# vbscript:Execute("CreateObject(""WScript.Shell"").Run ""powershell -ExecutionPolicy Bypass & 'D:\......\set-audiodg-affinity.ps1'"", 0:close")
#
# Edit the task to run with the highest elevation
#

#
# Method 2:
#
# Similar to above, but just use exe file instead
# Use PS2EXE, using both -noOutput and -noConsole, compile to EXE
#

do {
    $Process = Get-Process audiodg -ErrorAction SilentlyContinue;
    if (!$Process) {
        Start-Sleep -Seconds 10;
    }
} while (!$Process)
$Process.ProcessorAffinity=1; 
$Process.PriorityClass="High";

# Affinity table
# Core # = Value = BitMask
# Core 1 = 1 = 00000001
# Core 2 = 2 = 00000010
# Core 3 = 4 = 00000100
# Core 4 = 8 = 00001000
# Core 5 = 16 = 00010000
# Core 6 = 32 = 00100000
# Core 7 = 64 = 01000000
# Core 8 = 128 = 10000000
# ...