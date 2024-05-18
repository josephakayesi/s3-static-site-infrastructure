output "site_endpoint" {
  value = aws_s3_bucket_website_configuration.site_configuration.website_endpoint
}