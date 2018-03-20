
job "sls" {

  datacenters = ["dc1"]

  type = "batch"

  parameterized {
    payload = "required"
    meta_required = ["dispatcher_email"]
    meta_optional = ["pager_email"]
  }

  task "job" {
    driver = "raw_exec"
    config {
      command = "/Users/alextanhongpin/Documents/nomad/nomad-go/parameterized/parameterized"
      args = ["-email=${NOMAD_META_dispatcher_email}"]
    }

    resources {
      cpu    = 500 # 500 MHz
      memory = 256 # 256MB
    }

    dispatch_payload {
      file = "/Users/alextanhongpin/Documents/nomad/nomad-go/parameterized/config.json"
    }
  }
}