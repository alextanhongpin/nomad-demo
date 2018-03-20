job "email" {
  
  datacenters = ["dc1"]
  type = "batch"

  meta {
    // Optional values
    hello = "john.doe"
    NAME = ""
  }

  parameterized {
    // Payload are additional details that can be passed to the system.
    payload = "optional"
    meta_optional = ["hello"]
    meta_required = ["NAME"]
  }

  task "email" {
    driver = "raw_exec"

    config {
      // Either use absolute path, or run it based on the current nomad task dir
      // command = "/Users/alextan/go/src/github.com/alextanhongpin/go-nomad-parameterized/email"
      command = "${NOMAD_TASK_DIR}/email"

      # You can pass the value from meta to here. Note the capitalization.
      # Separate arguments by comma
      args = ["-name=${NOMAD_META_NAME}", "-hello=${NOMAD_META_hello}"]
    }

    // This will produce a local file at local/output.json
    // dispatch_payload {
    //   file = "output.json"
    // }
  }

}