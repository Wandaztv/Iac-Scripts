# Terraform AWS EC2 Instance and Security Group

This repository contains a Terraform configuration to create an EC2 instance along with a security group on AWS. The security group allows inbound SSH (port 22) and HTTP (port 80) traffic, while the EC2 instance uses a key pair for SSH access.

## Prerequisites

1. **Terraform**: You must have Terraform installed on your local machine. You can download it from [here](https://www.terraform.io/downloads.html).
   
2. **AWS CLI**: The AWS Command Line Interface (CLI) must be configured with valid credentials. If you haven't done this yet, follow the instructions [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html).

3. **AWS Account**: You need an AWS account. If you don't have one, sign up at [aws.amazon.com](https://aws.amazon.com).

4. **SSH Key Pair**: You need to have an existing SSH key pair on your machine. If you don't have one, you can generate one with the following command:
   ```bash
   ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa
