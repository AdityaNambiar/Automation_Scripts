# Simple Dynamic DNS

Project Overview:
- Built a serverless dynamic DNS solution on AWS — a shell script triggered a Lambda function URL on EC2 instance startup, which used Boto3 to update Route 53 records with the instance's current IP.  
- CloudWatch used for monitoring and debugging Lambda execution issues.  
- CloudTrail used for inspecting the API calls between components.

Components :
1. Shell Script 
    - Script which is deployed in the EC2 instance as a User Data script
    - This script is written to run on each reboot of the EC2 instance.
2. AWS Lambda  
    - Python (Boto3) code to capture and parse the EC2 instance IP.
3. AWS Route53 
    - Consist of a Custom registered HostedZone (Domain Name) to store DNS Type-A mapping records.
4. AWS CloudTrail 
    - Used to observe the API calls from User data invoking Lambda till Route53 API call
5. AWS CloudWatch 
    - Used to observe for any issues in code execution of Lambda 