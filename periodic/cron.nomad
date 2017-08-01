
job "cron" {
  datacenters = ["dc1"]

  type = "batch"

  update {
    stagger = "10s"

    max_parallel = 1
  }

  periodic {
    // Launch every minute
    cron = "* * * * * *"

    // Do not allow overlapping runs
    prohibit_overlap = true
  }

  group "cache" {
    count = 1

    restart {
      attempts = 10
      interval = "5m"
      delay = "25s"
      mode = "delay"
    }

    ephemeral_disk {
      size = 300
    }

    task "go" {
      driver = "raw_exec"

      config {
        // Path must be absolute. Can be a shell script
        // command = "/Users/alextanhongpin/Documents/nomad/nomad-go/periodic/bash.sh"
        command = "/Users/alextanhongpin/Documents/nomad/nomad-go/periodic/periodic"
      }


      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
      }
    }
  }
}