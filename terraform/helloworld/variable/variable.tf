// TF_VAR_username=anshul
// environment var add

variable username {
    type = string
    default = "devil"
}

variable age {
    type = number
    default = 10
}

// LIST
variable users {
    type = list
    default = ["anshul", "taak"]
}

// MAP
variable uersage {
    type = map 
    default = {
        anshul = 21
        taak = 20
        
    }
} 