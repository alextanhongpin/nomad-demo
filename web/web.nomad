job "web" {
    datacenters = ["dc1"]
    
    group "web" {
        task "server" {
            driver = "raw_exec"

            config {
                command = "/Users/alextanhongpin/Documents/nomad/nomad-go/web/web"
                // port_map {
                //     web = 8080
                // }
                // args  = ["-PORT", "${NOMAD_PORT_web}"]
            }

            env {
                PORT = "${NOMAD_PORT_web}"
            }

            resources {
                cpu    = 500 # MHz
                memory = 256 # MB
                network {
                mbits = 10
                port "web" {}
                }
            }
        }
    }
}