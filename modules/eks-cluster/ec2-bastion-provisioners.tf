# Create a Null Resource and Provisioners
resource "null_resource" "copy_ec2_keys" {
  depends_on = [aws_instance.bastion_ec2]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type = "ssh"
    # host        = aws_eip_association.eip_assoc.public_ip
    host        = aws_eip.bastion_eip.public_ip
    user        = "ubuntu"
    password    = ""
    private_key = file("./modules/eks-cluster/private-key/advskill-key.pem")
  }

  ## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "./modules/eks-cluster/private-key/advskill-key.pem"
    destination = "/tmp/advskill-key.pem"
  }
  ## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "chmod 400 /tmp/advskill-key.pem"
    ]
  }
  ## Local Exec Provisioner:  local-exec provisioner (Creation-Time Provisioner - Triggered during Create Resource)
  provisioner "local-exec" {
    command     = "echo VPC created on `date` and VPC ID: ${var.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "./modules/eks-cluster/local-exec-output-files/"
    #on_failure = continue
  }

}