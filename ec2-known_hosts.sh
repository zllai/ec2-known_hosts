#! /bin/bash

for region in $(aws ec2 describe-regions | jq -r '.Regions[].RegionName')
do
    instancesInfo=$(aws ec2 describe-instances --region $region | jq -r '.Reservations')
    numReservations=$(echo $instancesInfo | jq '. | length')
    for r in $(seq 0 $(( numReservations - 1 )))
    do
        numInstances=$(echo $instancesInfo | jq ".[$r].Instances | length")
        for i in $(seq 0 $(( numInstances - 1 )))
        do
            publicIp=$(echo $instancesInfo | jq -r ".[$r].Instances[$i].PublicIpAddress")
            if [ $publicIp != "null" ]; then
                instanceId=$(echo $instancesInfo | jq -r ".[$r].Instances[$i].InstanceId")
                key=$(aws ec2 get-console-output --instance-id $instanceId --region $region | grep -oP "(?<=BEGIN SSH HOST KEY KEYS-----\\\r\\\n)[^ ]* [^ ]* ")
                echo "$publicIp $key"
            fi
        done
    done
done