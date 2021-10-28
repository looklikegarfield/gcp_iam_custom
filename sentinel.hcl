mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2.sentinel"
  }
}

policy "gcp_iam_custom" {
    source = "./gcp_iam_custom.sentinel"
    enforcement_level = "advisory"
}


module "tfplan-functions" {
    source = "./common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "tfstate-functions" {
    source = "./common-functions/tfstate-functions/tfstate-functions.sentinel"
}

module "tfconfig-functions" {
    source = "./common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

module "generic-functions" {
    source = "./common-functions/generic-functions/generic-functions.sentinel"
}