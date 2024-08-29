vpc_name                  = ""
alarm_name                = ""
ami_id                    = ""
ec2_instance_name         = ""
user_data_script          = <<-EOF
  #!/bin/bash
  echo "Hello, World" > index.html
  nohup busybox httpd -f -p 80 &
EOF
eip_name                  = ""
priv_sub_nat_name         = ""
load_balancer_name        = ""
load_balancer_target      = ""
security_group_elb_name   = ""
security_group_ec2_name   = ""