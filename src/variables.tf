variable "region" {
  description = "AWS Region for s3 bucket"
  default     = "eu-west-1"
  type        = string
}

variable "bucket_name" {
  description = "Name of s3 bucket"
  default = "my-unique-bucket-name-12y"
}
