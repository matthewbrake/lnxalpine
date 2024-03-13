#!/bin/ash

while true; do
    echo "Where would you like the directory? (Please provide a full path)"
    read dirPath

    # Create the directory if it doesn't exist
    if [ ! -d "$dirPath" ]; then
        mkdir -p "$dirPath"
        echo "Directory created at $dirPath."
    else
        echo "Directory already exists at $dirPath."
    fi

    echo "How do you want it configured? (root/user)"
    read ownerChoice

    case $ownerChoice in
        root)
            sudo chown -R root:root "$dirPath"
            echo "Ownership set to root."
            ;;
        user)
            sudo chown -R 1000:1000 "$dirPath"
            echo "Ownership set to UID 1000:GID 1000."
            ;;
        *)
            echo "Invalid choice. Defaulting to root ownership."
            sudo chown -R root:root "$dirPath"
            ;;
    esac

    # Initially set permissions: read and write for owner and group, none for others
    sudo chmod -R 770 "$dirPath"
    echo "Initial permissions set to read and write for owner and group."

    echo "Do you want to add group write permissions to the directory and all its contents? (yes/no)"
    read addGroupWrite

    if [ "$addGroupWrite" = "yes" ]; then
        sudo chmod -R g+w "$dirPath"
        echo "Added write permission for the group recursively."
    fi

    # Verify and display the directory permissions
    ls -ld "$dirPath"

    echo "Do you want to create another directory? (yes/no)"
    read continueChoice

    if [ "$continueChoice" != "yes" ]; then
        echo "Exiting script."
        break
    fi
done
