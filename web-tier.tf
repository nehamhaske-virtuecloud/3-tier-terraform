resource "aws_instance" "nginx_proxy" {
  ami = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  associate_public_ip_address = true
  key_name                    = "my-key-pair"

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx

              cat > /etc/nginx/sites-available/default <<EOL
              server {
                  listen 80;
                  location / {
                      proxy_pass http://$APP_PRIVATE_IP:8080/;
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
    Name = "nginx-web-proxy"
  }
}
