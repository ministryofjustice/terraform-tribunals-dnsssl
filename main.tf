# Creates the hosted zone
resource "aws_route53_zone" "public" {
  name         = var.aws_route53_zone
}

resource "aws_acm_certificate" "acm_certificate" {
  domain_name      = var.domain_name
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

data "aws_acm_certificate" "acm_certificate" {
  domain      = var.domain_name
  types       = ["AMAZON_ISSUED"]
  most_recent = true
}


resource "aws_route53_record" "new-route53-record" {
  zone_id = aws_route53_zone.public.zone_id
  name    = var.aws_route53_record_name
  type    = "A"
  alias {
    name                   = var.cname
    zone_id                = var.zone
    evaluate_target_health = false
  }
}