<h1 align="center">Terraform AWS Infrastructure 🏗️</h1>

<div align="center">
  <img src="https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform"/>
  <img src="https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazonwebservices&logoColor=white" alt="AWS"/>
  <img src="https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white" alt="GitHub Actions"/>
  <img src="https://img.shields.io/github/last-commit/mirwanasikin/terraform-aws-web?style=for-the-badge&logo=github&labelColor=black&color=blue" alt="Last Commit"/>
  <img src="https://img.shields.io/github/license/mirwanasikin/terraform-aws-web?style=for-the-badge" alt="License"/>
</div>

<br/>

> [!NOTE]
> Modular Terraform setup for provisioning production-style AWS infrastructure. Designed to be scalable, maintainable, and environment-separated.

---

## 🧠 Architecture Flow

```
User → CloudFront →
├── /*      → S3 (Frontend - React static files)
└── /api/*  → ALB → EC2 → RDS
```

| Layer         | Service    | Role                       |
| ------------- | ---------- | -------------------------- |
| CDN           | CloudFront | Entry point + caching      |
| Frontend      | S3         | Static file hosting        |
| Load Balancer | ALB        | Traffic routing to backend |
| Compute       | EC2        | Application logic (Flask)  |
| Database      | RDS        | Persistent storage         |
| Networking    | VPC        | Isolation + security       |

---

## 📁 Project Structure

```
.
├── .github/workflows/   # CI/CD pipelines
├── terraform/
│   ├── environment/
│   │   ├── dev/
│   │   └── prod/
│   └── modules/
│       ├── network/
│       ├── security_group/
│       ├── compute/
│       ├── database/
│       ├── load_balancer/
│       ├── cloudfront/
│       ├── frontend/
│       └── role/
```

---

## 🚀 Getting Started

> [!IMPORTANT]
> Make sure you have AWS credentials configured and Terraform installed before proceeding.

```bash
# 1. Choose your environment
cd terraform/environment/dev

# 2. Initialize
terraform init

# 3. Preview changes
terraform plan

# 4. Apply
terraform apply
```

---

## 🧩 Modules

| Module           | Description             |
| ---------------- | ----------------------- |
| `network`        | VPC, subnets, routing   |
| `security_group` | Firewall rules          |
| `compute`        | EC2 instances           |
| `database`       | RDS resources           |
| `load_balancer`  | ALB setup               |
| `cloudfront`     | CDN + request routing   |
| `frontend`       | S3 static hosting       |
| `role`           | IAM roles & permissions |

> [!TIP]
> If you're new, read in this order: `environment/dev/main.tf` → `modules/network` → `modules/compute` → `modules/load_balancer` → `modules/cloudfront`. Think in terms of **request flow**, not files.

---

## 📌 Roadmap

- [x] Modular Terraform structure
- [x] Dev & prod environment separation
- [x] GitHub Actions CI/CD pipeline
- [ ] CloudWatch monitoring & alerting
- [ ] WAF + stricter security group rules
- [ ] Prod environment
