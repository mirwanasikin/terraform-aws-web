# Terraform AWS Infrastructure (Modular Setup)

## 📦 Overview

This repository contains a modular Terraform setup for provisioning a production-style infrastructure on AWS.

The architecture is designed to be:

- Scalable
- Maintainable
- Environment-separated (dev & prod)
- Easy to extend

---

## 🧠 Architecture Flow

```
User → CloudFront →
  ├── /        → S3 (Frontend - static files)
  └── /api/*   → ALB → EC2 → Database
```

### Summary

- **CloudFront** acts as CDN + entry point
- **S3** serves static frontend
- **ALB** routes traffic to backend
- **EC2** runs application logic
- **Database** stores persistent data
- **VPC** isolates networking

---

## 📁 Project Structure

```
.
├── environment/
│   ├── dev/
│   └── prod/
└── modules/
    ├── network/
    ├── security_group/
    ├── compute/
    ├── database/
    ├── load_balancer/
    ├── cloudfront/
    ├── frontend/
    └── role/
```

---

## 🚀 Getting Started

### 1. Choose Environment

Start from:

```
environment/dev/
```

or

```
environment/prod/
```

---

### 2. Initialize Terraform

```bash
terraform init
```

---

### 3. Plan Changes

```bash
terraform plan
```

---

### 4. Apply Infrastructure

```bash
terraform apply
```

---

## 🧩 Modules Explanation

| Module           | Description               |
| ---------------- | ------------------------- |
| `network`        | VPC, subnets, routing     |
| `security_group` | Firewall rules            |
| `compute`        | EC2 instances             |
| `database`       | Database resources        |
| `load_balancer`  | Application Load Balancer |
| `cloudfront`     | CDN and request routing   |
| `frontend`       | S3 static hosting         |
| `role`           | IAM roles and permissions |

---

## 🔍 How to Read This Repo (Important)

If you're new, follow this order:

1. `environment/dev/main.tf` → entry point (big picture)
2. `modules/network` → base infrastructure
3. `modules/compute` & `database`
4. `modules/load_balancer`
5. `modules/cloudfront`

Think in terms of **request flow**, not files.

---

## ⚠️ Notes

- This setup is **modular by design**, so expect multiple files.
- Some configurations may look verbose (especially CloudFront).
- Focus on **architecture flow**, not just Terraform syntax.

---

## 🧪 Philosophy

This project follows:

- Infrastructure as Code (IaC)
- Separation of concerns
- Reusable modules
- Real-world architecture patterns

---

## 📌 Future Improvements (Optional Ideas)

- Migrate to CloudFront cache & origin request policies
- Add CI/CD (GitHub Actions)
- Add monitoring (CloudWatch, logs, alerts)
- Improve security (WAF, stricter SG rules)

---

## 💬 Final Note

This repo is not optimized for beginners by default.

However, once you understand the flow:

```
Network → Compute → Load Balancer → CloudFront
```

Everything becomes much easier to reason about.

---

Happy hacking 🚀
