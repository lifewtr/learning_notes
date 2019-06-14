resource "aws_route53_zone" "newtech-academy" {
	name = "newtech.academy"
}
resource "aws_route53_record" "server1-record" {
	zone_id = "${aws_route53_zone.newtech-academy.zone_id}"
	name = "server1.newtech.academy"
	type = "A"
	ttl = "300"
	record = ["104.236.247.8"]
}
resource "aws_route53_record" "www-record" {
	zone_id = "${aws_route53_zone.newtech-academy.zone_id}"
	name = "www.newtech.academy"
	type = "A"
	ttl = "300"
	records = ["104.236.247.8"]
}
resource "aws_route53_record" "mail1-record" {
	zone_id = "${aws_route53_zone.newtech-academy.zone_id}"
	name = "newtech.academy"
	type = "MX"
	ttl = "300"
	records = [
		"1 aspmx.l.google.com.",
		"5 alt1.aspmx.l.google.com.",
		"5 alt2.aspmx.l.google.com.",
		"10 aspmx2.googlemail.com.",
		"10 aspmx3.googlemail.com."
		]
}
output "ns-servers" {
	value = "${aws_route53_zone.newtech-academy.name-servers}"
}
--------------------------------------------------------------------
RDS: relational database services
  - a managed database solution
    - you can easily setup replication
    - automated snapshots for backups 
    - automated security updates
    - easy instance replacement (for vertical scaling)

Create a RDS instance:
  - Create a subnet group
    - allows you to specify in what subnets the database will be in
  - Create a parameter group
  	- allows you to specify parameters to change settings in the database
  - Create a security group that allows incoming traffic to the RDS instance.