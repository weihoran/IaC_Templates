# Istio Terraform Module

This documentation provides an overview of the **Istio Terraform Module**, detailing the required and optional input variables, outputs, dependencies, and the resources managed by the module. This module automates the deployment and configuration of Istio on a Kubernetes cluster, adhering to best practices for scalability, flexibility, and maintainability.

## Table of Contents

- [Required Input Variables](#required-input-variables)
- [Optional Input Variables](#optional-input-variables)
  - [Core Configurations](#core-configurations)
  - [Scalability Configurations](#scalability-configurations)
  - [Advanced Configurations](#advanced-configurations)
  - [Telemetry Configurations](#telemetry-configurations)
- [Outputs](#outputs)
- [Dependencies](#dependencies)
  - [Providers](#providers)
  - [Sub-Modules](#sub-modules)
- [Resources](#resources)
  - [Core Module Resources](#core-module-resources)
  - [Telemetry Sub-Module Resources](#telemetry-sub-module-resources)
  - [Advanced Configurations Sub-Module Resources](#advanced-configurations-sub-module-resources)
  - [Scalability Sub-Module Resources](#scalability-sub-module-resources)

---

## Required Input Variables

These variables must be provided for the module to function correctly.

| **Name**                          | **Description**                                       | **Type**      |
|-----------------------------------|-------------------------------------------------------|---------------|
| `kubernetes_host`                 | The hostname (URI) of the Kubernetes master            | `string`      |
| `kubernetes_cluster_ca_certificate` | PEM-encoded CA certificates for the Kubernetes cluster | `string`      |
| `kubernetes_client_certificate`   | PEM-encoded client certificate for TLS authentication | `string`      |
| `kubernetes_client_key`           | PEM-encoded client key for TLS authentication         | `string`      |
| `app_name`                        | Name of the application                                | `string`      |
| `app_namespace`                   | Namespace of the application                           | `string`      |
| `domain`                          | Domain for the application                             | `string`      |

---

## Optional Input Variables

These variables are optional and allow customization of the Istio deployment according to specific requirements.

### Core Configurations

| **Name**          | **Description**                       | **Type**  |
|-------------------|---------------------------------------|-----------|
| `istio_version`   | The version of Istio to install       | `string`  |
| `istio_namespace` | The namespace to install Istio into   | `string`  |
| `tls_crt`         | TLS certificate content               | `string`  |
| `tls_key`         | TLS private key content               | `string`  |

### Scalability Configurations

| **Name**                    | **Description**                                   | **Type**    |
|-----------------------------|---------------------------------------------------|-------------|
| `enable_autoscaling`        | Enable autoscaling for Istio components and apps   | `bool`      |
| `istiod_autoscaling`        | Autoscaling settings for `istiod`                  | `object`    |
| `ingressgateway_autoscaling`| Autoscaling settings for Istio ingressgateway      | `object`    |
| `custom_metrics_enabled`    | Enable custom metrics for autoscaling              | `bool`      |
| `custom_metrics`            | Custom metrics for autoscaling                     | `object`    |

### Advanced Configurations

| **Name**                     | **Description**                                      | **Type**       |
|------------------------------|------------------------------------------------------|----------------|
| `advanced_settings`          | Map of advanced settings for Istio                    | `any`          |
| `enable_circuit_breaking`    | Enable circuit breaking configurations               | `bool`         |
| `connection_pool_settings`   | Connection pool settings for circuit breaking        | `object`       |
| `enable_mtls`                | Enable mutual TLS in Gateway                         | `bool`         |
| `enable_authorization_policy`| Enable AuthorizationPolicy                           | `bool`         |
| `request_principals`         | Request principals for AuthorizationPolicy            | `list(string)` |

### Telemetry Configurations

| **Name**          | **Description**                  | **Type**  |
|-------------------|----------------------------------|-----------|
| `enable_telemetry`| Enable telemetry configurations  | `bool`    |

---

## Outputs

The module provides the following outputs for reference and integration purposes.

| **Name**            | **Description**                           |
|---------------------|-------------------------------------------|
| `istio_namespace`   | The namespace where Istio is installed    |
| `app_namespace`     | The namespace of the application          |

---

## Dependencies

### Providers

This module relies on the following Terraform providers to manage Kubernetes resources and deploy Helm charts:

- **Kubernetes Provider**: [hashicorp/kubernetes](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs)
- **Helm Provider**: [hashicorp/helm](https://registry.terraform.io/providers/hashicorp/helm/latest/docs)

Ensure these providers are included in your Terraform configuration.

### Sub-Modules

The module utilizes the following sub-modules to encapsulate specific functionalities:

- **Telemetry**: Configures telemetry settings for Istio.
- **Advanced Configurations**: Applies advanced Istio configurations such as mTLS and circuit breaking.
- **Scalability**: Implements scalability features like Horizontal Pod Autoscalers (HPA).

---

## Resources

The module manages a variety of Kubernetes resources and Helm releases to deploy and configure Istio effectively.

### Core Module Resources

- **Helm Releases**:
  - `istio_base`: Deploys Istio base components necessary for Istio installation.
  - `istiod`: Deploys the Istio control plane (`istiod`) with resource optimizations and advanced settings.
  - `istio_ingress`: Deploys the Istio ingress gateway with resource optimizations and advanced settings.

- **Kubernetes Resources**:
  - `kubernetes_namespace.app_namespace`: Creates the application namespace.
  - `kubernetes_secret.tls_secret`: Creates a TLS secret for mutual TLS if TLS data is provided.
  - `kubernetes_manifest.destination_rule`: Creates a `DestinationRule` for traffic management.
  - `kubernetes_manifest.virtual_service`: Creates a `VirtualService` with retries and timeouts.
  - `kubernetes_manifest.gateway`: Creates a `Gateway` with optional mutual TLS.
  - `kubernetes_manifest.authorization_policy`: Creates an `AuthorizationPolicy` for service authorization.

### Telemetry Sub-Module Resources

- **Kubernetes Resources**:
  - `kubernetes_manifest.telemetry`: Configures telemetry settings (optional).

### Advanced Configurations Sub-Module Resources

- **Kubernetes Resources**:
  - `kubernetes_manifest.destination_rule_circuit_breaking`: Configures circuit breaking policies (optional).
  - `kubernetes_manifest.gateway_mtls`: Configures Gateway with mTLS (optional).
  - `kubernetes_manifest.authorization_policy`: Configures Authorization Policies with custom principals (optional).

### Scalability Sub-Module Resources

- **Kubernetes Resources**:
  - `kubernetes_horizontal_pod_autoscaler_v2.istiod_hpa`: HPA for `istiod` based on CPU utilization (optional).
  - `kubernetes_horizontal_pod_autoscaler_v2.ingressgateway_hpa`: HPA for `istio-ingressgateway` based on CPU utilization (optional).
  - `kubernetes_horizontal_pod_autoscaler_v2.istiod_hpa_custom`: HPA for `istiod` based on custom metrics (optional).

---

## Conclusion

This documentation outlines the essential components and configurations of the Istio Terraform Module. By providing clear definitions of required and optional inputs, outputs, dependencies, and managed resources, it ensures that users can effectively deploy and customize Istio on their Kubernetes clusters. Adhering to best practices in modularity, scalability, and configurability, the module serves both basic and advanced deployment needs.

For further assistance or to report issues, please [open an issue](https://github.com/your-repo/issues) or contact the maintainers.

---
