output name {
    value = "hello, ${var.username} and age is ${var.age}"
}

// LIST

output printname {
    value = "first user ${var.users[0]} and all user ${join(",",var.users)}"
}
// print first user from ist and all list print serprated by , 

output helloupper {
    value = "${upper(var.users[1])}"
}
// second list value change into upper latter

output hellolower {
    value = "${lower(var.users[1])}"
}
// second list value change into lower latter

output hellotitle {
    value = "${title(var.users[1])}"
}
// second list value change into title latter

// MAP

output userage {
    value = " my name is ${var.users[0]} and age is ${lookup(var.uersage, "anshul")}"
}
// lookup function go in map variable check anshul key value

output useragedynamic {
    value = " my name is ${var.users[1]} and age is ${lookup(var.uersage, "${var.users[1]}")}"
}