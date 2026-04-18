resource "aws_s3_bucket" "trail" {
  bucket = "merit-cloudtrail-logs-12345"
}

resource "aws_cloudtrail" "main" {
  name           = "merit-trail"
  s3_bucket_name = aws_s3_bucket.trail.id
}