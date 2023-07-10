resource "aws_amplify_app" "my-app" {
  name       = "Sample-Next.js-App"
  repository = "https://github.com/samarthr8/Hositng-next.js-aws.amplify.git"
  access_token = "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"
  iam_service_role_arn = aws_iam_role.amplify_service_role.arn
  enable_branch_auto_build = true
  build_spec = <<-EOT
    version: 0.1
    frontend:
      phases:
        preBuild:
          commands:
            - npm install
        build:
          commands:
            - npm run dev
      artifacts:
        baseDirectory: build
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT
  # The default rewrites and redirects added by the Amplify Console.
  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }
  environment_variables = {
    ENV = "dev"
  }
}
