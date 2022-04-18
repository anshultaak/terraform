#data created for image or ami resource
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-terra"
  }

  # run script after instance create
  user_data = file("${path.module}/script.sh")

  # send file local system to remote system on creaed instance

  # connection stable for copy file on remote system on create instance
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }

  # send file local system to remote system on creaed instance
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  # run command on remote server where your instance create
  provisioner "remote-exec" {
    inline = [
      "ifconfig > /tmp/",
      "echo'hello gaurav' > /tmp/test.txt "
    ]
  }

  # run script on remote server
  provisioner "remote-exec" {
    script = "./testscript.sh"
  }


  # run command on your local system 
  provisioner "local-exec" {
    on_failure  = continue # agar yhe provi fail te bi instance create ho jea
    working_dir = "/tmp/"
    command     = "echo ${self.public_ip} > /tmp/instancepublicip.txt"
  }

  # run python command on your local system 
  provisioner "local-exec" {
    interpreter = [
      "/usr/bin/python3", "-c" # path where python install binary 
    ]
    command = "print('HelloWorld')"
  }

  # run command when you destroy instance
  provisioner "local-exec" {
    when    = destroy
    command = "echo 'at delete'"
  }


}