p-rgs = {
  rg1 = {
    name     = "Ranjan_PG"
    location = "East US 2"
  }
  rg2 = {
    name     = "rg-ranjan-prod-us"
    location = "East US 2"
  }
}
p-vnet = {
  vnet1 = {
    name          = "vnet-dev"
    location      = "eastus2"
    group         = "Ranjan_PG"
    address_space = ["10.0.0.0/16"]
  }
}
p-sbn = {
  subnet1 = {
    name         = "subnet-pool-netflix"
    group        = "Ranjan_PG"
    network_name = "vnet-dev"
    prefixex     = ["10.0.0.0/24"]
  }
  subnet2 = {
    name         = "subnet-pool-starbugs"
    group        = "Ranjan_PG"
    network_name = "vnet-dev"
    prefixex     = ["10.0.1.0/24"]
  }
  subnet3 = {
    name         = "AzureBastionSubnet"
    group        = "Ranjan_PG"
    network_name = "vnet-dev"
    prefixex     = ["10.0.2.0/26"]
  }
}
p-pip = {
  pip1 = {
    name     = "pipforbastion"
    location = "East US 2"
    group    = "Ranjan_PG"
    method   = "static"
  }
}

p-bas = {
  bastion = {
    name       = "bastionforchapra"
    location   = "East US 2"
    group      = "Ranjan_PG"
    ipname     = "ip-config-for-bastion"
    subnetname = "subnet3"
    pipname    = "pip1"
  }
}

p-nic = {
  nicnetfliex1 = {
    name      = "nic-netflix1"
    location  = "East US 2"
    group     = "Ranjan_PG"
    ipcname   = "ip-config-netflix1"
    add-alloc = "Dynamic"
    subnetid  = "subnet1"
  }
  nicnetfliex2 = {
    name      = "nic-netflix2"
    location  = "East US 2"
    group     = "Ranjan_PG"
    ipcname   = "ip-config-netflix1"
    add-alloc = "Dynamic"
    subnetid  = "subnet1"
  }
  nicstarbucks1 = {
    name      = "nic-starbucks1"
    location  = "East US 2"
    group     = "Ranjan_PG"
    ipcname   = "ip-config-netflix1"
    add-alloc = "Dynamic"
    subnetid  = "subnet2"
  }
  nicstarbucks2 = {
    name      = "nic-starbucks2"
    location  = "East US 2"
    group     = "Ranjan_PG"
    ipcname   = "ip-config-netflix1"
    add-alloc = "Dynamic"
    subnetid  = "subnet2"
  }
}

p-nsg = {
  vm-nsg1 = {
    name     = "ranjannsg-1"
    location = "East US 2"
    group    = "Ranjan_PG"
    inbound = {
      name                       = "Allow-SSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

p-vm = {
  vm1 = {
    name     = "vm-netflix-1"
    location = "East US 2"
    group    = "Ranjan_PG"
    nic_key  = "nicnetfliex1"
    size     = "Standard_B1s"
  }
}
