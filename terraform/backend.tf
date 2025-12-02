terraform {
  backend "s3" {
    bucket         = ""
    dynamodb_table = ""
    encrypt        = true
    key            = ""
    region         = "${AWS_REGION}"
  }
}
