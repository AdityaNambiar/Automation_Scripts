output "ec2_inst_id" {
    value = aws_instance.k8s-learn-master.arn
    description = "Show created Instance ARN"
}