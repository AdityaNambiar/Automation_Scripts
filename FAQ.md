1. How is the security handled for the Lambda Function URL?
    - The Lambda Function URL is currently setup to be invoked with AWS IAM authentication (IAM_AUTH).
2. What other security measures can be incorporated for securing Function URL in-depth? 
    - Few options:
    1) Secret-Hashed Token stored at DynamoDB. Later, Lambda can do a key (token) lookup to confirm whether the invoking client's domain is allowed to update HostedZone record.
    2) A static list of client domains stored at S3, who are allowed to invoke the Function URL to update HostedZone record.
