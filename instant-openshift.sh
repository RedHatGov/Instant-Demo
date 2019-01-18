#!/bin/bash

echo -e "\e[1mSpecify the name of your custom variables file: " |tr --delete '\n'
read CUSTOMVARS
echo -e "\e[1mEnter your Red Hat username: " |tr --delete '\n'
read RHUID
echo -e "\e[1mEnter your Red Hat password: " |tr --delete '\n'
read -s RHPASS


if [ -z $RHUID ] || [ -z $RHPASS ] || [ -z $CUSTOMVARS ]
then
  echo -e "\e[31mERROR: You must specify your Red Hat username & password and a custom variables file"
  echo -e "\e[31mExiting..."
  exit 1
fi

# echo -e "\e[1mConfiguring OpenShift prerequisites..."
# ansible-playbook openshift-prep.yml -i /home/bhirsch/projects/Instant-Demo/hosts -e @${CUSTOMVARS} -k -K

echo -e "\e[1mChecking readiness of OpenShift cluster and performing the installation..."
ansible-playbook -i /tmp/openshift.hosts openshift-install.yml -e oreg_auth_user=$RHUID -e oreg_auth_password=$RHPASS -k
