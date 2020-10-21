#AWS Instance
resource "aws_instance" "example" {
    ami = data.aws_ami.windows.id
    instance_type = "t2.micro"
    availability_zone = var.availability_zone
  
  lifecycle {
    ignore_changes = [ami]
  }
}

#AMI Filter for Windows Server 2019 Base
data "aws_ami" "windows" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["801119661308"] # Canonical
}

#EBS Volume and Attachment

resource "aws_ebs_volume" "example" {
  availability_zone = var.availability_zone
  size              = 40
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.example.id
}

#Cloudwatch Metric

resource "aws_cloudwatch_metric_alarm" "ec2_cpu" {
  alarm_name                = "cpu-utilization"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2" 
  period                    = "120" #seconds
  statistic                 = "Average"
  threshold                 = "80" 
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []

  dimensions = {
        InstanceId = aws_instance.example.id
      }
}