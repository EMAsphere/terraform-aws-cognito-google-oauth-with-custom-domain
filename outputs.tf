output "client_id" {
  value = aws_cognito_user_pool_client.cognito.id
}

output "pool_arn" {
  value = aws_cognito_user_pool.users.arn
}

output "pool_id" {
  value = aws_cognito_user_pool.users.id
}

output "cloudfront_distribution_arn" {
  value = aws_cognito_user_pool_domain.custom.cloudfront_distribution_arn
}

output "alb_json" {
  value = jsonencode({
    "alb.ingress.kubernetes.io/auth-idp-cognito" = {
      userPoolARN      = aws_cognito_user_pool.users.arn,
      userPoolClientID = aws_cognito_user_pool_client.cognito.id,
      userPoolDomain   = local.custom_domain
    }
  })
}
