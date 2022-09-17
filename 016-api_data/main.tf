data "http" "example" {
  url = "https://api.datamuse.com/words?rel_jjb=ocean"
  request_headers = {
    Accept = "application/json"
  }
}
