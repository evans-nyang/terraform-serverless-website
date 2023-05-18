# Terraform AWS Static Website Deployment v3.0.1

This Terraform configuration deploys a static website on AWS using S3 buckets and CloudFront. It creates an S3 bucket to store the website files, sets up public access permissions, uploads the website files to the S3 bucket, creates a CloudFront distribution in front of the S3 bucket, configures access control for the S3 origin in CloudFront, and sets up DNS records using Route 53 for the website domain.

## Prerequisites

- AWS account credentials configured
- ACM certificate for the website domain
- Domain name registered with Route 53

## Resource Configuration

The Terraform configuration file (`main.tf`) defines the AWS resources required to deploy the static website. It creates the following resources:

- `aws_s3_bucket`: Creates an S3 bucket to store the website files.
- `aws_s3_account_public_access_block`: Configures public access settings for the AWS account.
- `aws_s3_object`: Uploads the `index.html` file from the local machine to the S3 bucket.
- `aws_cloudfront_distribution`: Creates a CloudFront distribution to serve the website.
- `aws_cloudfront_origin_access_control`: Configures access control for the S3 origin in CloudFront.
- `aws_s3_bucket_policy`: Defines a bucket policy to allow CloudFront access to the S3 bucket.
- `data_aws_iam_policy_document_website_bucket`: Generates an IAM policy document for the S3 bucket.
- `aws_acm_certificate`: Creates an ACM certificate for HTTPS support.
- `data_aws_route53_zone`: Retrieves the Route 53 hosted zone for the domain.
- `aws_route53_record`: Configures DNS records for the domain and CloudFront distribution.

## Usage

1. Change into the project directory:
    ```bash 
    cd terraform-serverless-website/src/v3.0.1
    ```

2. Initialize the Terraform configuration:
    ```
    terraform init
    ```

3. Modify the variables in `variables.tf` as needed.

4. Review the configuration in `main.tf` and make any necessary changes.

5. Format and validate the Terraform configuration:
    ```
    terraform fmt
    terraform validate
    ```

6. Plan the Terraform configuration:
    ```
    terraform plan
    ```

7. Apply the Terraform configuration:
     ```
    terraform apply
    ```

8. After successful deployment, your website will be available at the domain specified in the `domain_name_simple` variable.
    ```
    https://<domain_name_simple>
    ```


## Clean Up

To destroy the deployed infrastructure and delete all resources created by this Terraform configuration, run the following command:
```bash
terraform destroy
```
