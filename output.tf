# output "public_dns_name" {
#   description = "Public DNS names of the load balancer for this project"
#   value       = module.elb_http.this_elb_dns_name
# }

#Informa DNS publico
output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.instancia.*.public_dns
}
#Informa IP Publico
output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.instancia.*.public_ip
}