#!/bin/bash -e

export DOCKER_HOST=tcp://18.135.191.23:2375

aws cloudformation create-stack --profile cloudOne --stack-name blog-stage --template-body \
 file://$PWD/stack.yml --parameters "ParameterKey=KeyName,ParameterValue=cloudOne" \
 "ParameterKey=PrivateAccessLocation,ParameterValue=62.210.32.35/24" --output text > /dev/null

while [ $(aws cloudformation describe-stacks --profile cloudOne --stack-name blog-stage --output text --query 'Stacks[0].StackStatus') != "CREATE_COMPLETE" ]; do
	echo "Waiting for stack to be created..."
	sleep 5
done

