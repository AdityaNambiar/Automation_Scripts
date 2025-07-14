provider "oci" {
  region              = "ap-mumbai-1"
  auth                = var.authToken
  config_file_profile = var.configProfile
}

resource "oci_core_nat_gateway" "tf_oci_nat_gw" {
  vcn_id         = var.oci_vcn_id
  compartment_id = var.compartmentId
  display_name   = "tf_oci_nat_gw"
  freeform_tags = {
    "CreatedBy" = "Terraform Scripts"
    "CreatedOn" = "2025-07-14"
  }
}