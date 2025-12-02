module "dynamodb" {
  source = "terraform-aws-modules/dynamodb-table/aws"

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
