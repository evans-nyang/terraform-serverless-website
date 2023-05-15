terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">=1.2.0"
}

provider "aws" {
  region = var.region
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket_name = var.bucket_name
  acl         = "private"

  enable_versioning = true

  tags = {
    Environment = "production"
  }
}

module "cloudfront" {
  source = "terraform-aws-modules/cloudfront/aws"

  price_class = "PriceClass_All"

  origins = [
    {
      domain_name = module.s3_bucket.bucket_domain_name
      origin_id   = "s3-origin"
    }
  ]

  behaviors = [
    {
      path_pattern = "/*"
      allowed_methods = ["GET", "HEAD", "OPTIONS"]
      cached_methods = ["GET", "HEAD"]

      forwarded_values = {
        query_string = false
        cookies = {
          forward = "none"
        }
      }

      min_ttl                = 0
      default_ttl            = 0
      max_ttl                = 0
      viewer_protocol_policy = "redirect-to-https"

      target_origin_id = "s3-origin"
    }
  ]

  restrictions = {
    geo_restriction = {
      restriction_type = "none"
    }
  }

  default_root_object = "index.html"

  viewer_certificate {
    acm_certificate_arn = "<ACM_CERT_ARN>"
    ssl_support_method  = "sni-only"
  }
}

resource "aws_iam_policy" "cloudfront_policy" {
  name = "cloudfront-access-to-s3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:GetObject"]
        Resource = "${module.s3_bucket.arn}/*"
        Condition = {
          StringEquals = {
            "aws:SourceArn" = module.cloudfront.cloudfront_arn
          }
        }
        Principal = {
          AWS = "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${module.cloudfront.origin_access_identity}"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "cloudfront_policy_attachment" {
  policy_arn = aws_iam_policy.cloudfront_policy.arn
  roles      = ["<ROLE_NAME>"]
}
