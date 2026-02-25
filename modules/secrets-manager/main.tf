locals {
  repo_env_map = merge([
    for repo, repo_data in var.secrets : {
      for env, env_data in repo_data :
      "${repo}/${env}/${repo}${env}secrets" => {
        repo = repo
        env  = env
        data = env_data
      }
    }
  ]...)
}

resource "aws_secretsmanager_secret" "this" {
  for_each = local.repo_env_map

  name        = each.key
  description = "Secrets for ${each.value.repo} - ${each.value.env}"

  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "this" {
  for_each = aws_secretsmanager_secret.this

  secret_id     = each.value.id
  secret_string = jsonencode(local.repo_env_map[each.key].data)
}
