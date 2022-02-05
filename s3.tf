resource "aws_s3_bucket" "b" {
  bucket = "my-pc-s3-simple-demo-tf-test-bucket"
  acl    = "private"

  tags = {
    Name                 = "My bucket"
    Environment          = "Dev"
  }
}