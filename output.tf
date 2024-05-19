output "site_endpoint" {
  value = aws_s3_bucket_website_configuration.site_configuration.website_endpoint
}

output "cloudfront_endpoint" {
  value = aws_cloudfront_distribution.site_cloudfront_distribution.domain_name
}