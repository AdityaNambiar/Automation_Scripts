import {
    to = aws_security_group.k8s-learn-master-sg
    id = "sg-05fe9551ab6a26578"
}

resource "aws_instance" "k8s-learn-master" {
  ami = "ami-01a00762f46d584a1"
  associate_public_ip_address = true
  instance_type = "t2.medium"
  subnet_id = aws_subnet.k8s-learn-clust-subnet1.id
  key_name = "devops-app-key-01"
  security_groups = [ aws_security_group.k8s-learn-master-sg.id ]
  depends_on = [ aws_subnet.k8s-learn-clust-subnet1, aws_security_group.k8s-learn-master-sg ]
  tags = {
    "Name":"k8s-learn-master"
    "Project" = "CKA_Exam"
  }
}
