# group
resource "iam_group" "admin" {
	name = admin
}
resource "iam_policy" "admin-attach" {
	name = "admin-attach"
	groups = ["${iam_group.admin.name}"]
	policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
# user
resource "iam_user" "admin1" {
	name = "admin1"sdf
}
resource "iam_user" "admin2" {
	name = "admin2"
}
resource "iam_group_membership" "admin-users" {
	name = "admin-users"
	users = [
	"${iam_user.admin1.name}",
	"${iam_user.admin2.name}",
	]
	group = "${iam_group.admin.name}"
}