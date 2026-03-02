provider "azurerm" {
  features {}
}

provider "aws" {
  region = "eu-west-2"
}


resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_resource_group" "rg" {
  name     = "two"
  location = var.location
}

data "azurerm_resource_group" "rg" {
  name       = azurerm_resource_group.rg.name
  depends_on = [azurerm_resource_group.rg]
}

locals {
  aws_name = "rg-${substr(md5(data.azurerm_resource_group.rg.id), 0, 8)}"
}

resource "aws_instance" "example" {
  ami           = "ami-0c76bd4bd302b30ec"
  instance_type = "t3.micro"

  tags = {
    Name = local.aws_name
  }
}