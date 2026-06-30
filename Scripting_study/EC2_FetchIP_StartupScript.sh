Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0
 
--//
Content-Type: text/cloud-config; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"
 
#cloud-config
cloud_final_modules:
- [scripts-user, always]

--//
Content-Type: text/x-shellscript; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"

#!/bin/bash
curl -v --aws-sigv4 "aws:amz:ap-south-1:lambda" \
     --user "XXXXXXX:YYYYYY" \
     "https://ovsXXXXX.lambda-url.ap-south-1.on.aws/" > /tmp/ipaddr.txt 2>&1