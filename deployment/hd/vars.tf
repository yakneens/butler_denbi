
variable "user_name" {
	default="CHANGE_ME"
}
variable "password" {
	default="CHANGE_ME"
}
variable "tenant_id" {
	default="CHANGE_ME"
}
variable "tenant_name" {
	default="CHANGE_ME"
}
variable "domain_name" {
	default="CHANGE_ME"
}

variable "auth_url" {
	
}

variable "key_pair" {
	default="sergei"
}


variable "bastion_key_file" {

}

variable "bastion_host" {

}

variable "bastion_user" {
	default = "ubuntu"
}

variable "image_id" {
	default = "504f1898-6ac3-4aa5-a4bd-348057a82f01"
}

variable "user" {
	default = "centos"
}

variable "key_file" {

}

variable "network_name" {
	default = "Germline_private"
}

variable "main_network_id" {
	default="301c1bee-c9c5-407d-9b43-9ba93cc513ca"
}

variable "worker_count" {
	default="1"
}

variable "salt-master-flavor" {
	default="HD-c4r8"
}

variable "worker-flavor" {
	default="HD-c8r32"
}

variable "db-server-flavor" {
	default="HD-c8r32"
}

variable "job-queue-flavor" {
	default="HD-c4r8"
}

variable "tracker-flavor" {
	default="HD-c4r8"
}

variable "main-security-group-id" {
	default="default"
}
