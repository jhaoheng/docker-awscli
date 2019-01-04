# What is docker-aws

[Docker](https://docker.io) image for running the [Amazon Web Services Command Line Interface](http://aws.amazon.com/cli/) and [s3cmd](https://github.com/s3tools/s3cmd). It creates a [Docker](https://docker.io) image containing all dependencies needed to run `aws` and `s3cmd`. That way, you can run these tools in a [Docker](https://docker.io) container without setting the dependencies on the host system.

## Build
`docker build -t aws:latest .`

## AWS Credentials
1. `cp -R awsSet.tmp awsSet`
2. Update awsSet
    - config
    - credentials
3. `docker run --volume ~/.awsSet:/root/.aws orbweb/aws:latest aws [some_command]`

# How To Use

## Version
- `docker run --rm -i -v $(pwd)/awsSet:/root/.aws aws:latest aws --version`
- Update version, just go to docker hub and build this Dockerfile, it will help you to build the latest version.

## Help
- `docker run --rm -i -v $(pwd)/awsSet:/root/.aws aws:latest aws help`


## Getting started with the AWS CLI and s3tools
For documentation on the AWS CLI, see the [AWS command line interface documentation](http://aws.amazon.com/documentation/cli/) and the [aws-cli GitHub page](https://github.com/aws/aws-cli). For S3 tools, see the [S3 tools documentation](http://s3tools.org/usage).
