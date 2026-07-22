/**
* Create an IAM User and retrieve its details using a data source
* This shows policies attached to the user
*/
/*
resource "aws_iam_user" "TestUserResource" {
    name = "TestUser"
}

data "aws_iam_user" "TestUserPolicies" {
    user_name = aws_iam_user.TestUserResource.name
}

output "ShowTestUserPolicies" {
    value = data.aws_iam_user.TestUserPolicies.arn
}*/


/** 
* Create an IAM Role and retrieve its details using a data source
* This shows policies attached to the role
*/
/*
resource "aws_iam_role" "TestRoleResource" {
    name = "TestRole"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            },
        ]
    })
  
}*/


