resource "template_file" "install" {
  template = file("${path.module}/scripts/install.sh.tpl")
  vars {
    hashicorp_public_key = file("${path.root}/files/hashicorp_public.key")
  }
}
