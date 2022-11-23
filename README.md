# Infrastructure as Code

## Installation
### Install Packer
- [Install Packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli)
- [Download Packer](https://developer.hashicorp.com/packer/downloads)

### Install Terraform
- [Download Terraform](https://developer.hashicorp.com/terraform/downloads)

## Configuration
- [Amazon AMI Builder](https://developer.hashicorp.com/packer/plugins/builders/amazon)
- [Configuration and credential file settings](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
### Credentials configuration file
Create a folder `.aws` in the `home` 
```
mkdir ~/.aws
```

and a file `credential`
```
touch ~/.aws/credentials
```

and include inside the file
```
[default]
aws_access_key_id=AKIAIOSFODNN7EXAMPLE
aws_secret_access_key=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

You can also use hardcode an environment variables for this configuration.

### Amazon Machine Image (AMI)
- [Find a Linux AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html)
- [AMI Catalog](https://us-east-2.console.aws.amazon.com/ec2/v2/home?region=us-east-2#AMICatalog:)
- [Public Images](https://us-east-2.console.aws.amazon.com/ec2/v2/home?region=us-east-2#Images:visibility=public-images;v=3;$case=tags:false%5C,client:false;$regex=tags:false%5C,client:false)
- [Ubuntu - Amazon EC2 AMI Locator](https://cloud-images.ubuntu.com/locator/ec2/)

## Example
### script folder
Create a `script` folder, and inside include the `packer-key.pub` and other scripts (for example, `install-docker.sh`)

#### Generate key
```
ssh-keygen -f ~/.ssh/packer-key -t rsa
```

## Packer
### Validate Packer
```
packer validate aws-ami.json
```

### Build Packer
```
packer build aws-ami.json
```