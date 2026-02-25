secrets = {
  mango = {
    dev = {
      DB_USERNAME = "dev_user"
      DB_PASSWORD = "dev_pass"
      REDIS_URL   = "redis-dev"
      JWT_SECRET  = "jwt-dev"
      API_KEY     = "api-dev"
      S3_BUCKET   = "repo1-dev-bucket"
      LOG_LEVEL   = "DEBUG"
    }

    test = {
      DB_USERNAME = "test_user"
      DB_PASSWORD = "test_pass"
      REDIS_URL   = "redis-test"
      JWT_SECRET  = "jwt-test"
      API_KEY     = "api-test"
      S3_BUCKET   = "repo1-test-bucket"
      LOG_LEVEL   = "INFO"
    }

    uat = {
      OnBaseURL = "http://prod-onbase"
      GC_OnBaseURL = "http://prod-gc"
      ShowXMLs = true
      ShowSimulator = true
      LogDocumentsInDB = true
      DbUser = "ace_user"
      DbPassword = "Password@123"
      AwsSecreteConnection = "Server=VSP-8VPLD74;Database=secrete_manager_Db;User Id=sa;Password=Passw0rd;TrustServerCertificate=True"
    }
  }

  repo2 = {
    dev = {
      DB_USERNAME = "dev_user"
      DB_PASSWORD = "dev_pass"
      REDIS_URL   = "redis-dev"
      JWT_SECRET  = "jwt-dev"
      API_KEY     = "api-dev"
      S3_BUCKET   = "repo2-dev-bucket"
      LOG_LEVEL   = "DEBUG"
    }

    test = {
      DB_USERNAME = "test_user"
      DB_PASSWORD = "test_pass"
      REDIS_URL   = "redis-test"
      JWT_SECRET  = "jwt-test"
      API_KEY     = "api-test"
      S3_BUCKET   = "repo2-test-bucket"
      LOG_LEVEL   = "INFO"
    }

    uat = {
      DB_USERNAME = "uat_user"
      DB_PASSWORD = "uat_pass"
      REDIS_URL   = "redis-uat"
      JWT_SECRET  = "jwt-uat"
      API_KEY     = "api-uat"
      S3_BUCKET   = "repo2-uat-bucket"
      LOG_LEVEL   = "WARN"
    }
  }
}
