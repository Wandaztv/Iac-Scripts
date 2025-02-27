README: Automating User Group Assignment Across Multiple Servers
Overview
This process automates the creation of a user group (nautilus_admin_users) and adds a user (mohammed) to the group on multiple servers within a datacenter. The following steps outline the necessary preparations and script execution.

Prerequisites
Before running the script, ensure you have the following:

SSH access to all the target servers (stapp01, stapp02, stapp03).
sudo privileges on the servers.
sshpass installed on your local machine (for automating SSH password entry).
Install sshpass on RHEL
Enable the EPEL repository:

bash
Copy
sudo yum install -y epel-release
Install sshpass:

bash
Copy
sudo yum install -y sshpass
Verify the installation:

bash
Copy
sshpass -V
Step-by-Step Process
1. Define Server Details
In this step, define the server credentials (hostnames, usernames, and passwords) that will be used for SSH access in the script.

The servers in the example include:

stapp01: tony, Ir0nM@n
stapp02: steve, Am3ric@
stapp03: banner, BigGr33n
2. Create the Bash Script
Create a script file, e.g., add_user_to_group.sh, which will:

SSH into each server.
Add the nautilus_admin_users group (if not already created).
Add the user mohammed to this group.
Verify that mohammed is added to the group.
Script Content:
bash
Copy
#!/bin/bash

# Server Details (Hostname, IP, Username, Password)
declare -A servers=(
  ["stapp01"]="tony Ir0nM@n"
  ["stapp02"]="steve Am3ric@"
  ["stapp03"]="banner BigGr33n"
)

# Loop through each server
for server in "${!servers[@]}"; do
  IFS=' ' read -r user password <<< "${servers[$server]}"
  
  # SSH into the server and run sudo commands with the password passed via -S
  sshpass -p "$password" ssh -t -o StrictHostKeyChecking=no $user@$server << EOF
    # Ensure user exists (you may want to adjust this if the user is already created)
    echo "$password" | sudo -S useradd -m mohammed

    # Create the group and add the user to the group
    echo "$password" | sudo -S groupadd nautilus_admin_users
    echo "$password" | sudo -S usermod -aG nautilus_admin_users mohammed

    # Verify the user has been added to the group
    groups mohammed
EOF
done
3. Make the Script Executable
Before running the script, you must make it executable.

bash
Copy
chmod +x add_user_to_group.sh
4. Run the Script
Execute the script to automate the process:

bash
Copy
./add_user_to_group.sh
Alternatively, if you want to run the script with elevated privileges, use:

bash
Copy
sudo ./add_user_to_group.sh
5. Verification
Once the script runs, the user mohammed should be added to the nautilus_admin_users group on all target servers. The groups mohammed command will output the group memberships for mohammed, verifying that the operation was successful.

