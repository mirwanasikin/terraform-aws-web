# EC2 for Backend APP
resource "aws_instance" "app" {
  for_each = var.instances

  ami                    = var.ami_id
  instance_type          = var.instance_type
  availability_zone      = each.value.az
  subnet_id              = var.public_subnet_ids[each.key]
  iam_instance_profile   = var.instance_profile_name
  vpc_security_group_ids = [var.ec2_sg_id]

  user_data = <<-EOF
    #!/bin/bash
    # Install Docker
    dnf install -y docker
    systemctl enable --now docker
    usermod -aG docker ec2-user

    # Install Docker Compose plugin
    mkdir -p /usr/local/lib/docker/cli-plugins
    curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 \
      -o /usr/local/lib/docker/cli-plugins/docker-compose
    chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
  EOF

  tags = {
    Name = "${var.env}-app-${each.key}"
    Env  = var.env
  }
}
