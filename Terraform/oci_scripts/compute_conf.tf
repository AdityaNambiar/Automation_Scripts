/**
@author: Aditya Nambiar
@date: 2025-07-25
*/

data "oci_core_images" "oci_learn_imgs" {
  compartment_id           = var.compartmentId
  operating_system         = "Oracle Linux"
  operating_system_version = "9"
  shape                    = "VM.Standard.E2.1.Micro" // Ensure this shape is available in your region
}

resource "oci_core_instance" "oci_learn_inst1" {
  availability_domain = var.availabilityDomain
  compartment_id      = var.compartmentId
  display_name        = "oci_learn_instance_1"
  shape               = "VM.Standard.E2.1.Micro" // Ensure this shape is available in your region

  create_vnic_details {
    subnet_id        = oci_core_subnet.vcn1_subnet1.id
    assign_public_ip = true // Set to false if you do not want a public IP
    display_name     = "oci_learn_vnic_1"
  }

  metadata = {
    ssh_authorized_keys = var.sshPublicKeyPath // Ensure this variable is set in variables.tf
  }
  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oci_learn_imgs.images[0].id // Use the first image from the filtered lis
    instance_source_image_filter_details {
      operating_system         = "Oracle Linux"
      operating_system_version = "9"
      compartment_id           = var.compartmentId
    }
  }
  freeform_tags = {
    "CreatedBy" = "Terraform Scripts - Instance"
    "CreatedOn" = "2025-07-25"
  }
}