# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "merit-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# Subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.1.1.0/24"
}

# Security Group
resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 (Standard)
resource "aws_instance" "standard" {
  ami           = "ami-03f4878755434977f"
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "merit-standard-ec2"
  }
}

# EC2 (GPU - example)
resource "aws_instance" "gpu" {
  ami           = "ami-03f4878755434977f"
  instance_type = "g4dn.xlarge"

  subnet_id = aws_subnet.public.id

  tags = {
    Name = "merit-gpu-ec2"
  }
}iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

tags = {
  Name       = "merit-standard-ec2"
  PatchGroup = "merit-labs"
}iam_instance_profile = aws_iam_instance_profile.ssm_profile.name

tags = {
  Name       = "merit-gpu-ec2"
  PatchGroup = "merit-labs"
}