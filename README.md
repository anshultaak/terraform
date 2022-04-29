# testRepo
testRepo by anshul

TERRAFORM

terraform plan = check kya kya add ho ge

terraform init = download plugin 

terraform providers = show all providers

terraform apply = finally step

terraform destroy = delete resources

terraform validate = check your code syntax

terraform fmt = delete all unusefully spaces 

terraform taint aws_security.group.allow_tls = mark this security gp when u see apply cmd created new one

terraform graph | dot Tpdf > file.txt = created you full terraform on graph save on this file

terraform workspace list = list all workspace

terraform workspace new dev = created workspace dev

terraform workspace show = current workspace show

terraform workspace select dev = go in this workspace

github_repository.terra-repo.url = it show this repo url any output give you

terraform console = enter var.username it's give you value any variable you see 




output "hello1" {
    value = "Hello world"
}

terraform plan = this run terraform file 

INPUT FROM USER
variable username {}
output printname {
    value = "Hello ${var.username}"
}

PRINT OUTPUT WITH VARIABLE
terraform plan -var "username=Anshul" 

DEFAULT VALUE OF VARIABLE
variable username {
    default = "world"
}
 
TYPE OF VARIABLE
string
number
bool
list
set
map
Object
tuple

variable age {
   type = number
}

LIST
variable users {
    type= list
}
output printfirst {
   value = "first list name is ${var.user[0]}"
}

JOIN FUNCTION 
output print {
    value = "${join("-",var.users)}"
}
#sepreated your value by -

UPPER CASE FUNCTION
output printupper {
   value = "${upper(var.user[0])}"
}

FUNCTION SAME LIKE UPPER 
lower
title

MAP VARIABLE
variable "usersage" {
    type = map
    default = {
       gaurav = 20
       saurav = 21

    }
}

output "userage"{
   value = "my name is Gaurav and age  is   "${lookup(var.usersage, "gaurav")}"
}

TFVARs
touch terraform.tfvars
age= 25
username="Anshul"

touch file.tr
variable age {
   type = number
}
variable "username"{
   type=string
}
# automatically take value from this file

terraform plan -var-file=development.tfvars
#here you set variable file name

SET ENV VARIABLE
terminal
export TF_VAR_username=Anshul
In file.tr
output printname {
    value = "Hello, ${var.username}"
}

PROVIDERS
terraform providers = list all providers

In file.tr created provide
provider "aws" {
    token="hsjsjdjdjjsjsu5677"
}
#token you find from AWS website or GitHub or etc

PLUGIN
terraform init 
# it  add plugin automatically 

APPLY terraform
terraform apply
