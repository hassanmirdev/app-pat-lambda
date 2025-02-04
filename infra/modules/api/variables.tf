variable "api_name" {
  description = "The name of the API Gateway."
  type        = string
}

variable "route_key" {
  description = "The route key for the API Gateway route."
  type        = string
}

variable "lambda_function_name" {
  description = "The Lambda function name."
  type        = string
}

variable "lambda_invoke_arn" {
  description = "The invoke ARN for the Lambda function."
  type        = string
}

variable "log_group_name" {
  description = "The name of the CloudWatch Log Group."
  type        = string
}

variable "retention_days" {
  description = "Retention days for CloudWatch Log Group."
  type        = number
  default     = 30
}

variable "stage_name" {
  description = "The name of the API Gateway stage."
  type        = string
  default     = "prod"
}
