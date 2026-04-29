# EC2 for Backend APP
resource "aws_instance" "app" {
  for_each = var.instances

  ami                    = var.ami_id
  instance_type          = var.instance_type
  availability_zone      = each.value.az
  subnet_id              = var.public_subnet_ids[each.key]
  iam_instance_profile   = var.instance_profile_name
  vpc_security_group_ids = [var.ec2_sg_id]

  tags = {
    Name = "${var.env}-app-${each.key}"
    Env  = var.env
  }
}
