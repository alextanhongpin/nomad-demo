job "golang" {
    datacenters = ["dc1"]

    group "goweb" {
        task "server" {
            driver = "raw_exec"

            config {
                command = "/bin/nomad-demo"
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