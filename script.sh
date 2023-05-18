#!/bin/bash

# Get the database details from wp-config.php
db_name=$(grep "DB_NAME" wp-config.php | awk -F "'" '{print $4}')
db_user=$(grep "DB_USER" wp-config.php | awk -F "'" '{print $4}')
db_password=$(grep "DB_PASSWORD" wp-config.php | awk -F "'" '{print $4}')

# Get the website name from the current working directory
website_name=$(pwd | awk -F "/" '{print $5}')

# Define the export file name
export_file="TID_4441643_IHM-$website_name.sql"

# Export the database using mysqldump
mysqldump -u "$db_user" -p"$db_password" "$db_name" > "$export_file"

# Print a success message
echo "Database export completed. The file '$export_file' has been created."
