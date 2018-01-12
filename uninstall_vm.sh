#echo $#
#sudo apt-get install libguestfs-tools
if [ $# -ne 1 ]; then
	echo "usage:$0 <vm-name>"
else
	vm_name=$1

	echo "vm name must be lower case [alpha/num/-]"
	echo -n "Do you want to remove vm <$vm_name> (y/N):"
	read inst_confirm
	if [ "$inst_confirm" = "y" ] ; then
		echo "You chose remove $vm_name"
	else
		echo "You chose not remove $vm_name"
		exit
	fi

	#exit
        sudo virsh shutdown $vm_name
        sudo virsh destroy $vm_name
        sudo virsh undefine $vm_name


fi
