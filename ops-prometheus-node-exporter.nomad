job "prometheus-node-exporter" {
  datacenters = ["[[env "DC"]]"]
  type = "system"
  group "prometheus-node-exporter" {
    task "prometheus-node-exporter" {
      artifact {
        source = "https://github.com/prometheus/node_exporter/releases/download/v[[.prometheus-node-exporter.version]]/node_exporter-[[.prometheus-node-exporter.version]].linux-amd64.tar.gz"
      }
      driver = "raw_exec"
      config {
        command = "node_exporter-[[.prometheus-node-exporter.version]].linux-amd64/node_exporter"
      }
      resources {
        cpu    = 50
        memory = [[.prometheus-node-exporter.ram]]
        network {
          mbits = 10
          port "healthcheck" { static = [[.prometheus-node-exporter.port]] }
        }
      }
      service {
        name = "prometheus-node-exporter"
        tags = ["[[.prometheus-node-exporter.version]]"]
        port = "healthcheck"
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
