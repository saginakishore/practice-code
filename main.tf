resource "aws_vpc" "mem_vpc"{
    cidr_block = "10.0.0.0/16"

    tags = {
        name = "cache-test"
    }  
}
resource "aws_subnet" "mem-subnet"{
    vpc_id = aws_vpc.mem_vpc.vpc_id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-2a"

     tags = {
        name = "cache-test"
    }  
 }
resource "aws_elasticache_subnet_group""mem_sub_group"{
    name = "mem-test"
    subnet_ids = [aws_subnet.mem_subnet.id]
}
resource "aws_elasticache_cluster" "memcache_cluster" {
    cluster_id = "my-cluster"
    engine = "memcached"
    node_type = "cache.t2.micro"
    num_cache_nodes = 1
    parameter_group_name = "default.memcached1.4"
    subnet_group_name = aws_elasticache_subnet_group.mem_sub_group.id
    port = 11211
}