resource "aws_iam_role" "build_role" {
  name                = "petclinic-build-role"
  assume_role_policy  = data.aws_iam_policy_document.instance_assume_role_policy.json

  tags = {
    tag-key = "terraform-petclinic-build-role"
  }
}

resource "aws_iam_policy" "build_policy" {
  name        = "petclinic-build-policy"
  description = "Policy to be used by the petclinic CodeBuild pipelines"
  policy = file(var.build_json_path)
  tags = {
    tag-key = "terraform-petclinic-build-policy"
  }
} 

resource "aws_iam_role_policy_attachment" "eks_policy_attachment" {
  role = aws_iam_role.build_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "s3_policy_attachment" {
  role = aws_iam_role.build_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "petclinic-build-role-policy-attachment" {
  role = aws_iam_role.build_role.name
  policy_arn = aws_iam_policy.build_policy.arn
}

data "aws_iam_policy_document" "instance_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}


resource "aws_iam_role" "pipeline_role" {
  name                = "petclinic-pipeline-role"
  assume_role_policy  = data.aws_iam_policy_document.pipeline_assume_role_policy.json

  tags = {
    tag-key = "terraform-petclinic-pipeline-role"
  }
}

resource "aws_iam_policy" "pipeline_policy" {
  name        = "petclinic-pipeline-policy"
  description = "Policy to be used by the petclinic CodePipeline projects"
  policy = file(var.pipeline_json_path)
  tags = {
    tag-key = "terraform-petclinic-pipeline-policy"
  }
} 

resource "aws_iam_role_policy_attachment" "petclinic-pipeline-role-policy-attachment" {
  role = aws_iam_role.pipeline_role.name
  policy_arn = aws_iam_policy.pipeline_policy.arn
}

data "aws_iam_policy_document" "pipeline_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codepipeline.amazonaws.com"]
    }
  }
}