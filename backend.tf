terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-ultron"
    key    = "terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}