class profile::package {
  
  exec { "group":
  command => "/usr/sbin/groupadd  oinstall -g 1070 ",
  }
exec { "user":
   command => "/usr/sbin/useradd oracle -u 1071 -g oinstall;echo sarasu10|passwd --stdin oracle",
  }
file { [  '/u01/', '/u01/app', '/u01/app/oracle', '/u01/app/oracle/product', '/u01/app/oracle/product/ofm12.1.2', '/u01/app/oracle/config', '/u01/app/oracle/config/domains', '/u01/app/oracle/config/applications']:
   ensure => 'directory',
   mode => '0777',
   owner => "oracle",
   group => "oinstall",
}
file { "/u05/oraInst.loc":
   ensure => "file",
   content => "inventory_loc=/u01app/oraInventory\ninst_group=oinstall\n",
   mode => '0777',
   owner => "oracle",
   group => "oinstall",  }
exec {"permissions":
command => "/usr/sbin/usermod -G vboxsf oracle", }
}