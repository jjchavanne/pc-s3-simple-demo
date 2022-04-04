resource "aws_s3_bucket" "b" {
  bucket = "my-pc-s3-simple-demo-tf-test-bucket"

  tags = {
    Name                 = "My bucket"
    Environment          = "Dev"
    git_commit           = "31392811dacb76ae7a56316a3d062a42736a8f78"
    git_file             = "s3.tf"
    git_last_modified_at = "2022-02-05 20:55:42"
    git_last_modified_by = "jchavanne@paloaltonetworks.com"
    git_modifiers        = "jchavanne"
    git_org              = "jjchavanne"
    git_repo             = "pc-s3-simple-demo"
    yor_trace            = "eabadc1f-0047-41e8-9bec-fee873040a4b"
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


resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}
