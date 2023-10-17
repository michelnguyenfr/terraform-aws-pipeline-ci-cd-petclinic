resource "aws_codepipeline" "pipeline" {
  count = length(var.pipelines)

  name = var.pipelines[count.index].name
  role_arn = var.pipeline_role_arn  # Replace with your CodePipeline role ARN

  artifact_store {
    location = aws_s3_bucket.dummy_bucket.id  # Replace with your S3 bucket name
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name = "SourceAction"
      category = "Source"
      owner = "ThirdParty"
      provider = "GitHub"
      version = "1"

      configuration = {
        Owner             = var.pipelines[count.index].github_owner
        Repo              = var.pipelines[count.index].github_repo
        Branch            = var.pipelines[count.index].branch
        OAuthToken        = var.github_token
        PollForSourceChanges = "true"
      }

      output_artifacts = ["SourceArtifact"]
    }
  }

  stage {
    name = "Build"
    action {
      name = "BuildAction"
      category = "Build"
      owner = "AWS"
      provider = "CodeBuild"
      version = "1"

      configuration = {
        ProjectName = var.pipelines[count.index].build
      }

      input_artifacts = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
    }
  }

  stage {
    name = "DeployDev"
    action {
      name = "DeployDevAction"
      category = "Build"
      owner = "AWS"
      provider = "CodeBuild"
      version = "1"

      configuration = {
        ProjectName = var.pipelines[count.index].deploy
 #       EnvironmentVariables = [
 #         {
 #           name = "ENVIRONMENT"
 #           type = "PLAINTEXT"
 #           value = "dev"
 #         }
 #       ]
      }

      input_artifacts = ["BuildArtifact"]
    }
  }

  stage {
    name = "DeployProd"
    action {
      name = "DeployProdAction"
      category = "Build"
      owner = "AWS"
      provider = "CodeBuild"
      version = "1"

      configuration = {
        ProjectName = var.pipelines[count.index].deploy
#        EnvironmentVariables = [
#          {
#            name = "ENVIRONMENT"
#            type = "PLAINTEXT"
#            value = "prod"
#          }
#        ]
      }

      input_artifacts = ["BuildArtifact"]
    }
  }
}

resource "aws_s3_bucket" "dummy_bucket" {
  bucket = "petclinic_s3_bucket"
  force_destroy = true
  
  tags = {
    Name        = "petclinic_b3_bucket"
  }
}