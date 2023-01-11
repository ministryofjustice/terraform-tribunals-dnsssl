# Creates the hosted zone
resource "aws_route53_zone" "public" {
  name         = var.aws_route53_zone
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