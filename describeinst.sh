instanceid=$1

if [ "$instanceid" == "" ];
then
echo "Please specify instanceid"
exit
else
echo ""
echo "Fetching all results.."
echo " "
echo "Details on Instance ID :  $instanceid"

echo -n "VPCID             =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].NetworkInterfaces[].VpcId'
echo -n "Availability_Zone =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].Placement.AvailabilityZone'
echo -n "SubnetId          =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].NetworkInterfaces[].SubnetId'
echo -n "SecurityName     =   "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].SecurityGroups[].GroupName'
echo -n "Security Group    =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].SecurityGroups[].GroupId'
echo -n "PrivateIpAddress  =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].PrivateIpAddress'
echo -n "PublicIpAddress   =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].PublicIpAddress'
echo -n "PublicDnsName     =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].PublicDnsName'
echo -n "PrivateDnsName    =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].PrivateDnsName'
echo -n "KeyName           =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].KeyName'
echo -n "InstanceType      =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].InstanceType'
echo -n "ImageId           =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].ImageId'
echo -n "State             =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].State.Name'
echo -n "LaunchTime        =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].LaunchTime'
echo -n "Tags              =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].Tags[]'
fi
