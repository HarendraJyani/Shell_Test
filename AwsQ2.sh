aws ec2 run-instances --image-id ami-14c5486b --instance-type t2.micro --key-name ShellAssign --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=HarendraJyani},{Key=username,Value=harendra},{Key=emailId,Value=harendra.jyani@quantiphi.com},{Key=Project,Value=PE_Train}]' --iam-instance-profile Arn=arn:aws:iam::488599217855:instance-profile/PE_trainee_Admin_role --user-data  
'#!/bin/bash
aws s3 cp upload.txt s3://harrytransfer1/random.pdf' --region us-east-1

aws s3 ls s3://harrytransfer1/random.txt
while [ $? -ne 0 ]
do
aws s3 ls s3://harrytransfer/random.txt
if [[ $? -eq 0 ]]
then
break
fi
done

aws ec2 run-instances --image-id ami-14c5486b --instance-type t2.micro --key-name ShellAssign --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=harrytransfer2},{Key=username,Value=harendrajyani},{Key=emailId,Value=harendra.jyani@quantiphi.com},{Key=Project,Value=PE_Train}]' --iam-instance-profile Arn=arn:aws:iam::488599217855:instance-profile/PE_trainee_Admin_role --user-data '#!/bin/bash
aws s3 cp s3://harrytransfer1/random.txt random.txt' --region us-east-1
#I have used my own key to launch two instances
