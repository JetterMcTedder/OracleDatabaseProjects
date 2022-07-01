
resource "null_resource" "file" {

  connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.compute_instance1.public_ip
      private_key = tls_private_key.compute_ssh_key.private_key_pem
      agent       = false
      timeout     = "10m"
  }

    provisioner "file" {
        source      = "reactApp.zip"
        destination = "/home/opc/reactApp.zip"
  }

  depends_on = [oci_core_instance.compute_instance1,
                oci_core_security_list.public-security-list,]

}

resource "null_resource" "compute-script1" {

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "opc"
      host        = oci_core_instance.compute_instance1.public_ip
      private_key = tls_private_key.compute_ssh_key.private_key_pem
      agent       = false
      timeout     = "10m"
    }
    inline = [
    "sudo dnf install @nodejs:16 -y",
    "sudo firewall-cmd --permanent --zone=public --add-port=3000/tcp",
    "sudo firewall-cmd --reload",
    "npx --yes create-react-app my-react-app",
    "unzip -o reactApp.zip",
    "cd my-react-app",
    "ENDPOINT_URL=$(echo ${oci_database_autonomous_database.quickstart_autonomous_database.connection_urls.0.sql_dev_web_url} | cut -d / -f 3 )",
    "echo $ENDPOINT_URL",
    "sed -i 's/ENDPOINT_URL/'$ENDPOINT_URL'/g' ./.env",
    "npm install react-router-dom -y",
    "npm start &",
    "sleep 20" ]
  }

  depends_on = [oci_core_instance.compute_instance1,
                oci_core_security_list.public-security-list,
                null_resource.file]

}