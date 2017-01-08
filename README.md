# nsxdeployment
The script is targetting to create the deployment automation of VCSA and NSX Manager with registration. 
The VCSA comsumes the most time for lab building and less flexibility for portgroup attachment for nested lab environment. 
To avoid the hardcode requirement, most variables are feteched from json file. so we only need to edit the json contents 
before running python script. 

There are 2 json files 1 powershell file that needs to edit 

  1) embedded_vCSA_on_VC.json : This file is used for VCSA deployment. Due to format is not able to change by VCSA installer validation,
     so just keep it as original
  2) vsm.json : This file is used for NSX Manager deployment, the basic nsx manager and vcenter environment requirment has been placed in file. 
  
  3) vm-create.ps1: the script of powercli to create nested hypervisor and enable cpu hordware virtualization. the number of nested hypervisor can be configured in script

The deployment source is VCSA ISO and NSX Manager OVA, you need to place the file manually in the folder and update the file name into above 
json file. 

This script test base in with 
  VCSA : VMware-VCSA-all-6.0.0-3343019.iso
  NSX Manager : VMware-NSX-Manager-6.2.5
  
The function in the script is built under class def functions, you can select the function to deploy VCSA or NSX Manager only, 
depends on your requriement. The code looks not pretty, but useable in my lab. 
