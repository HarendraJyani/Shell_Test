#! /bin/sh
#all files are merged into one and trying to execute via single run
#modes are already changed for each file
scp -i ./shellscripting1.pem ~/harry/Q1.sh ec2-user@ec2-18-221-144-26.us-east-2.compute.amazonaws.com:
scp -i ./shellscripting1.pem ~/harry/Q1_a.sh ec2-user@ec2-18-221-144-26.us-east-2.compute.amazonaws.com:
scp -i ./shellscripting1.pem ~/harry/Q1_b.sh ec2-user@ec2-18-221-144-26.us-east-2.compute.amazonaws.com:

ssh -i /home/harry/shellscripting1.pem ec2-user@ec2-18-221-144-26.us-east-2.compute.amazonaws.com ./Q1.sh


#!/bin/sh

mv Q1_a.sh /home/ec2-user/harry
mv Q1_b.sh /home/ec2-user/harry
cd harry


Pri_Ip=$(aws --output text --query "Reservations[*].Instances[*].PrivateIpAddress" ec2 describe-instances --instance-ids `aws --output text --query "AutoScalingGroups[0].Instances[*].InstanceId" autoscaling describe-auto-scaling-groups --auto-scaling-group-names "shellscripting"`)


scp /home/ec2-user/harry/Q1_b.sh ec2-user@$Pri_Ip:
scp /home/ec2-user/harry/Q1.sh.sh ec2-user@$Pri_IP:


ssh -t -t ec2-user@$Pri_IP ./Q1_b.sh


#!/bin/sh


sudo yum update
sudo yum install git

git init
git add final_1.sh
git commit -m "Question1 answer"
git remote add origin https://github.com/HarendraJyani/Shell_Test.git
git push -u origin master



