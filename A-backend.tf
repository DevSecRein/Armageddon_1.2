terraform {
    backend "s3" {
        bucket = "staticrein.com"
        key = "terraformv2.tfstate" #name of the state file that
        region = "us-east-1"  
    }

}
