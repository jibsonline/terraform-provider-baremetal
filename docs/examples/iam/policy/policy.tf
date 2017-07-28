variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "compartment_ocid" {}
variable "region" {}

variable "group_name" {}

provider "baremetal" {
  tenancy_ocid = "${var.tenancy_ocid}"
  user_ocid = "${var.user_ocid}"
  fingerprint = "${var.fingerprint}"
  private_key_path = "${var.private_key_path}"
  region = "${var.region}"
}

resource "baremetal_identity_policy" "policy1" {
  name = "policy1"
  description = "A terraform managed policy"
  compartment_id = "${var.compartment_ocid}"
  statements = ["allow group ${var.group_name} to manage all-resources on tenancy"]
}
