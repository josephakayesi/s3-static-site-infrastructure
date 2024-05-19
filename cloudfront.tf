resource "aws_cloudfront_distribution" "site_cloudfront_distribution" {
  depends_on = [
    aws_s3_bucket.bucket,
    aws_cloudfront_origin_access_control.site_origin_access_control
  ]

  origin {
    domain_name              = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_id                = aws_s3_bucket.bucket.id
    origin_access_control_id = aws_cloudfront_origin_access_control.site_origin_access_control.id
  }

  enabled             = true
  default_root_object = "index.html"

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  provisioner "local-exec" {
    command = "aws cloudfront create-invalidation --distribution-id ${self.id} --paths /*"
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = aws_s3_bucket.bucket.id
    viewer_protocol_policy = "https-only"

    min_ttl     = 0
    max_ttl     = 86400
    default_ttl = 3600

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }

      headers = ["Cache-Control", "Origin"]
    }

    compress = true

  }


  viewer_certificate {
    cloudfront_default_certificate = true
  }
}


resource "aws_cloudfront_origin_access_control" "site_origin_access_control" {
  name                              = "Security_Pillar100_CF_S3_OAC"
  description                       = "OAC setup for security pillar 100"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}