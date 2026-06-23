# Dynamic DNS resolution 

### Purpose
- On-Demand EC2 without Elastic IP allocations will have different IP Addresses each time they reboot.
- It has become a pain to keep updating the SSH configuration for connecting to our EC2 instances.

### Solution
- We are creating a 'Dynamic DNS' solution for incorporating new IP addresses.
- We will associate each new IP address with a registered domain on Amazon Route53.

#### Approach
- There are few components to this DDNS system. They are mentioned below:
    1. Python script to trigger the AWS Lambda Function URL.
    2. AWS Lambda function : retrieves the Public IPv4 Address of EC2 instance.
    3. Amazon DynamoDB : Security layer for the Public DDNS service. Approves updation incoming request with help of a token.
    4. Amazon Route53 : Updates the newly provisioned IPv4 Address in the Hosted Zone of registered domain.