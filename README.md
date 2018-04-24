# Butler configs for de.NBI HD Cloud deployment

This repository has a set of configurations for deployment of Butler onto the Heidelberg node of the de.NBI cloud.

This cloud has some unusual characteristics, namely the Openstack API endpoints are not all accessible from outside the cloud. The intended mode of access is through a proxy. This creates some issues for Terraform which is, at present, not able to use the proxy settings when communicating with the Openstack API. For these reasons, deployment of Butler clusters from outside of the HD cloud (as would normally be done) is currently not possible. Instead, deployment should proceed from one of the jumphosts or from a VM inside the cloud. The deployment steps in general are as specified in the Installation Guide (http://butler.readthedocs.io/en/latest/installation.html).

You will need to prepare a credentials file that Terraform will use to communicate with openstack. It should have these values populated. Do not check in this file into a code repository!


* user_name = "YOUR_USERNAME"
* project_id = "YOUR_PROJECT_ID"
* project_name = "YOUR_PROJECT_NAME"
* tenant_id = "YOUR_TENANT_ID"
* tenant_name = "YOUR_TENANT_NAME"
* domain_name = "elixir"
* password = "YOUR_PASSWORD"
* auth_url = "https://denbi-cloud.bioquant.uni-heidelberg.de:13000/v3"
* key_file = "PATH_TO_YOUR_PRIVATE_KEYFILE"
* bastion_key_file = "PATH_TO_YOUR_PRIVATE_KEYFILE_ON_BASTION"
* bastion_host = "IP_OF_BASTION_HOST"


# Configuration of NFS Shares

The HD de.NBI cloud has support for creating NFS shares. Current networking setup necessitates that instances that need to access the NFS share must have a floating IP and the NFS share needs to have a security rule that covers that IP. The worker.tf file in this repository includes the necessary configuration for adding floating IPs, but the security rule management for your share currently needs to be performed manually.

# Cloud performance

This cloud can exhibit slower than normal performance compared to other commercial and academic entitites. This manifests in relatively slow performance of the shell and long execution times for Saltstack commands. Please be aware that the initial Saltstack deployment can take 1-2 hours, compared to the usual 20 minutes.
