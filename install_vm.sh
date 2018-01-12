#echo $#
#sudo apt-get install libguestfs-tools
if [ $# -ne 1 ]; then
	echo "usage:$0 <vm-name>"
else
	vm_name=$1

	echo "vm name must be lower case [alpha/num/-]"
	echo -n "Do you want to create vm <$vm_name> (y/N):"
	read inst_confirm
	if [ "$inst_confirm" = "y" ] ; then
		echo "You chose create $vm_name"
	else
		echo "You chose not create $vm_name"
		exit
	fi

	#exit
	#cp /raid/kvm/centos7-100G.qcow2 /radi/kvm/$vm_name
        #sudo virt-clone -o centos7-template -n $vm_name -f /home/kvm/$vm_name.qcow2
        sudo cp /raid/kvm/centos7-template.qcow2 /raid/kvm/$vm_name.qcow2
        sudo qemu-img resize /raid/kvm/$vm_name.qcow2 +93G
	sudo virt-edit -a /raid/kvm/$vm_name.qcow2 /etc/hostname -e "s/centos7-template/$vm_name/"
	#sudo virsh start $vm_name
        sudo virt-install --name=$vm_name --ram=4096 --vcpus=4 --disk=/raid/kvm/$vm_name.qcow2,format=qcow2,bus=virtio --network bridge=br192,model=e1000 --os-type=linux --os-varian=rhel7 --nographics --import

fi
