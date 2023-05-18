variable "region" {
  description = "AWS Region for s3 bucket"
  default     = "eu-west-1"
  type        = string
}

variable "bucket_name" {
  description = "Name of s3 bucket"
  default     = "serverless-bucket-v1.0.1"
  type        = string
}
