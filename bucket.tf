resource "aws_s3_bucket" "b" {
  bucket = "my-pc-s3-simple-demo-tf-test-bucket2"
  acl    = "private"

  tags = {
    Name                 = "My bucket"
    Environment          = "Dev"
  }
}