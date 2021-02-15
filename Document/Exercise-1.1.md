## Basic metrics of the machine

# Communicate with each other server using Vnet

**Create Instance Using PowerShell Azure:** 


| **Step** | **Script**                                                                                                                                                                                                                                                   | **comment**                                                                                          |
|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| 1        |az group create --name RG-vm1 --location eastus <br /> az group create --name RG-vm2  --location eastus                                                                                                                                                                                               | Need to create resource group                                                                        |
| 2        | #create a new virtual network under RG-1 resource group <br /> az network vnet create --address-prefixes 10.0.0.0/16 --name VN-vm1 --resource-group RG-vm1 --subnet-name SN-vm1 --subnet-prefixes 10.0.2.0/24  <br /> # create another virtual network under RG-2 resource group <br /> az network vnet create --address-prefixes 10.1.0.0/16 --name VN-vm2 --resource-group RG-vm2 --subnet-name SN-vm2 --subnet-prefixes 10.1.3.0/24   | Create new subnet attached to an Existing Resource group   |
|3|#create a new virtual machine under RG-vm1 resource group<br />az vm create --resource-group RG-vm1 --name santhosh-vm1 --image UbuntuLTS --generate-ssh-keys --output json <br />#create a another new virtual machine under RG-vm2 resource group<br />az vm create --resource-group RG-vm2 --name santhosh-vm2 --image UbuntuLTS --generate-ssh-keys --output json|  Create two new virtual machine running Ubuntu, which uses SSH authentication for login.     |
|3.1|#peering from RG-1 to RG-2<br />$vnet1 = Get-AzVirtualNetwork -Name VN-vm1 -ResourceGroupName RG-vm1 <br />$vnet2 = Get-AzVirtualNetwork -Name VN-vm2 -ResourceGroupName RG-vm2<br />Add-AzVirtualNetworkPeering -Name RG-1toRG-2 -VirtualNetwork $vnet1 -RemoteVirtualNetworkId $vnet2.Id<br />#Above creates peering from RG-vm1 to RG-vm2. we need to do the same from RG-vm2 to RG-vm1<br />Add-AzVirtualNetworkPeering -Name RG-2toRG-1 -VirtualNetwork $vnet2 -RemoteVirtualNetworkId $vnet1.Id<br />#output shows Connected in the PeeringState column<br />Get-AzVirtualNetworkPeering -ResourceGroupName RG-vm1 -VirtualNetworkName VN-vm1  \| Format-Table VirtualNetworkName, PeeringState<br />Get-AzVirtualNetworkPeering -ResourceGroupName RG-vm2 -VirtualNetworkName VN-vm2 \| Format-Table VirtualNetworkName, PeeringState| 1.both server was different virtual network firt we need to communicate both network<br />2.create VNET peering. This will allow communication between the above two virtual machines.|
| 4        | ssh IP-Address                                                                                                                                                                                                                                                | Confirm that the VM is running by connecting over SSH. Example: ssh 40.117.251.17 ssh 52.149.228.205 |
| 5        | az vm show --name santhosh-vm1 --resource-group RG-vm1                                                                                                                                                                                        | List information from a resource.                                                                    |

**Output for the Script**

**Step 1:**

{

"id":
"/subscriptions/9c3f0560-dfaa-49c4-9ae0-6b4782b2811f/resourceGroups/SanthoshResourceGroup",

"location": "eastus",

"managedBy": null,

"name": "SanthoshResourceGroup",

"properties": {

"provisioningState": "Succeeded"

},

"tags": null,

"type": "Microsoft.Resources/resourceGroups"

}

**Step 2:**  
{

"newVNet": {

"addressSpace": {

"addressPrefixes": [

"10.0.0.0/16"

]

},

"bgpCommunities": null,

"ddosProtectionPlan": null,

"dhcpOptions": {

"dnsServers": []

},

"enableDdosProtection": false,

"enableVmProtection": false,

"etag": "W/\\"803f94c6-f97e-4d62-bdf5-30bd05e4b99d\\"",

"extendedLocation": null,

"id":
"/subscriptions/9c3f0560-dfaa-49c4-9ae0-6b4782b2811f/resourceGroups/SanthoshResourceGroup/providers/Microsoft.Network/virtualNetworks/SanthoshVirtualNetwork",

"ipAllocations": null,

"location": "eastus",

"name": "SanthoshVirtualNetwork",

"provisioningState": "Succeeded",

"resourceGroup": "SanthoshResourceGroup",

"resourceGuid": "28e5ec4b-4ea8-4cc2-88c4-0e1ad862bad2",

"subnets": [

{

"addressPrefix": "10.0.0.0/24",

"addressPrefixes": null,

"delegations": [],

"etag": "W/\\"803f94c6-f97e-4d62-bdf5-30bd05e4b99d\\"",

"id":
"/subscriptions/9c3f0560-dfaa-49c4-9ae0-6b4782b2811f/resourceGroups/SanthoshResourceGroup/providers/Microsoft.Network/virtualNetworks/SanthoshVirtualNetwork/subnets/SanthoshSubnet",

"ipAllocations": null,

"ipConfigurationProfiles": null,

"ipConfigurations": null,

"name": "SanthoshSubnet",

"natGateway": null,

"networkSecurityGroup": null,

"privateEndpointNetworkPolicies": "Enabled",

"privateEndpoints": null,

"privateLinkServiceNetworkPolicies": "Enabled",

"provisioningState": "Succeeded",

"purpose": null,

"resourceGroup": "SanthoshResourceGroup",

"resourceNavigationLinks": null,

"routeTable": null,

"serviceAssociationLinks": null,

"serviceEndpointPolicies": null,

"serviceEndpoints": null,

"type": "Microsoft.Network/virtualNetworks/subnets"

}

],

"tags": {},

"type": "Microsoft.Network/virtualNetworks",

"virtualNetworkPeerings": []

}

}

**Step 3:**  
{- Finished ..

"fqdns": "",

"id":
"/subscriptions/9c3f0560-dfaa-49c4-9ae0-6b4782b2811f/resourceGroups/SanthoshResourceGroup/providers/Microsoft.Compute/virtualMachines/santhosh-vm1",

"location": "eastus",

"macAddress": "00-0D-3A-8D-92-7E",

"powerState": "VM running",

"privateIpAddress": "10.0.0.4",

"publicIpAddress": "52.149.228.205",

"resourceGroup": "SanthoshResourceGroup",

"zones": ""

}
**output:**
![](../media/private-ping.png)

# Another way two comunicate using public address:
>   **Step 1:** need to generate ssh key in both machines.  
>   command: ssh-keygen

>   **Step 2:** add ssh key into another machine.

command: vi \~/.ssh/authorized\_keys

>   \#server hosts

>   52.172.141.163 test1

>   40.80.92.13 test

**Output:**

![](../media/fffa272585cdb5f39a20e53b015d7374.png)
