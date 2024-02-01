resource "aws_instance" "web" {
  #count = 11   #count.index is a special variable given by terraform
  count = length(var.instance_names)
  ami           = var.ami_id  #devops-practice
  instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "mysql" || var.instance_names[count.index] == "shipping" ? "t3.small" : "t2.micro"
  subnet_id = "subnet-0285fed2480af3f37"
  tags = {
    Name =  var.instance_names[count.index]
  }
}

resource "aws_route53_record" "www" {
  for_each = aws_instance.web
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}" #interpolation
  type    = "A"
  ttl     = 1
  records = [each.key == "web" ? each.value.public_ip : each.value.private_ip ]
}

# Variable interpolation allows you to include a variable value within another string, ultimately, helping you build dynamic configuration values.
  