module "dynamodb" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "~> 5.0"

  name     = var.service
  hash_key = "shortcode"

  attributes = [
    {
      name = "shortcode"
      type = "S"
    }
  ]

  tags = local.default_tags
}
