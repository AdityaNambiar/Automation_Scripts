# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-05fe9551ab6a26578"
resource "aws_security_group" "k8s-learn-master-sg" {
  description = "default VPC security group"
  region                 = "ap-south-1"
  tags                   = {
    "Name" : "k8s-learn-master-sg"
    "Project" : "CKA_Exam"
  }
  vpc_id                 = "vpc-040b6dbf17e74a132"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.k8s-learn-master-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  tags = {
    "Project" = "CKA_Exam"
  }
}