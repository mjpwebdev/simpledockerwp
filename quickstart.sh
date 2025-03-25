#!/bin/bash

prompt_input() {
  local var_name="$1"
  local prompt_message="$2"
  local default_value="$3"
  read -p "$prompt_message [$default_value]: " input_value
  input_value="${input_value:-$default_value}"
  export "$var_name"="$input_value" 
  echo "$var_name=$input_value" >> .env
}

configure_wp_config() {
  local db_name="$1"
  local db_user="$2"
  local db_password="$3"
  local db_port="$4"
  cp wordpress/wp-config-sample.php wordpress/wp-config.php
  sed_in_place "database_name_here" "$db_name" "wordpress/wp-config.php"
  sed_in_place "username_here" "$db_user" "wordpress/wp-config.php"
  sed_in_place "password_here" "$db_password" "wordpress/wp-config.php"
  sed_in_place "localhost" "127.0.0.1:$db_port" "wordpress/wp-config.php"
}

sed_in_place() {
  local pattern="$1"
  local replacement="$2"
  local file="$3"
  if [[ "$(uname)" == "Darwin" ]]; then
    # macOS
    sed -i "" "s/$pattern/$replacement/" "$file"
  else
    # Linux
    sed -i "s/$pattern/$replacement/" "$file"
  fi
}
> .env
prompt_input "MYSQL_DATABASE" "Enter MySQL database name" "db"
prompt_input "MYSQL_USER" "Enter MySQL username" "user"
prompt_input "MYSQL_PASSWORD" "Enter MySQL password" "password"
prompt_input "MYSQL_ROOT_PASSWORD" "Enter MySQL root password" "password"
prompt_input "MYSQL_TCP_PORT" "Enter MySQL TCP port" "3308"
cat .env
docker compose up -d
sleep 5  
configure_wp_config "$MYSQL_DATABASE" "$MYSQL_USER" "$MYSQL_PASSWORD" "$MYSQL_TCP_PORT"
php -S localhost:8082 -t wordpress
