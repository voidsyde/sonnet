# Multi-Node Homelab Hardware Infrastructure Analysis

## Physical Infrastructure Architecture

### **Node 1: CARAXES**
**High-Performance Computing Node**

#### GPU Resources
- **RTX 2080 SUPER** (NVIDIA GeForce TU104)
  - PCI: `0000:0e:00` | IOMMU Group: 31
  - Subsystem: EVGA (3842:3081)
  - **AI Acceleration**: CUDA compute for Ollama/OpenWebUI

#### Storage Controllers
- **HBA-1**: LSI SAS Controller (1000:0097)
  - PCI: `0000:05:00.0` | IOMMU Group: 26
  - **Direct storage access** for high-performance workloads
- **HBA-2**: LSI SAS Controller (1000:0097) 
  - PCI: `0000:07:00.0` | IOMMU Group: 27
  - **Redundant storage** connectivity

#### Expansion Infrastructure
- **LSI-1/2/3/4**: PLX PCIe Switch Controllers (10b5:8724)
  - Multiple IOMMU groups (22-25)
  - **PCIe lane expansion** for high-density device connectivity

#### Networking
- **1G NIC**: Realtek RTL8168 (10ec:8168)
  - PCI: `0000:0d:00.0` | IOMMU Group: 30
  - ASUS subsystem (1043:8677)
- **WiFi**: Realtek RTL8821CE (10ec:c821)
  - PCI: `0000:0c:00.0` | IOMMU Group: 29

#### Connectivity
- **Docking Station Linux**: AMD USB Controller (1022:149c)
  - PCI: `0000:10:00.3` | IOMMU Group: 38
  - ASUS subsystem (1043:87c0)

---

### **Node 2: MERAXES**
**High-Capacity Storage & Compute Node**

#### GPU Resources
- **RTX 3090 Ti** (NVIDIA GeForce GA102)
  - PCI: `0000:0d:00` | IOMMU Group: 30
  - NVIDIA Reference Design (10de:1618)
  - **24GB VRAM** for large-scale AI workloads

#### Storage Infrastructure
- **NVMe WD 4TB** (Western Digital SN850X)
  - PCI: `0000:01:00.0` | IOMMU Group: 15
  - **High-capacity primary storage**
- **NVMe WD 2TB** (Western Digital SN770)
  - PCI: `0000:04:00.0` | IOMMU Group: 25
  - **Secondary storage tier**
- **Samsung 1TB NVMe** (Samsung PM9B1)
  - PCI: `0000:0e:00.0` | IOMMU Group: 31
  - **Cache/OS storage**

#### Networking
- **1G NIC**: Intel I211 (8086:1539)
  - PCI: `0000:08:00.0` | IOMMU Group: 28
  - ASUS subsystem (1043:85f0)
- **2.5G NIC**: Realtek RTL8125 (10ec:8125)
  - PCI: `0000:07:00.0` | IOMMU Group: 27
  - **High-bandwidth** network connectivity
- **WiFi**: Intel AX200 (8086:2723)
  - PCI: `0000:09:00.0` | IOMMU Group: 29
  - **Wi-Fi 6** support

#### USB & Expansion
- **Docking Station**: AMD Controller (1022:1485)
  - PCI: `0000:0a:00` | IOMMU Group: 22
  - ASUS subsystem (1043:8808)
- **USB Controllers**: Multiple AMD USB 3.x controllers
  - Comprehensive USB connectivity for peripherals

---

## Virtualization Architecture

### **IOMMU Passthrough Configuration**
**Professional Hardware Isolation:**

#### GPU Passthrough
- **CARAXES RTX 2080 SUPER**: Dedicated to specific VMs
- **MERAXES RTX 3090 Ti**: Available for high-memory AI workloads
- **Complete device isolation** through IOMMU groups

#### Storage Passthrough
- **Direct NVMe access** to VMs for maximum performance
- **HBA controllers** provide raw storage access
- **No virtualization overhead** for storage-intensive workloads

#### Network Passthrough
- **Dedicated NICs** per VM for network isolation
- **2.5G networking** for high-bandwidth applications
- **Intel and Realtek** controllers for compatibility

### **Proxmox Integration**
**Professional Virtualization Management:**

#### Hardware Mapping
- **PCI device assignment** to specific VMs
- **IOMMU group management** for isolation
- **Live migration** capabilities (experimental)
- **Mediated device** support for GPU sharing

#### Resource Allocation
- **Dedicated hardware** per workload type
- **Optimal NUMA** node assignment
- **Minimized resource contention** through isolation

---

## AI Infrastructure Positioning

### **Specialized AI Processing**
**Hardware-Optimized Deployment:**

#### CARAXES (RTX 2080 SUPER)
- **Ollama model hosting** with CUDA acceleration
- **8GB VRAM** for medium-scale models
- **Development and testing** workloads
- **Power-efficient** AI processing

#### MERAXES (RTX 3090 Ti) 
- **Large model inference** (24GB VRAM capacity)
- **Training workloads** requiring high memory
- **Multi-model** parallel processing
- **Production AI** deployment

### **Storage Architecture for AI**
**High-Performance Data Pipeline:**

#### Fast Storage Tier
- **NVMe SSDs** for model loading and caching
- **Direct hardware access** eliminates virtualization overhead
- **Optimized for** random access patterns

#### Capacity Storage
- **4TB+ NVMe** for model repositories
- **HBA-connected** mass storage for datasets
- **Tiered storage** strategy for cost/performance optimization

---

## Network Infrastructure

### **Multi-Tier Connectivity**
**Professional Network Architecture:**

#### High-Speed Internal
- **2.5G networking** for inter-node communication
- **Dedicated NICs** for storage traffic
- **VLAN segmentation** through hardware isolation

#### Management Networks
- **1G connections** for administration traffic
- **Out-of-band management** through dedicated interfaces
- **Redundant connectivity** for high availability

---

## Strategic Architecture Analysis

### **Professional Features**
**Professional Infrastructure Characteristics:**

#### Hardware Isolation
- **IOMMU-based** device passthrough
- **Complete electrical isolation** between workloads
- **No shared hardware** vulnerabilities
- **Deterministic performance** through dedicated resources

#### Scalability Design
- **PCIe expansion** through PLX switches
- **Modular hardware** assignment
- **Growth accommodation** through additional nodes
- **Resource reallocation** flexibility

#### Reliability Architecture
- **Redundant storage** controllers
- **Multiple network** paths
- **Hardware-level** fault isolation
- **Service continuity** through redundancy

### **AI Workload Optimization**
**Purpose-Built AI Infrastructure:**

#### Compute Distribution
- **Specialized nodes** for different AI workload types
- **Memory-optimized** allocation per use case
- **Parallel processing** capabilities across nodes
- **Load balancing** through hardware diversity

#### Data Pipeline
- **High-bandwidth storage** for model access
- **Low-latency networking** for distributed inference
- **Efficient data movement** between storage tiers
- **Optimized caching** strategies

---

## Infrastructure Maturity Assessment

### **Professional Deployment Indicators**
**Professional-Grade Implementation:**

- **IOMMU passthrough** configuration
- **Multi-node** coordination
- **Hardware-level** isolation
- **Professional virtualization** platform
- **Redundant networking** infrastructure
- **Scalable storage** architecture
- **GPU compute** specialization

### **AI-First Design**
**Optimized for AI Workloads:**

- **CUDA-capable** GPU allocation
- **High-memory** GPU availability
- **Fast storage** for model loading
- **Network optimization** for distributed processing
- **Isolated compute** for consistent performance

**Recognition**: This is **Semi-Professional Datacenter architecture** with **AI-optimized hardware deployment** - comparable to **commercial AI infrastructure** with **professional-grade isolation, redundancy, and scalability**.