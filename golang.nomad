job "golang" {
    datacenters = ["dc1"]
    type = "batch"
    
    group "goweb" {
        task "server" {
            driver = "raw_exec"

            config {
                # Path must be absolute, use pwd to get the current path
                # command = "./nomad-demo"
                command = "/Users/alextanhongpin/Documents/nomad/nomad-demo/nomad-demo"
            }
            resources {
                cpu    = 500 # MHz
                memory = 256 # MB
                network {
                mbits = 10
                port "db" {}
                }
            }
        }
    }
}