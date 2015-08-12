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

# Find and replace bind_ip to 0.0.0.0 on /etc/mongodb.conf
sudo sed -i 's/^.*bind_ip .*$/bind_ip\ =\ 0.0.0.0/' /etc/mongodb.conf

sudo service mongodb restart

#***************************
# Change Welcome Screen
#***************************

sudo sed -i '$a\
printf "\\n"\
printf "========================\\n"\
printf "System Info\\n"\
printf "========================\\n"\
printf "Node $(node --version)\\n\\n"\
printf "MongoDB $(mongod --version)\\n\\n"\
printf "$(mongo --version)\\n\\n"\
printf "========================\\n"'  /etc/update-motd.d/00-header

#***********************************
# Cloud9 IDE
# NOTE:
# It installs from the cloud9 official repository
# https://github.com/c9/core.git
#
#***********************************

#sudo apt-get install zlib1g-dev

sudo npm install -g forever
sudo npm install -g node-gyp

git clone https://github.com/c9/core.git cloud9
./cloud9/scripts/install-sdk.sh

wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh


# Create PROV_FILE so provisioning doesn't happen in the future
touch ~/$PROV_FILE
