resource "aws_instance" "web-server" {
    ami = "ami-09d3b3274b6c5d4aa"
    instance_type = "t2.micro"
    count = 1
    key_name = "firstkey"
    security_groups = [ "${aws_security_group.web-server.name}" ]
    user_data = file("./user_data.sh")

    tags = {
    Name = "instance-${count.index}"
    }
}