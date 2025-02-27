# Ansible - Nginx Playbook

This Ansible playbook installs and configures Nginx(or desired state) on remote servers.

## Prerequisites

- Ansible installed on your local machine
- SSH access to your target server(s)
- A list of web servers defined in the `inventory.ini` file

## Setup

1. Clone the repository:
    ```bash
    git clone https://your-repository-url.git
    cd your-repository
    ```

2. Update the `inventory.ini` file with the IP addresses of your target servers:
    ```ini
    [webservers]
    192.168.1.10 ansible_ssh_user=ubuntu ansible_ssh_private_key_file=/path/to/key.pem
    ```

3. Install Ansible (if not already installed):
    ```bash
    sudo apt update
    sudo apt install ansible
    ```

4. Run the Ansible playbook to install and configure Nginx:
    ```bash
    ansible-playbook ansible/nginx_playbook.yml -i ansible/inventory.ini
    ```

## Playbook Explanation

- The playbook installs the Nginx package and ensures that the Nginx service is started and enabled.
- The `inventory.ini` file contains a list of web servers where Nginx will be installed.

## Troubleshooting

- If you face any permission issues, try running the playbook with `sudo` or check your SSH key setup.

