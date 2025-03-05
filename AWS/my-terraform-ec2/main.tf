# main.tf

provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

resource "aws_security_group" "my_sg" {
  name        = "my_security_group"
  description = "Allow inbound SSH and HTTP traffic"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "my_key" {
  key_name   = "my-key-pair"
  public_key = file("~/.ssh/id_rsa.pub")  # Ensure you replace with the correct path to your public key file
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-0c55b159cbfafe1f0" # Example AMI for Amazon Linux 2. Replace with the appropriate AMI ID for your region
  instance_type = "t2.micro"  # Change as per your requirements
  key_name      = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_sg.name]

  tags = {
    Name = "MyEC2Instance"
  }
}
