provider "openstack" {
	user_name = "${var.user_name}"
	password = "${var.password}"
	auth_url = "${var.auth_url}"
	domain_name = "${var.domain_name}"
	tenant_name = "${var.tenant_name}"
	tenant_id = "${var.tenant_id}"
}