provider "oci" {
  region              = "ap-mumbai-1"
  auth                = var.authToken
  config_file_profile = var.configProfile
}

resource "oci_core_subnet" "tf_oci_privsubnet" {
  vcn_id         = var.oci_vcn_id
  compartment_id = var.compartmentId
  cidr_block     = "10.0.1.0/24"
  display_name   = "tf_oci_privsubnet"
  freeform_tags = {
    "CreatedBy" = "Terraform Scripts"
    "CreatedOn" = "2025-07-14"
  }
  prohibit_internet_ingress  = true
  prohibit_public_ip_on_vnic = true
  dns_label = "tf_privsubnet"
}