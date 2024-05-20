## AWS Static Website Using Amazon S3, Cloudfront and Terraform

### Introduction

This Terraform project sets up a static website using Amazon S3 and Cloudfront. Follow these steps to configure and successfully run the project.

> :warning: Remember to destroy infrastructure to avoid unexpected costs.

### Setup

#### Prerequisite

1. **Terraform Installation:** Ensure you have Terraform installed. Follow this [tutorial](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) if needed.

2. **AWS Configuration:** Ensure AWS is configured on your workstation. Follow this [tutorial](https://www.youtube.com/watch?v=gswVHTrRX8I) to get started.

### Steps

1. **Create Terraform Variable File"**

   - Run ` echo 'bucket_name = ""' > .auto.tfvars`

2. **Update Bucket Name:**

   - Edit `auto.tfvars` to include a unique `bucket_name`. Refer to [bucket naming rules](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html) for guidance.
     s

3. **Initialize Terraform Project:**

   - Run `terraform init`

4. **Plan Infrastructure:**

   - Run `terraform plan` to preview infrastructure changes.

5. **Apply Configuration**
   - Run `terraform apply -auto-approve` to provision infrastructure

> After provisioning you can explore the labs and follow along the videos.

6. **Destroy Infrasture**
   - Run `terraform destroy -auto-approve` remove infrastructure when done.
