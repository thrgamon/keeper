#!/bin/bash
set -Eeuo pipefail

current_dir=${PWD##*/}

echo "Setting up go application to be deployed to dokku"
echo "What is the name of the app? ${current_dir}"
read app_name

if [ -z "$app_name" ]
then
  app_name=${current_dir}
fi

echo "Setting \$APP_NAME to ${app_name}"
echo "APP_NAME=${app_name}" >> .env

echo "Setting \$DB_NAME to ${app_name}_db"
echo "DB_NAME=${app_name}_db" >> .env

direnv allow
