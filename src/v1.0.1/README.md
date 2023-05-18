# Terraform AWS Serverless Website v1.0.1

This Terraform configuration deploys a serverless website on AWS using S3 buckets. It creates an S3 bucket to store the website files, sets up public access permissions, and defines a bucket policy to allow public read access.

## Usage

1. Change into the project directory:
    ```bash 
    cd terraform-serverless-website/src/v1.0.1
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

9. After successful deployment, you can access the website at the following URL:
    ```
    http://<bucket-name>.s3-<region>.amazonaws.com/index.html
    ```


## Clean Up

To destroy the deployed infrastructure and delete all resources created by this Terraform configuration, run the following command:
```bash
terraform destroy
```
