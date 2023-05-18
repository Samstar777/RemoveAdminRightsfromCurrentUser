#!/bin/bash

#Creator : Salim Ukani AKA Samstar
#Creation Date : 18th May 2023
# This script will fetch currentUser id and check if current user is Admin, If yes than it will remove admin rights from currentUser account.

currentUser=$(who | awk '/console/{print $1}')

#Check if currentUser is an admin
IsCurrentUserAdmin=$(dseditgroup -o checkmember -m "$currentUser" admin | awk '{print $1}')

#Remove CurrentUser from admin group
if [ $IsCurrentUserAdmin == "yes" ]; then
	echo "Removing Admin Rights from $currentUser user"
	/usr/sbin/dseditgroup -o edit -d $currentUser -t user admin
else 
	echo "$currentUser is Not Admin"
fi
