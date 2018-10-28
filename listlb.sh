echo ""
echo "Analysing...."
echo "Found Loadbalancer : $(aws elb describe-load-balancers | jq '.LoadBalancerDescriptions[].LoadBalancerName' | wc -l) "
echo "Listing all loadbalancers:"

aws elb describe-load-balancers | jq '.LoadBalancerDescriptions[].LoadBalancerName'

