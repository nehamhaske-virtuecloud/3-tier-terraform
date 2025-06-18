resource "aws_instance" "web_instance" {
  count                  = 2
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = values(aws_subnet.public)[count.index].id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx

              cat > /etc/nginx/sites-available/default <<EOL
              server {
                  listen 80;
                  location / {
                      proxy_pass http://${aws_instance.app_instance[0].private_ip}:8080/;
                      proxy_set_header Host \$host;
                      proxy_set_header X-Real-IP \$remote_addr;
                      proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
                      proxy_set_header X-Forwarded-Proto \$scheme;
                  }
              }
              EOL

              systemctl restart nginx
              systemctl enable nginx
              EOF

  tags = {
    Name        = "${var.project_name}-web-${count.index + 1}"
    Environment = "dev"
  }

  depends_on = [aws_instance.app_instance]
}
