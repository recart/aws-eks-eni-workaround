# aws-eks-eni-workaround

Issue: https://github.com/aws/amazon-vpc-cni-k8s/issues/69#issuecomment-442166650

Testing: `docker run -it -e AWS_DEFAULT_REGION=us-east-1 -e AWS_ACCESS_KEY_ID=xxxx -e AWS_SECRET_ACCESS_KEY=xxx -e DRY_RUN=true -e VPC_ID=xxx test-eni-workaround`


Edit and change in `cronjobs.yml`

Your VPC ID: `vpc_id_needed`

Your AWS region: `aws_region_needed`

Production: `kubectl apply -f cronjobs.yml`


[![Docker Repository on Quay](https://quay.io/repository/recart/aws-eks-eni-workaround/status "Docker Repository on Quay")](https://quay.io/repository/recart/aws-eks-eni-workaround)
