ID=$(aws ec2 run-instances --image-id ami-14c5486b --instance-type t2.micro --key-name ShellAssign --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=HarendraJyani},{Key=username,Value=harendra},{Key=emailId,Value=harendra.jyani@quantiphi.com},{Key=Project,Value=PE_Train}]' --security-group-ids sg-7d17eb36 --iam-instance-profile Arn=arn:aws:iam::488599217855:instance-profile/PE_trainee_Admin_role --region us-east-1 --query Instances[0].InstanceId --user-data file://upload.txt)
ID=$(echo $ID | sed 's/[\"]//g')

State=$(aws ec2 describe-instance-status --instance-id $State --query InstanceStatuses[0].InstanceState.Code)
while [[ "$State" !=  16 ]]
do
   echo wait........
   sleep 6
   State=$(aws ec2 describe-instance-status --instance-id $ID --query InstanceStatuses[0].InstanceState.Code)
done


aws ec2 run-instances --image-id ami-14c5486b --instance-type t2.micro --key-name ShellAssign --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=harrytransfer2},{Key=username,Value=harendrajyani},{Key=emailId,Value=harendra.jyani@quantiphi.com},{Key=Project,Value=PE_Train}]' --security-group-ids sg-7d17eb36 --iam-instance-profile Arn=arn:aws:iam::488599217855:instance-profile/PE_trainee_Admin_role --region us-east-1 --user-data file://download.txt
#I have used my own key to launch two instances
