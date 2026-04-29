# S3 Bucket for Frontend
resource "aws_s3_bucket" "main" {
  bucket = "${var.env}-frontend-${var.bucket_suffix}"

  tags = {
    Name = "${var.env}-frontend"
  }
}

# S3 Bucket block
resource "aws_s3_bucket_public_access_block" "main" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# S3 Bucket Policy
resource "aws_s3_bucket_policy" "main" {
  bucket = aws_s3_bucket.main.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid    = "AllowCloudFrontOAC"
      Effect = "Allow"
      Principal = {
        Service = "cloudfront.amazonaws.com"
      }
      Action   = "s3:GetObject"
      Resource = "${aws_s3_bucket.main.arn}/*"
      Conditon = {
        StringEquals = {
          "AWS:SourceArn" = var.cloudfront_arn
        }
      }
    }]
  })
}
