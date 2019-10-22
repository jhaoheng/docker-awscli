
![docker-io-image](https://dockeri.co/image/jhaoheng/docker-awscli)

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/jhaoheng/docker-awscli)

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/jhaoheng/docker-awscli)



# Usage this from DockerHub
- `docker run --rm jhaoheng/docker-awscli aws --version`

## Build & Usage
- `docker build -t awscli:latest .`
- `docker run --rm awscli aws help`

## AWS Credentials
1. `cp -r aws.configure .aws`
2. Update `.aws/`
    - config
    - credentials
3. use `docker run --volume $(pwd)/.aws:/root/.aws awscli aws configure list`

## Use alias to run docker aws container
1. `alias dockerawscli="docker run --rm -i -v $(pwd)/awsSet:/root/.aws aws:latest"`
2. Than use : `dockerawscli aws help` or `dockerawscli aws --version`

# How To Use
> Below cmd should add prefix `docker run --rm awscli {cmd}`

## Version
- `aws --version`
- Update version, just go to docker hub and build this Dockerfile, it will help you to build the latest version.

## Help
- `aws help`

## Configure List
- `aws configure list`

## EC2 : describe-regions
- `aws ec2 describe-regions --output table`

## EC2 : describe-availability-zones
- `aws ec2 describe-availability-zones --output table`

## Getting more about AWS CLI
- For documentation on the AWS CLI, see the [AWS command line interface documentation](http://aws.amazon.com/documentation/cli/) 
- and the [aws-cli GitHub page](https://github.com/aws/aws-cli).

# Regions and Availability Zones
> https://docs.aws.amazon.com/en_us/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html

- US East (N. Virginia) : us-east-1
- US West (N. California) : us-west-1
- Asia Pacific (Singapore) : ap-southeast-1
- Asia Pacific (Tokyo) : ap-northeast-1