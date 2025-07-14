variable "authToken" {
  type        = string
  description = "Value of the auth token for OCI authentication"
  sensitive   = true
}

variable "configProfile" {
  default = "DEFAULT"
}

variable "compartmentId" {
  description = "Value of the compartment OCID where the resources will be created"
  type        = string
  sensitive   = true
}

variable "oci_vcn_id" {
  description = "OCID of the VCN where the NAT Gateway will be created"
  type        = string
  sensitive   = true
}