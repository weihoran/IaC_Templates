# Istio Terraform Module

This Terraform module deploys and configures Istio on a Kubernetes cluster. It follows best practices for simplicity, usability, scalability, and extensibility.

## Features

- **Core Istio Installation**: Deploys Istio base components, control plane (istiod), and ingress gateway.
- **Service Mesh Configurations**: Sets up Destination Rules, Virtual Services, Gateways, Authorization Policies, and Telemetry.
- **Scalability Support**: Implements Horizontal Pod Autoscalers (HPA) for Istio components and applications.
- **Layered Configuration**: Provides default settings with options for advanced configurations.
- **Modularity**: Utilizes sub-modules for telemetry and advanced configurations, keeping the main module clean.
- **Platform Portability**: Abstracts Kubernetes cluster access details, allowing deployment on any Kubernetes cluster.

## Module Structure

