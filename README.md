# create-lxc-on-Centos7
how to use:

first step:
  add all packeges in yum.sh what you want install in lxc
  example: 
    {code}
      yum -y install ansible
      # or add your needed packeges:
      rpm -ivh pa-config-0.1-1.noarch.rpm
    {code}
  
second step: 
  run in vm-server create_lxc.sh with params Host name and cidr: 
      bash create_lxc.sh acs-test2 172.16.0.202/21
      


  
  
