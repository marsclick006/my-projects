#!/bin/bash
#
# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.

    if [[ $EUID -ne 0 ]]; then
        echo "Bu script root olarak çalıştırılabilir." 
        exit 1
    fi
# Get the username (login).
    read -p "Kullanıcı adı giriniz: " KULLANICI
# Get the real name (contents for the description field).
    read -p "Gerçek adınızı giriniz: " REALNAME
# Get the password.
    read -s -p "Parola giriniz: " PAROLA
# Create the account.
    useradd -m $KULLANICI -c "$REALNAME" -s /bin/bash
# Check to see if the useradd command succeeded.
    id $KULLANICI
    sleep 3
# We don't want to tell the user that an account was created when it hasn't been.

if [[ "$?" -ne 0 ]]
then
    echo "Kullanıcı oluşturulamadı."
    exit 1
fi
# Set the password.
   echo -e "$PAROLA\n$PAROLA" | sudo passwd $KULLANICI  
# Check to see if the passwd command succeeded.
if [[ "$?" -ne 0 ]]
then
    echo "Kullanıcı parolası oluşturulamadı."
    exit 1
fi
# Force password change on first login.
    chage --lastday=0 $KULLANICI
# Display the username, password, and the host where the user was created.
 echo -e "Username: $KULLANICI \n Password: $PAROLA"
