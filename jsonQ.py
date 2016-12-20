import json,os,subprocess 

# before calling the scrip, we need to collect the deployment information
print "#" * 100

class deployment(object):
	def __init__(self,file):
		self.file = file 
		with open(self.file) as file:
			template = json.load(file)
			self.template = template 

	def appliance(self,key):
		self.key = key
		appliance = self.template["target.vcsa"]["appliance"]
		return  appliance[key]

	def esx(self,key):
		self.key = key
		esx = self.template["target.vcsa"]["esx"]
		return esx[key]

	def network(self,key):
               self.key = key
               network = self.template["target.vcsa"]["network"]
               return network[key]

	def os(self,key):
                self.key = key
                network = self.template["target.vcsa"]["os"]
                return os[key]			

	def sso(self,key):
                self.key = key
                sso = self.template["target.vcsa"]["sso"]
                return sso[key]

result = deployment("embedded_vCSA_on_ESXi.json").sso("site-name")
print result 
