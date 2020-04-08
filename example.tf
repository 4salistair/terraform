provider "aws" {
                // provider is the cloud platform
    profile    = "default"
                // variable defaulted in the file with the aws keys  
     region     =  var.region 
                // variable in varibles file
  }
  
  resource "aws_instance" "example" {
                // resource is the server name
    ami           = "ami-b374d5a5"
                // this the type of OS that will be commissioned
    instance_type = "t2.micro"
                // this is instance the server 
  
  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
                // a provisoner enables a specific task to be completed
                // on the instance that is being comissioned

  }

  resource "aws_eip" "ip" {
  vpc = true
  instance = aws_instance.example.id
  }
               // you can create a resource that is not a server
               // this create an IP address the is elastic 
               // meaning that the IP can be applied the >1 server


  output "ip" {
  value = aws_eip.ip.public_ip
}
            // an output enables the publishing of a property 
