resource "aws_s3_bucket" "b" {
  bucket = "my-pc-s3-simple-demo-tf-test-bucket"

  tags = {
    Name                 = "My bucket"
    Environment          = "Dev"
  }
}


resource "aws_s3_bucket" "b_log_bucket" {
  bucket = "b-log-bucket"
}

resource "aws_s3_bucket_logging" "b" {
  bucket = aws_s3_bucket.b.id

  target_bucket = aws_s3_bucket.b_log_bucket.id
  target_prefix = "log/"
}



resource "aws_s3_bucket_server_side_encryption_configuration" "b" {
  bucket = aws_s3_bucket.b.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}



resource "aws_s3_bucket_versioning" "b" {
  bucket = aws_s3_bucket.b.id

  versioning_configuration {
    status = "Enabled"
  }
}
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }


resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}