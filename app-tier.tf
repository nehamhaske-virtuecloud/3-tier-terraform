resource "aws_instance" "app_instance" {
  # ami                    = "ami-0f58b397bc5c1f2e8" # Ubuntu 24.04 (check latest)
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_app[0].id
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  associate_public_ip_address = false
  key_name               = "my-key-pair"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y openjdk-17-jdk unzip git maven
              cd /home/ubuntu
              git clone https://github.com/nehamhaske-virtuecloud/springboot-maven-CICD.git
              cd springboot-maven-CICD
              ./mvnw spring-boot:run &
              EOF

  tags = {
    Name = "app-instance"
  }
}
