# Terraform - AWS EC2 Instance Provisioning

This Terraform script provisions an AWS EC2 instance.

## Prerequisites

- Terraform installed on your local machine
- AWS account with appropriate access keys
- AWS CLI installed (for configuring your AWS credentials)

## Setup

1. Clone the repository:
    ```bash
    git clone https://your-repository-url.git
    cd your-repository
    ```

2. Install Terraform (if not already installed):
    - For Linux/macOS:
      ```bash
      brew install terraform
      ```
    - For Windows, follow the instructions on the [Terraform website](https://www.terraform.io/downloads.html).

3. Configure your AWS credentials:
    ```bash
    aws configure
    ```

4. Initialize Terraform:
    ```bash
    terraform init
    ```

5. Apply the configuration:
    ```bash
    terraform apply
    ```

   You will be prompted to approve the execution plan. Type `yes` to proceed.

## Terraform Script Explanation

- The `main.tf` file contains a simple resource block to provision an EC2 instance with a given AMI.
- You can modify the `ami` and `instance_type` values in `main.tf` to suit your needs.

## Cleanup

To destroy the infrastructure created by Terraform, run:
```bash
terraform destroy
