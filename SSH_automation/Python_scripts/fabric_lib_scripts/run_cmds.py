from fabric import Connection
from invoke import Responder

# Define the remote server details
HOST = 'your.remote.server.com'
USER = 'your_ssh_user'
PASSWORD = 'your_ssh_password'

# Initialize the SSH connection
def create_connection():
    return Connection(
        host=HOST,
        user=USER,
        connect_kwargs={'password': PASSWORD}
    )

# Function to check if a directory exists and create it if not
def check_and_create_directory(connection, dir_path):
    print(f"Checking if directory {dir_path} exists on the remote server...")

    # Run the command to check if the directory exists
    result = connection.run(f'ls {dir_path}', warn=True)

    if result.failed:
        print(f"Directory {dir_path} does not exist. Creating it now.")
        connection.run(f'mkdir -p {dir_path}')
    else:
        print(f"Directory {dir_path} already exists.")

# Function to run a command on the remote server
def run_remote_command(connection, command):
    print(f"Running command: {command}")
    result = connection.run(command)
    print(f"Command output:\n{result.stdout}")

# Main function
def main():
    # Connect to the remote server
    connection = create_connection()

    # Check and create a directory
    remote_directory = '/home/your_ssh_user/test_directory'
    check_and_create_directory(connection, remote_directory)

    # Run a command remotely (checking disk usage)
    run_remote_command(connection, 'df -h')

    # Close the connection
    connection.close()
    print("SSH connection closed.")

if __name__ == '__main__':
    main()
