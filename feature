1.how to support console
a.one method in kvm guest system

 systemctl start getty@ttyS0
 systemctl enable getty@ttyS0
 echo ttyS0 >> /etc/securetty
 reboot

b.another  

 grubby --update-kernel=ALL --args="console=ttyS0"
 reboot

 so you can use:virsh ttyconsole $domain
 ctrl+] quit virsh console


2.others
qmeu-img
qmeu-kvm
virt-install
virsh

kvm host/kvm guest



