# LinuxMonitoring v2.0

Real-time monitoring and research of the system status.

## Chapter III

- The written bash scripts must be in the src folder;
- For each task you must create a folder with the following name: **0x**, where x is the task number;
- All scripts must be decomposed and split into several files;
- The main script file for each task must be named **main.sh**;
- All scripts should have checks for incorrect input (not all parameters specified, wrong format parameters, etc.);
- All scripts must be run on a virtual machine *Ubuntu Server 20.04 LTS*.

## File generator

**== Task ==**

Write a bash script. The script is run with 6 parameters. An example of running a script: 
`main.sh /opt/test 4 az 5 az.az 3kb`

**Parameter 1** is the absolute path. 
**Parameter 2** is the number of subfolders. 
**Parameter 3** is a list of English alphabet letters used in folder names (no more than 7 characters). 
**Parameter 4** is the number of files in each created folder. 
**Parameter 5** — the list of English alphabet letters used in the file name and extension (no more than 7 characters for the name, no more than 3 characters for the extension). 
**Parameter 6** — file size (in kilobytes, but not more than 100).

Folder and file names must only consist of the letters specified in the parameters and use each of them at least 1 time.
The length of this part of the name should be at least 4 characters, plus the script run date in DDMMYY format, separated by underscores, for example: 
**./aaaz_021121/**, **./aaazzzz_021121**

If `az` has been specified for a folder or a file name, there can be no inverse entry: 
**./zaaa_021121/** i.e. the order of the characters specified in the parameter must be maintained.

When the script runs in the location specified in parameter 1, the folders and files should be created in them with the appropriate names and sizes. The script should stop running if there is 1GB of free space left on the file system (in the / partition).

Make a log file with data on all created folders and files (full path, creation date, file size).
