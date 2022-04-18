resource "github_repository" "terra-repo1" {
  name        = "first-repo-terraform1"
  description = "try to learn something new"
  visibility  = "public"
  auto_init   = true
}

resource "github_repository" "terra-repo-sec2" {
  name        = "second-repo-terraform2"
  description = "try to learn something new"
  visibility  = "public"
  auto_init   = true
}