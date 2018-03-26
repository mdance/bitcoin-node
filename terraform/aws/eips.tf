resource "aws_eip" "node-a-ip" {
  instance = "${aws_instance.node-a.id}"
  vpc      = true
}