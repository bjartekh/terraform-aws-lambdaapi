output "lambda_execution_arn" {
  value = aws_lambda_function.html_lambda.invoke_arn
}