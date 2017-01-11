$vcenter="pvc.rkc.local"
$vcuser="administrator@rkc.local"
$vcpass="Nicira123$"


# environment parameter setup 
Get-Module -ListAvailable PowerCLI* | Import-Module
# the notes for Set-PowerCLIConfiguration. the multi-server mode is default and prompt warning to accept (change to single) and add -Confirm:$false to avoid 
Set-PowerCLIConfiguration -DefaultVIServerMode 'Single' -InvalidCertificateAction Ignore -Confirm:$false

# conecting to vCenter License Maanger 
write-host "Connecting to vCenter Server $vcenter" -foreground green 
Connect-VIServer $vcenter -user $vcuser -password $vcpass 

#create VC datacenter 
new-datacenter -location datacenters -name pvc-dc


# create infra clusetrs
new-cluster -location pvc-dc -name infr-cluster 
new-cluster -location pvc-dc -name esg-cluster 

# create new vds 
new-vdswitch -name pvc-nsx -location pvc-dc -NumUplinkPorts 2
