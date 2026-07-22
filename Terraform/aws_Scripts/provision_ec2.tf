resource "aws_instance" "k8s-learn-master" {
  ami = "ami-01a00762f46d584a1"
  associate_public_ip_address = true
  instance_type = "t2.medium"
  
  tags = {
    "Name":"k8s-learn-master"
  }
}