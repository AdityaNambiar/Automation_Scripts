
resource "aws_subnet" "k8s-learn-clust-subnet1" {
  availability_zone                              = "ap-south-1a"
  cidr_block                                     = "172.31.20.0/24"
  region                                         = "ap-south-1"
  tags = {
    Name    = "k8s-learn-clust-subnet1"
    Project = "CKA_Exam"
  }
  vpc_id = "vpc-040b6dbf17e74a132"
}
