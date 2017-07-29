
job "server" {
  datacenters = ["dc1"]
  type = "service"

  update {
    stagger = "10s"
    max_parallel = 1
  }
  group "web" {
    count = 3
    restart {
      attempts = 10
      interval = "5m"
      delay = "25s"
      mode = "delay"
    }
    ephemeral_disk {
      size = 300
    }

    task "server" {
      # The "driver" parameter specifies the task driver that should be used to
      # run the task.
      driver = "raw_exec"
      
      config {
        command = "/Users/alextanhongpin/Documents/nomad/nomad-go/service-discovery/server/server"
      }

      env {
        PORT = "${NOMAD_PORT_web}"
      }

      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
        network {
          mbits = 10
          port "web" {}
        }
      }

      service {
        name = "global-server-check"
        tags = [
          "global", 
          "server",
          "traefik.tags=go",
          "traefik.frontend.rule=Host:service.go.localhost",
          "traefik.frontend.entryPoints=http"
        ]
        port = "web"
        check {
          name     = "something"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }


  group "client" {
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
    task "client" {
      driver = "raw_exec"
      
      config {
        command = "/Users/alextanhongpin/Documents/nomad/nomad-go/service-discovery/client/client"
      }

      env {
        PORT = "${NOMAD_PORT_http}"
        SERVICE_URI = "http://${env NOMAD_IP_web}:${NOMAD_PORT_web}/numbers"
      }

      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
        network {
          mbits = 10
          port "http" {}
        }
      }

      service {
        name = "global-client-check"
        tags = ["global", "client"]
        port = "http"
        check {
          name     = "alive"
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
      }
    }
  }
}