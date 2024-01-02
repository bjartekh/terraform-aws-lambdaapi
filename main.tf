module "company_platform_lambda" {

    source = "./modules/lambda"
    lambdafunctionname = "myCompanyTestFunction"
}

module "company_platform_api_gateway" {

    source = "./modules/apigateway"
    api_description = "this is a test"
    api_name = "bjartetest"
    apipath = "/testme"
    stagename = "dev"
    lambda_execution_arn = module.company_platform_lambda.lambda_execution_arn
    depends_on = [ module.company_platform_lambda ]
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id = "AllowExecutionFromAPIGateway"
  action = "lambda:InvokeFunction"
  function_name = module.company_platform_lambda.lambda_function_name
  principal = "apigateway.amazonaws.com"
  //source_arn = "${aws_api_gateway_rest_api.my_api.execution_arn}/*/*/*"
  source_arn = module.company_platform_api_gateway.api_execution_arn
}
