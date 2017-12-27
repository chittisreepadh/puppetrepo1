class profile::package::install {
  exec { "installation" :
command => "/usr/local/java/bin/java -jar /media/sf_bandaru/weblogic/fmw_12.2.1.2.0_wls.jar -silent -responseFile /media/sf_bandaru/wlsinstallation.rsp -invPtrLoc /u05/oraInst.loc",
user    => oracle,
group   => oinstall,
timeout => 2000, }
}
