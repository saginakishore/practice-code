variable "my-ami"{
 default = "ami-068257025f72f470d"
 }
 variable "my-type"{
  default = "t2.micro"
 }
  variable "bucket" {
   type        = string
   default     = "bucket251201"
   description = "description"
 }
 variable "acl" {
     type      = string
     default   = "public-read"
 }
