module "api" {
  source = "terraform-aws-modules/apigateway-v2/aws"

  name               = var.service
  protocol_type      = "HTTP"
  create_domain_name = false

  routes = {
    "GET /{code}" = {
      integration = {
        uri                    = module.app2.lambda_function_arn
        payload_format_version = "2.0"
        timeout_milliseconds   = 12000
      }
    }

    "POST /shorten" = {
      integration = {
        uri                    = module.app1.lambda_function_arn
        payload_format_version = "2.0"
        timeout_milliseconds   = 12000
      }
    }
  }

  tags = local.default_tags
}
