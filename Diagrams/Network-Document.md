## Documented Network Diagram

Home Network IP: $HOST_IP
Red-Jump IP: 20.248.193.170

**Subcription Information**

- Azure Subscription 1

**Resource Groups:**

- Resource Group: RT
- Region: (Asia Pacific) Australia East

**Virtual Networks:**

- Virtual Network: Primary_Network
- Region: (Asia Pacific) Australia East
- Resource Groups: RT
- Base: 10.0.0.0/16
- Subnet: 10.0.0.0/24

- Vitrual Network: ELK_Network
- Region: Japan East
- Resource Group: RT
- Base: 10.1.0.0/16
- Subnet: 10.1.0.0/24

**Netwrok Security Groups**

- Name: RT_SG
- Region: (Asia Pacific) Australia East
- Resource Group: RT

- Name: ELK1-nsg
- Region: Japan East
- Resource Group: RT

***Inbound Security Rules (RT_SG)***

- Name: External-Inbound-Deny-All
- Priority: 4096
- Source: Any
- Port: *
- Destination: Any
- Port: *
- Protocol: Custom
- Action: Deny

- Name: red-allow-ssh-inbound
- Priority: 4095
- Source: IP Address 
- Source IP: $HOME_IP
- Destination: IP Addresses
- Destination IP: 20.248.193.170
- Service: SSH
- Port: 22
- Action: Allow


- Name: allow-ssh-home-jump
- Priority: 4094
- Source: 10.0.0.4
- Port: *
- Destination: Service Tag
- Destination: Virtual Network
- Port: 22
- Protocol: SSH
- Action: Allow

- Name: Allow-80-To-LB
- Priority: 4093
- Source: IP Addresses
- Source IP: $HOME_IP
- Destination: Service Tag
- Destionation Service Tage: VirtualNetwork
- Servicec: HTTP
- Destination port ranges: 80
- Protocol: TCP
- Action: Allow


***Inbound Security Rules (ELK1-nsg)***

- Name: 5601-Access
- Priority: 100
- Source: Any
- Port: *
- Destination: Any
- Service: Custom
- Destination port: 5601
- Protocol: TCP
- Action: Allow



## Virtual Machines:
**- Virtual Machine Name: Red-Jump**
  - Region: Australia East
  - Availability Options: No infrastructure redundancy required
  - Security type: standard
  - Image: Ubuntu Server 18.04 LTS -Gen2
  - Size: Standard_B1s - 1vcpu, 1GiB memory
  - Authentication type: SSH public key
  - SSH pubic key: ???
**Networking**
  - Name: Red-Jump-ip
  - Type: Public
  - IP4: 20.248.193.170
  - SKU: Basic
  - Assignment: Static
  - NIC network security group: Advanced
  - NIC SG: RT_SG
  - Private IP: 10.0.0.4
  - Assignment: Static

**Users**
- Admin: redadmin
- Authentication: Public Key


**- Virtual Machine Name: Web-1**
- Region: Australia East
- Availability Options: Availability set
- Availability Set: Red-Web-set
- Security type: standard
- Image: Ubuntu Server 18.04 LTS -Gen2
- Size: Standard_B1ms - 1vcpu, 2GiB memory
- Authentication type: SSH public key
- SSH pubic key: ???
**Networking**
- IP: None
- NIC network security group: Advanced
- NIC SG: RT_SG
**Users**
- Admin: redadmin
- Authentication: Public Key

**- Virtual Machine Name: Web-2**
- Region: Australia East
- Availability Options: Availability set
- Availability Set: Red-web-set
- Security type: standard
- Image: Ubuntu Server 18.04 LTS -Gen2
- Size: Standard_B1ms - 1vcpu, 2GiB memory
- Authentication type: SSH public key
- SSH pubic key: ???
**Networking**
- IP: None
- NIC network security group: Advanced
- NIC SG: RT_SG
**Users**
- Admin: redadmin
- Authentication: Public Key

**- Virtual Machine Name: ELK1**
- Region: Japan East
- Availability Options: Availability set
- Availability Set: ELK-set
- Security type: standard
- Image: Ubuntu Server 18.04 LTS -Gen2
- Size: Standard B2s (2 vcpus, 4 GiB memory)
- Authentication type: SSH public key
- SSH pubic key: ???
**Networking**
- IP: Public: 20.210.232.212
- IP: Private: 10.1.0.4
- NIC network security group: Advanced
- NIC SG: RT_SG