resource "null_resource" "name" {
    provisioner "file" {
        source = "script.sh"
        destination = "script.sh"
    }
    provisioner "remote-exec" {
        inline = [
            "chmod +x script.sh",
            "./script.sh"
        ]
    }
    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("tf.pem")
        #private_key = "${file ("~/.ssh/keyname")}"
        #host = "${aws_instance.instance_one.private_key}"
         host = "self.public_ip"
    }
   
}
