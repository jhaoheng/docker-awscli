
![docker-io-image](https://dockeri.co/image/jhaoheng/docker-awscli)

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/jhaoheng/docker-awscli)

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/jhaoheng/docker-awscli)



# What is docker-aws

[Docker](https://docker.io) image for running the [Amazon Web Services Command Line Interface](http://aws.amazon.com/cli/) and [s3cmd](https://github.com/s3tools/s3cmd). It creates a [Docker](https://docker.io) image containing all dependencies needed to run `aws` and `s3cmd`. That way, you can run these tools in a [Docker](https://docker.io) container without setting the dependencies on the host system.

## Build
`docker build -t aws:latest .`

## AWS Credentials
1. `cp -R awsSet.tmp awsSet`
2. Update awsSet
    - config
    - credentials
3. use `docker run --volume ~/.awsSet:/root/.aws orbweb/aws:latest aws [some_command]`

## Use alias to run docker aws container
1. `alias dockerawscli="docker run --rm -i -v $(pwd)/awsSet:/root/.aws aws:latest"`
2. Than use : `dockerawscli aws help` or `dockerawscli aws --version`

# How To Use

## Version
- `aws:latest aws --version`
- Update version, just go to docker hub and build this Dockerfile, it will help you to build the latest version.

## Help
- `aws:latest aws help`

## Configure List
- `aws configure list`

## EC2 : describe-regions
- `aws ec2 describe-regions --output table`

## EC2 : describe-availability-zones
- `aws ec2 describe-availability-zones --output table`

## Getting started with the AWS CLI and s3tools
For documentation on the AWS CLI, see the [AWS command line interface documentation](http://aws.amazon.com/documentation/cli/) and the [aws-cli GitHub page](https://github.com/aws/aws-cli). For S3 tools, see the [S3 tools documentation](http://s3tools.org/usage).

# Regions and Availability Zones
> https://docs.aws.amazon.com/en_us/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html

- US East (N. Virginia) : us-east-1
- US West (N. California) : us-west-1
- Asia Pacific (Singapore) : ap-southeast-1
- Asia Pacific (Tokyo) : ap-northeast-1