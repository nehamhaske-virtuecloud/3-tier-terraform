#!/bin/bash
sudo apt update -y
sudo apt install -y openjdk-17-jdk maven unzip

# Install MySQL client
sudo apt install -y mysql-client

# Download Spring Boot app
cd /home/ubuntu
wget https://github.com/nehamhaske-virtuecloud/springboot-maven-CICD.git
cd springboot-maven-CICD-main
./mvnw package

# Configure DB credentials
cat <<EOF > src/main/resources/application.properties
spring.datasource.url=${db_url}
spring.datasource.username=${db_username}
spring.datasource.password=${db_password}
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect
EOF

# Start the application
java -jar target/*.jar &
