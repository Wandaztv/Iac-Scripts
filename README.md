# Iac-Scripts

These README.md files give a brief overview of each tool, how to use the scripts, and some troubleshooting steps. For a real-world project, you may want to expand these further with more details on the specific configurations and potential customizations

# These scripts represent the foundational use cases for each of the tools. Depending on your infrastructure and requirements, you can extend them with variables, dynamic  inventories, remote execution, and more. For CI/CD pipelines, you can use Jenkins, GitLab CI, or other similar tools to automate these IaC steps.

# DevOps Scripts for IaC Tools

This repository contains DevOps scripts for managing infrastructure using popular IaC tools like Ansible, Terraform, Docker, and Kubernetes.

## Tools Included

- **Ansible**: For configuration management (Nginx installation)
- **Terraform**: For provisioning AWS EC2 instances
- **Docker**: For containerizing a simple Node.js application
- **Kubernetes**: For deploying and managing the Node.js app on a Kubernetes cluster
- **Python** for all the fun things
## Getting Started

1. Clone the repository:
    ```bash
    git clone https://github.com/Wandaztv/Iac-scripts.git
    cd Iac-scripts
    ```

2. Choose the appropriate tool/script to use:

    - **Ansible**: Run `ansible-playbook ansible/nginx_playbook.yml -i ansible/inventory.ini`
    - **Terraform**: Run `terraform apply` to provision an EC2 instance
    - **Docker**: Run `docker build` and `docker run` to containerize and run the Node.js app
    - **Kubernetes**: Apply the Kubernetes deployment using `kubectl apply -f kubernetes/deployment.yml`

## Requirements

- Ansible (for provisioning and configuration management)
- Terraform (for provisioning cloud infrastructure)
- Docker (for containerizing applications)
- Kubernetes (for deploying and managing applications)
- AWS account (for provisioning EC2 instances)

## License

MIT License


