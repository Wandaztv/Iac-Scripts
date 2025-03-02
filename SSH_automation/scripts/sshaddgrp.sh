#!/bin/bash

# Server Details (Hostname, IP, Username, Password)
declare -A servers=(
  ["stapp01"]="tony password1"
  ["stapp02"]="steve password2"
  ["stapp03"]="banner password3"
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
