resource "openstack_networking_floatingip_v2" "float_ip" {
	pool = "public-2"
	count = "${var.worker_count}"
}

resource "openstack_compute_floatingip_associate_v2" "float_ip_mapping" {
	count = "${var.worker_count}"
	floating_ip = "${element(concat(openstack_networking_floatingip_v2.float_ip.*.address, list("")), count.index)}"
	instance_id = "${element(concat(openstack_compute_instance_v2.worker.*.id, list("")), count.index)}"
}

resource "openstack_blockstorage_volume_v2" "butler_volumes" {
	count = "${var.worker_count}"
	name  = "${format("butler_worker_volume_%02d", count.index)}"
	size  = 350
}

resource "openstack_compute_volume_attach_v2" "attachments" {
	count = "${var.worker_count}"
	instance_id = "${element(openstack_compute_instance_v2.worker.*.id, count.index)}"
	volume_id = "${element(openstack_blockstorage_volume_v2.butler_volumes.*.id, count.index)}"
}

resource "openstack_compute_instance_v2" "worker" {

    depends_on = ["openstack_compute_instance_v2.salt-master"]

  	image_id = "${var.image_id}"
	flavor_name = "${var.worker-flavor}"
	security_groups = ["${openstack_compute_secgroup_v2.allow-traffic.name}", "${var.main-security-group-id}"]
	name = "butler-worker-${count.index}"
	network = {
		uuid = "${var.main_network_id}"
	}
	connection {
		user = "${var.user}"
		private_key = "${file(var.key_file)}"
		bastion_private_key = "${file(var.key_file)}"
		bastion_host = "${var.bastion_host}"
		bastion_user = "${var.bastion_user}"
		agent = true
	}
	
	/*block_device {
		source_type           = "blank"
		destination_type      = "volume"
		volume_size           = 300
		boot_index            = 0
		delete_on_termination = true
	}*/

	provisioner "file" {
		source = "salt_setup.sh"
		destination = "/tmp/salt_setup.sh"	
	}
	provisioner "remote-exec" {
		inline = [
		"chmod +x /tmp/salt_setup.sh",
		"/tmp/salt_setup.sh ${null_resource.masterip.triggers.address} worker-${count.index} \"worker, consul-client, denbi_hd\""
		]
	}
	
	count = "${var.worker_count}"
	key_pair = "${var.key_pair}"
}
