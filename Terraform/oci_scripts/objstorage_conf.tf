
data "oci_objectstorage_namespace" "oci_learn_namespace" {
  compartment_id = var.compartmentId
}

locals {
  my_namespace = data.oci_objectstorage_namespace.oci_learn_namespace.namespace
}

output "debug_namespace" {
  value     = local.my_namespace
  sensitive = false
}

resource "oci_objectstorage_bucket" "oci_learn_bucket" {
  compartment_id = var.compartmentId
  namespace      = local.my_namespace
  name           = "oci-learn-bucket-${local.my_namespace}"
  storage_tier   = "Standard"
  access_type    = "ObjectRead"

  freeform_tags = {
    "CreatedBy" = "Terraform Scripts - Object Storage Bucket"
    "CreatedOn" = "2025-08-19"
  }

}


data "oci_objectstorage_preauthrequest" "oci_learn_par" {
  bucket = oci_objectstorage_bucket.oci_learn_bucket.name
  namespace = local.my_namespace
  par_id = "par-object-20250819-0152"
}

output "public_url" {
  value = data.oci_objectstorage_preauthrequest.oci_learn_par.object_name
}
