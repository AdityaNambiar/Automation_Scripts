/**
@author: Aditya Nambiar
@date: 2025-07-25
*/
provider "oci" {
  region              = "ap-mumbai-1"
  auth                = var.authToken
  config_file_profile = var.configProfile
}

/**
@author: Aditya Nambiar
@date: 2025-07-25 
@description: This Terraform script creates a VCN and a public subnet in OCI.
@note: Ensure that the compartmentId and oci_vcn_id variables are set correctly in
         variables.tf before applying this script.
*/
resource "oci_core_vcn" "vcn1" {
  compartment_id = var.compartmentId
  cidr_block     = "10.0.0.0/16"
  display_name   = "oci_learn_vcn_1"
  freeform_tags = {
    "CreatedBy" = "Terraform Scripts"
    "CreatedOn" = "2025-07-25"
  }
  dns_label = "ocivcn1"
}

/**
@author: Aditya Nambiar
@date: 2025-07-25
@description: This Terraform script creates a VCN and a public subnet in OCI.
*/

resource "oci_core_subnet" "vcn1_subnet1" {
  vcn_id         = oci_core_vcn.vcn1.id
  compartment_id = var.compartmentId
  cidr_block     = "10.0.0.0/24"
  display_name   = "oci_learn_subnet_1"
  freeform_tags = {
    "CreatedBy" = "Terraform Scripts"
    "CreatedOn" = "2025-07-25"
  }
  prohibit_internet_ingress  = false // Set to true if you want to restrict internet ingress
  prohibit_public_ip_on_vnic = false // Set to true if you want to restrict public IPs
  dns_label                  = "ocisubnet1"
}


/**
@author: Aditya Nambiar
@date: 2025-07-25
@description: This Terraform script creates an Internet Gateway in OCI.
*/
resource "oci_core_internet_gateway" "inet_gateway1" {
  compartment_id = var.compartmentId
  vcn_id         = oci_core_vcn.vcn1.id
  display_name   = "oci_learn_inet_gateway_1"
  freeform_tags = {
    "CreatedBy" = "Terraform Scripts"
    "CreatedOn" = "2025-07-25"
  }
}
/**
@author: Aditya Nambiar
@date: 2025-07-25
@description: This Terraform script creates a Route Table in OCI.
@note: The route table is associated with the public subnet created above.  
          It contains a route rule that allows traffic to the internet through the Internet Gateway.
*/
resource "oci_core_default_route_table" "std_route_tbl" {
  manage_default_resource_id = oci_core_vcn.vcn1.default_route_table_id

  compartment_id = var.compartmentId
  display_name   = "oci_learn_std_route_tbl"
  freeform_tags = {
    "CreatedBy" = "Terraform Scripts"
    "CreatedOn" = "2025-07-25"
  }
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "SERVICE_CIDR"                             // This specifies the type of destination like CIDR_BLOCK or SERVICE_CIDR
    network_entity_id = oci_core_internet_gateway.inet_gateway1.id // Here we give target as Internet Gateway
    route_type        = "STATIC"                                   // This specifies that this is a static route manually defined in the route table by user
  }
}

/**
@author: Aditya Nambiar
@date: 2025-07-25 
@description: This Terraform script creates a Security List in OCI.
@note: The security list is associated with the public subnet created above.  
          It contains ingress rules that allow HTTP traffic on port 80 from any source.
*/
resource "oci_core_default_security_list" "std_sec_list" {
  manage_default_resource_id = oci_core_vcn.vcn1.default_security_list_id

  compartment_id = var.compartmentId
  display_name   = "oci_learn_std_sec_list"
  freeform_tags = {
    "CreatedBy" = "Terraform Scripts"
    "CreatedOn" = "2025-07-25"
  }

  // Ingress security rules allow incoming traffic to the subnet only on port 80 (HTTP).
  ingress_security_rules {
    protocol = "tcp"
    source   = "0.0.0.0/0" // This allows all incoming traffic from any source
    tcp_options {
      max = 80
      min = 80
    }
  }
}




/*resource "oci_core_subnet" "tf_oci_privsubnet" {
  vcn_id         = var.oci_vcn_id
  compartment_id = var.compartmentId
  cidr_block     = "10.0.1.0/24"
  display_name   = "tf_oci_privsubnet"
  freeform_tags = {
    "CreatedBy" = "Terraform Scripts"
    "CreatedOn" = "2025-07-25"
  }
  prohibit_internet_ingress  = true
  prohibit_public_ip_on_vnic = true
  dns_label                  = "tfprivsubnet"
}*/
