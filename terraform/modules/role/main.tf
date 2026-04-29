# Reference existing Role
data "aws_iam_role" "ssm_role" {
  name = var.iam_role_name
}
# Reference existing S3 bucket for Ansible
data "aws_s3_bucket" "ansible_ssm" {
  bucket = var.ansible_bucket_name
}

# S3 Policy for EC2 to pull playbook
resource "aws_iam_role_policy" "ec2_s3_read" {
  name = "${var.env}-ec2-s3-read"
  role = data.aws_iam_role.ssm_role.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "s3:GetObject",
        "s3:ListBucket",
        "s3:GetBucketLocation"
      ]
      Resource = [
        data.aws_s3_bucket.ansible_ssm.arn,
        "${data.aws_s3_bucket.ansible_ssm.arn}/*"
      ]
    }]
  })
}

# EC2 Policy to describe dynamic inventory
resource "aws_iam_role_policy" "ec2_describe" {
  name = "${var.env}-ec2-describe"
  role = data.aws_iam_role.ssm_role.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "ec2:DescribeInstances",
        "ec2:DescribeInstanceStatus",
        "ec2:DescribeTags"
      ]
      Resource = "*"
    }]
  })
}

# Instance profile to attach ke EC2
resource "aws_iam_instance_profile" "ssm_profile" {
  name = "${var.env}-ec2-ssm-profile"
  role = data.aws_iam_role.ssm_role.name
}
