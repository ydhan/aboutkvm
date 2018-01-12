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
	#cp /raid/kvm/centos7-temp.qcow2 /radi/kvm/$vm_name
	virt-clone -o centos7-template -n $vm_name -f /raid/kvm/$vm_name.qcow2
	sudo virt-edit -a /raid/kvm/$vm_name.qcow2 /etc/hostname -e "s/centos7-template/$vm_name.ai/"
	virsh start $vm_name
fi
