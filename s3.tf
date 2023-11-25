resource "aws_s3_bucket" "example"{
 bucket ="my-tf-ghfbj987798"

 tags = {
    Name   ="My bucket"
    Environment ="Dev"}
}