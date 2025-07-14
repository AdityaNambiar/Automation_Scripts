provider "oci" {
    region  =   "ap-mumbai-1"
    auth    =   "${var.authToken}"
    config_file_profile = "${var.configProfile}"
}

resource "oci_core_vcn" "terraform_oci_vcn" {
    dns_label = "tf_oci_vcn"
    cidr_block = "192.168.0.0/16"
    compartment_id = var.compartmentId
    display_name = "Terraform OCI VCN"
    freeform_tags = {
        "CreatedBy" = "Terraform"
        "Environment" = "Development"
    }
}