asgname=$1

function instances()
{
total=$(aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names "$asgname" | jq '.AutoScalingGroups[].Instances[].InstanceId' | wc -l )
if [ $total = 0 ]
then
echo "Sorry No instances found on this ASG"
else
echo "Found $total instance(s) "
echo "Instance Id Present on $asgname : "
aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names "$asgname" | jq '.AutoScalingGroups[].Instances[].InstanceId'
fi

}

echo " "
echo "Analysing..."
instances
echo " "

