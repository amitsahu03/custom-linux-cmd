Certainly, here's a sample `README.md` file for your project:

```markdown
# internsctl - Custom Linux Command

## Overview

`internsctl` is a custom Linux command designed to provide various functionalities for system administrators and interns. It allows you to access information about the CPU, memory, and files on your server, create new users, and list existing users, including those with sudo permissions.

## Installation

1. Clone or download the repository to your local system.

2. Make the `internsctl` script executable:

   ```bash
   chmod +x internsctl
   ```

3. Move the `internsctl` script to a directory that is in your system's PATH so that you can run it from anywhere.

4. Make sure you have the required permissions to execute the script.

## Usage

### General Usage

- Display help and usage information:

   ```bash
   internsctl --help
   ```

- Display the version of `internsctl`:

   ```bash
   internsctl --version
   ```

- Greet the interns:

   ```bash
   internsctl -g
   ```

- Generate an intern report (custom logic can be added in the script):

   ```bash
   internsctl -r
   ```

### CPU and Memory Information

- Get CPU information similar to the `lscpu` command:

   ```bash
   internsctl cpu getinfo
   ```

- Get memory information similar to the `free` command:

   ```bash
   internsctl memory getinfo
   ```

### User Management

- Create a new user with the provided username:

   ```bash
   internsctl user create <username>
   ```

- List all regular users:

   ```bash
   internsctl user list
   ```

- List users with sudo permissions:

   ```bash
   internsctl user list --sudo-only
   ```

### File Information

- Get information about a file, including size, permissions, owner, or last modified time:

   ```bash
   internsctl file getinfo <file-name>
   ```

   - To get the size of the specified file:

     ```bash
     internsctl file getinfo --size <file-name>
     ```

   - To get the permissions of the specified file:

     ```bash
     internsctl file getinfo --permissions <file-name>
     ```

   - To get the owner of the specified file:

     ```bash
     internsctl file getinfo --owner <file-name>
     ```

   - To get the last modified time of the specified file:

     ```bash
     internsctl file getinfo --last-modified <file-name>
     ```

## Contributing

Contributions to this project are welcome. Feel free to submit issues or pull requests to improve the command or add new features.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```

You can customize this `README.md` file to include specific details about your project, such as installation instructions and usage examples.



##ScreenShots
https://files.catbox.moe/3xze1j.jpeg

https://files.catbox.moe/m4c617.jpeg

https://files.catbox.moe/5jwdm4.jpeg

https://files.catbox.moe/lcct88.jpeg

https://files.catbox.moe/jho4hn.jpeg