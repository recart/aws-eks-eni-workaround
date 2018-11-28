# aws-eks-eni-workaround
[![Docker Repository on Quay](https://quay.io/repository/recart/aws-eks-eni-workaround/status "Docker Repository on Quay")](https://quay.io/repository/recart/aws-eks-eni-workaround)

This project addresses the issue, that AWS CNI not deleting the ENIs that were attached to detached/terminated kubernetes worker nodes. As a workaround this cronjob will delete all the leftover ENIs in the VPC of your worker nodes, preventing your subnet to run out of IP addresses.

Read more about the issue here: https://github.com/aws/amazon-vpc-cni-k8s/issues/69

### Testing
You can test the project via passing `DRY_RUN=true` to the container.
Example:
```
docker run -it -e AWS_DEFAULT_REGION=us-east-1 -e AWS_ACCESS_KEY_ID=xxxx -e AWS_SECRET_ACCESS_KEY=xxx -e DRY_RUN=true -e VPC_ID=xxx test-eni-workaround
```

### Deploy to your kubernetes cluster

Replace the following in `cronjobs.yml`:
- `vpc_id_needed` - VPC id of the worker nodes
- `aws_region_needed` - AWS Region of your VPC

Finally deploy the cronjob:
`kubectl apply -f cronjobs.yml`

#### Credits:
- [@davidgereb](https://github.com/davidgereb)
- [@pigri](https://github.com/pigri)
