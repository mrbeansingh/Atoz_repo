module "rg" {
    source = "../Child_module/azurerm_resource_group"
    rg_name = "raj-rg"
    location = "eastus"
  
}
module "vnet" {
    depends_on = [ module.rg ]
    source = "../Child_module/azurerm_vnet"
    vnet_name = "rajvnet"
    location = "centralindia"
    resource_group_name = "raj-rg"
    address_space = ["10.0.0.0/16"]
  
}

module "sub" {
    depends_on = [ module.vm1 ]
    source = "../Child_module/azurerm_subnet"
    subnet_name = "raj-subent"
    resource_group_name = "raj-rg"
    virtual_network_name = "rajvnet"
    address_prefixes = ["10.0.1.0/24"]
  
}
module "pubic_ip" {
    depends_on = [  module.rg]
    source = "../Child_module/azurerm_public_ip"
 pip_name =  "raj-pip"
 resource_group_name = "raj-rg"
 location = "centralindia"
 allocation_method = "Static"
}

module "vm1" {
    depends_on = [ module.pubic_ip, module.rg,module.sub, module.vnet ]
    source = "../Child_module/azurerm_virtul_machine"
    subenet_name = "raj-subent"
    virtual_network_name = "rajvnet"
    resource_group_name = "raj-rg"
    public_ip_name = "raj-pip"
    nic_name = "raj-nic"
    ip_name = "raj-ip-config"
    vm_name = "raj-vm"
    admin_username = "Nemuadmin"
    admin_password = "Nemuuser1234"
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts"
    version = "latest"
    publisher = "Canonical"
    location = "centralindia"
  
}

