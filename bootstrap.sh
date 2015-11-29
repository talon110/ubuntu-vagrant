#! /bin/bash

PROV_FILE=.vagrant_provision.lock

# Check provision file

if [ -f $PROV_FILE ];
then
	echo "provisioning not required"
	echo "exiting..."
	exit 0
else
	echo "must provision"
fi



# Create PROV_FILE so provisioning doesn't happen in the future
touch ~/$PROV_FILE
