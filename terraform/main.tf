provider "google" {
  credentials = file("path/to/gcp_credentials.json")
  project     = var.project_id
  region      = var.region
}

resource "google_container_cluster" "cluster" {
  name     = "my-cluster"
  location = var.region

  initial_node_count = 1

  # Add any additional cluster configurations as needed
}

resource "kubernetes_namespace" "app_namespace" {
  metadata {
    name = "my-namespace"
  }
}

resource "kubernetes_deployment" "app_deployment" {
  metadata {
    name      = "my-deployment"
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "my-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "my-app"
        }
      }

      spec {
        container {
          name  = "my-app-container"
          image = "<your-docker-image-tag>"
          # Add any additional container configurations as needed
        }
      }
    }
  }
}

resource "kubernetes_service" "app_service" {
  metadata {
    name      = "my-service"
    namespace = kubernetes_namespace.app_namespace.metadata[0].name
  }

  spec {
    selector = {
      app = "my-app"
    }

    type = "LoadBalancer"

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 8080
    }
  }
}
