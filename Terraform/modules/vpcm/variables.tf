variable "project-name"{
  type =  string
}
variable "name"{
  type = string
  default = gke-vpc
}
variable "sub-name"{
  type = string
  default = gke_subnet
}
variable "region"{
  type = string
  default = us-central-1
}

