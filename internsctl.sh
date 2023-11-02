#!/bin/bash

# Define the version of the command
VERSION="v0.1.0"

# Define the manual page
MAN_PAGE="internsctl.1"

# Define the help message
help_message() {
  man ./"$MAN_PAGE"  # Display the manual page
}

#create new user function
create_user() {
  local username="$1"
  sudo useradd -m "$username"
}

#list users function
list_users() {
  local suod_only=false
  if [[ "$1" == "--sudo-only" ]]; then
    sudo_only=true
  fi
  if [ "$sudo_only" == true ]; then
    getent passwd | grep "bash"
  else
    getent passwd
  fi
}

# Define the main function
main() {
  case "$1" in
    -h | --help)
      help_message
      ;;
    -v | --version)
      echo "internsctl $VERSION"
      ;;
    -g | --greet)
      echo "Hello, interns! Welcome to the team."
      ;;
    -r | --report)
      echo "Generating the intern report..."
      # You can add the logic to generate the report here.
      ;;
    cpu | memory)
      case "$2" in
        getinfo)
          if [ "$1" == "cpu" ]; then
            lscpu  # Run the lscpu command for CPU info
          elif [ "$1" == "memory" ]; then
            free -m  # Run the free command for memory info
          fi
          ;;
        *)
          echo "Invalid subcommand. Use 'internsctl --help' for usage instructions."
          ;;
      esac
      ;;
    user)
      case "$2" in
        "create")
          create_user "$3"
          ;;
        "list")
          list_users "$3"
          ;;
        *)
          echo "Invalid subcommand. Use 'internsctl --help' for usage instructions."
          ;;
      esac
      ;;
    file)
      case "$2" in
        getinfo)
          if [ -n "$3" ]; then
            filename="$3"
            if [ -f "$filename" ]; then
              if [ "$4" == "--size" ] || [ "$4" == "-s" ]; then
                stat -c %s "$filename"  # Get file size
              elif [ "$4" == "--permissions" ] || [ "$4" == "-p" ]; then
                stat -c %A "$filename"  # Get file permissions
              elif [ "$4" == "--owner" ] || [ "$4" == "-o" ]; then
                stat -c %U "$filename"  # Get file owner
              elif [ "$4" == "--last-modified" ] || [ "$4" == "-m" ]; then
                stat -c %y "$filename"  # Get last modified time
              elif [ -z "$4" ]; then
                echo "File:  $(stat -c %n "$filename")"  #Get file name and not full path
                echo "Access:  $(stat -c %A "$filename")"  # Get file permissions
                echo "Size(B):  $(stat -c %s "$filename")"  # Get file size
                echo "Owner:  $(stat -c %U "$filename")"  # Get file owner
                echo "Modified:  $(stat -c %y "$filename")"  # Get last modified time
              else
                echo "Invalid option. Use 'internsctl file getinfo --help' for usage instructions."
              fi
            else
              echo "File does not exist."
            fi
          else
            echo "Please provide a filename. Usage: internsctl file getinfo [options] <file-name>"
          fi
          ;;
        *)
          echo "Invalid subcommand. Use 'internsctl --help' for usage instructions."
          ;;
      esac
      ;;
    *)
      echo "Invalid option. Use 'internsctl --help' for usage instructions."
      ;;
  esac
}

# Check if any arguments are provided
if [ $# -eq 0 ]; then
  help_message
else
  main "$1" "$2" "$3" "$4"
fi
