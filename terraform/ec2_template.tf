resource "aws_launch_template" "ecs_lt" {
  name_prefix   = "ecs-template"
  image_id      = "ami-063ee2cb61b0bdabc"
  instance_type = "t2.medium"
  network_interfaces {
    associate_public_ip_address = true
    security_groups = ["sg-06cdd749bce5d8fad"]
    subnet_id = aws_subnet.subnet1.id
  }
  key_name               = "promvm"
  vpc_security_group_ids = [aws_security_group.security_group.id]
  iam_instance_profile {
    name = "demo_role_ec2"
  }

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 30
      volume_type = "gp2"
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ecs-instance"
    }
  }
  user_data               = "IyEvYmluL2Jhc2gKZWNobyBFQ1NfQ0xVU1RFUj1teS1lY3MtY2x1c3RlciA+PiAvZXRjL2Vjcy9lY3MuY29uZmlnOw=="
}