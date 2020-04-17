
![docker-io-image](https://dockeri.co/image/jhaoheng/docker-awscli)

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/jhaoheng/docker-awscli)

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/jhaoheng/docker-awscli)

## Build & Usage
- `docker build -t awscli:latest .`
- `docker run --rm awscli aws help`

## Run from docker hub
- `docker run --rm jhaoheng/docker-awscli aws --version`

## AWS Credentials
- Use File : https://docs.aws.amazon.com/en_us/cli/latest/userguide/cli-configure-files.html
- Use Env : https://docs.aws.amazon.com/en_us/cli/latest/userguide/cli-configure-envvars.html

## Run with aws credentials file
- use `docker run --rm -v $(pwd)/.aws:/root/.aws docker-awscli aws configure list`

## Use alias to run docker aws container
1. `alias dockerawscli="docker run --rm -i -v $(pwd)/awsSet:/root/.aws aws:latest"`
2. Than use : `dockerawscli aws help` or `dockerawscli aws --version`

# Basic operation of aws cli

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

# Service Endpoints and Quotas
> https://docs.aws.amazon.com/general/latest/gr/aws-service-information.html

- 有個類型的 aws endpoint 可供搜尋


