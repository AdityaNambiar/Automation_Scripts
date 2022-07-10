# Automation_Scripts
This repository holds all my automation scripts in one place so that I can take quick reference for the same

## Weblogic course bootup script
**Filename**: bootup_course.bat  
**Type**: Windows Batch script  
**Motivation**: To be able to get right into the study and not repeatedly spend time opening windows and later procastinate.   
**Approach**:  
1. Open browser with course link
2. Open CLI logged into the OCI compute instance with private key given
3. Open TigerVNC with Host, port and password given


## Engineering Final year project - 'Devopschain' automation script
**Filename**: startProject.sh  
**Type**: Linux Shell script  
**Motivation**: Too many activities to repeatedly carry out. Needed a way to consolidate activities so that we are aware of startup flow of the project.  
**Approach**:  
1. Gathered what commands / environment variables we set before actually the 'start' script for node server or blockchain server
2. Decided on what sequence windows should open and how to display status of each window to the user who executes script.
3. Only after finalizing on above two, decided to work on improving the 'CLI nature' of this script
Github project link: [Devopschain](https://github.com/AdityaNambiar/MajorProject_automated)
