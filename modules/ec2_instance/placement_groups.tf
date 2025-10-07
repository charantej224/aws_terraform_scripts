/* 

Use Cluster for HPC, ML training, or tightly coupled workloads.

Use Spread for critical applications needing high availability.

Use Partition for large distributed systems like Hadoop or Cassandra.

*/


resource "aws_placement_group" "ec2_pg_cluster" {
  name     = "ec2_pg_cluster"
  strategy = "cluster" # Options: cluster, spread, partition
}

resource "aws_placement_group" "ec2_pg_spread" {
  name     = "ec2_pg_spread"
  strategy = "spread" # Options: cluster, spread, partition
}

resource "aws_placement_group" "ec2_pg_partition" {
  name            = "ec2_pg_partition"
  strategy        = "partition" # Options: cluster, spread, partition
  partition_count = 3
}
