resource "aws_instance" "app_instance" {
  count                     = 1
  ami                       = data.aws_ami.ubuntu.id
  instance_type             = var.instance_type
  subnet_id = values(aws_subnet.private_app)[0].id
  vpc_security_group_ids    = [aws_security_group.app_sg.id]
  associate_public_ip_address = false
  key_name                  = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y openjdk-17-jdk unzip git maven
              cd /home/ubuntu
              git clone https://github.com/nehamhaske-virtuecloud/springboot-maven-CICD.git
              cd springboot-maven-CICD
              chmod +x mvnw
              nohup ./mvnw spring-boot:run > /home/ubuntu/app.log 2>&1 &
              EOF

  tags = {
    Name        = "${var.project_name}-app-instance-${count.index + 1}"
    Environment = "dev"
    Tier        = "App"
  }
}
