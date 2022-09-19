resource "aws_s3_bucket" "sktwykim-s3-tf-state" {

  bucket = "sktwykim-s3-bucket-tfstate"

  tags = {
    "Name" = "sktwykim-s3-bucket-tfstate"
  }
  
}

resource "aws_dynamodb_table" "sktwykim-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.sktwykim-s3-tf-state]
  name         = "sktwykim-s3-ddb-tflock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "sktwykim-s3-ddb-tflock"
  }

}

