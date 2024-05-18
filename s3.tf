resource "aws_s3_bucket" "bucket" { 
    bucket = var.bucket_name
    force_destroy = true

    tags = {
        Name = "whizlabs"
    }
}

resource "aws_s3_bucket_public_access_block" "site_public_access" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "site_policy" {
  bucket = aws_s3_bucket.bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "PublicReadGetObject"
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.bucket.arn}/*"
      },
    ]
  })

  depends_on = [ aws_s3_bucket_public_access_block.site_public_access ]
}


resource "aws_s3_bucket_website_configuration" "site_configuration" {
  bucket = aws_s3_bucket.bucket.id 

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "site_object" {
    bucket = aws_s3_bucket.bucket.id

    for_each = module.template_files.files
    key = each.key

    content_type = each.value.content_type
    source = each.value.source_path 

    content = each.value.content 
    etag = each.value.digests.md5
}