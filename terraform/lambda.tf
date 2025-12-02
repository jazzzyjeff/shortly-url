module "app1" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "${var.service}-app1"
  handler       = "main.lambda_handler"
  runtime       = "python3.14"
  source_path   = "../src/app1"

  environment_variables = {
    API_ENDPOINT = module.api.api_endpoint
    TABLE_NAME   = module.dynamodb.dynamodb_table_id
  }

  create_current_version_allowed_triggers = false
  allowed_triggers = {
    apigateway = {
      service    = "apigateway"
      source_arn = "${module.api.api_execution_arn}/*/*"
    }
  }

  attach_policy_statements = true
  policy_statements = {
    dynamodb = {
      effect    = "Allow",
      actions   = ["dynamodb:PutItem"],
      resources = [module.dynamodb.dynamodb_table_arn]
    }
  }

  tags = local.default_tags
}

module "app2" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "${var.service}-app2"
  handler       = "main.lambda_handler"
  runtime       = "python3.14"
  source_path   = "../src/app2"

  environment_variables = {
    TABLE_NAME = module.dynamodb.dynamodb_table_id
  }

  create_current_version_allowed_triggers = false
  allowed_triggers = {
    apigateway = {
      service    = "apigateway"
      source_arn = "${module.api.api_execution_arn}/*/*"
    }
  }

  attach_policy_statements = true
  policy_statements = {
    dynamodb = {
      effect    = "Allow",
      actions   = ["dynamodb:GetItem"],
      resources = [module.dynamodb.dynamodb_table_arn]
    }
  }

  tags = local.default_tags
}
