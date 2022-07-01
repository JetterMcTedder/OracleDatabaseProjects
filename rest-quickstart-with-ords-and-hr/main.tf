#
# Start

# Get ADs

# <tenancy-ocid> is the compartment OCID for the root compartment.
# Use <tenancy-ocid> for the compartment OCID.

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

resource "random_string" "password" {
  length  = 16
  special = true
  min_special = 2
  min_numeric = 2
  override_special = "#"

}

resource "oci_database_autonomous_database" "resthr_autonomous_database" {
        #Required
        compartment_id = var.compartment_ocid
        cpu_core_count = "1"
        data_storage_size_in_tbs = "1"
        db_name = "HRDB"

        admin_password = random_string.password.result
        db_workload = "DW"
        display_name = "HRDB"
        is_free_tier ="true"
        license_model = "LICENSE_INCLUDED"
        #is_access_control_enabled = "false"
        is_auto_scaling_enabled = "false"
        is_data_guard_enabled = "false"
        is_dedicated = "false"
        is_preview_version_with_service_terms_accepted = false   
}


data "oci_database_autonomous_database" "resthr_autonomous_database" {
    #Required
    autonomous_database_id = oci_database_autonomous_database.resthr_autonomous_database.id
}

resource "oci_database_autonomous_database_wallet" "autonomous_data_warehouse_wallet" {
    #Required
    autonomous_database_id = oci_database_autonomous_database.resthr_autonomous_database.id
    password = random_string.password.result

    #Optional
    base64_encode_content = "true"
    generate_type = "SINGLE"
}

resource "local_file" "autonomous_data_warehouse_wallet_file" {
  content_base64 = oci_database_autonomous_database_wallet.autonomous_data_warehouse_wallet.content
  filename       = "wallet.zip"
  
}

resource "null_resource" "sqlcl-load-data" {

        provisioner "local-exec" {    
            command = <<-EOT
                sql -cloudconfig wallet.zip admin/${random_string.password.result}@HRDB_high @./db_scripts/hr.sql
            EOT
        }

depends_on = [
    local_file.autonomous_data_warehouse_wallet_file,
  ]

}



output "password" {
  value = "The password is ${random_string.password.result}"
}

output "openapi_view" {

  value = replace("${oci_database_autonomous_database.resthr_autonomous_database.connection_urls.0.sql_dev_web_url}admin/_sdw/?nav=rest-workshop&rest-workshop=modules&modules=openapi&openapi=%7B%22module_id%22%3A10022%7D#","sql-developer","")

}

output "database_actions" {

  value = oci_database_autonomous_database.resthr_autonomous_database.connection_urls.0.sql_dev_web_url

}