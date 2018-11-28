k8s-delete-leftover-enis:
		@export ENIS=$$(aws ec2 describe-network-interfaces --filters "Name=status,Values=available" | jq ".NetworkInterfaces[] | select(.VpcId == \"$${VPC_ID}\") | .NetworkInterfaceId"); \
		if [[ ! -z $${DRY_RUN} ]]; then \
		  echo "Running in dry run mode! No changes will be made. The following ENIs would be deleted:"; \
		  echo $${ENIS}; \
		  exit 0; \
		else \
		  for eni in $$(echo $${ENIS}| tr -d "\""); \
		  do \
		    aws ec2 delete-network-interface --network-interface-id $${eni}; \
		  done; \
		fi;
