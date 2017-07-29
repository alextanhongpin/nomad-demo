job "golang" {
    datacenters = ["dc1"]
    type = "batch"
    
    group "goweb" {
        task "server" {
            driver = "raw_exec"

            config {
                command = "/Users/alextanhongpin/Documents/nomad/nomad-demo/nomad-demo"
            }
            resources {
                cpu    = 500 # 500 MHz
                memory = 256 # 256MB
                network {
                mbits = 10
                port "db" {}
                }
            }
        }
    }
}