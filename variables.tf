variable "vpc_name" {
  description = "Nome da VPC"
}

variable "alarm_name" {
  description = "Nome do alarme"
}

variable "ami_id" {
  description = "ID da AMI a ser usada"
}

variable "ec2_instance_name" {
  description = "Nome para a instância EC2"
}

variable "user_data_script" {
  description = "Script de user data para a instância"
}

variable "eip_name" {
  description = "Nome do Elastic IP"
}

variable "priv_sub_nat_name" {
  description = "Nome do NAT para a Subnet Privada"
}

variable "load_balancer_name" {
  description = "Nome do Load Balancer"
}

variable "load_balancer_target" {
  description = "Nome do Target Group do Load Balancer"
}

variable "security_group_elb_name" {
  description = "Nome do Security Group para o ELB"
}

variable "security_group_ec2_name" {
  description = "Nome do Security Group para a instância EC2"
}
