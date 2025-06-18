data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "image-id"
    values = ["ami-0f918f7e67a3323f0"]
  }
}
