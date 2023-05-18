variable "region" {
  description = "AWS Region for s3 bucket"
  default     = "eu-west-1"
  type        = string
}

variable "bucket_name" {
  description = "Name of s3 bucket"
  default     = "serverless-bucket-v3.0.1"
  type        = string
}

variable "access_control" {
  default = "cloudfront OAC"
}

variable "oac_description" {
  default = "description of OAC"
}

variable "domain_name_simple" {
  default = "example.com"
}
