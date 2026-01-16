# Welcome to Shortly URL

## 🚀 Overview

A serverless, URL shortener built on AWS with Terraform. Includes API, infra, and optional frontend.

## ✨ Features

- 🔹 Serverless Architecture – Powered by Lambda, API Gateway, DynamoDB, and S3.
- 🔹 Infrastructure-as-Code – Entire stack deployed via Terraform.
- 🔹 Automatic Redirects – Short links instantly forward to their long URLs.
- 🔹 CI/CD Ready – GitHub Actions workflow for plan/apply/destroy.

## 🛠 Usage

- 🚀 Create a Short URL

  `POST /shorten { "url": "https://example.com" }`

  Response: `{ "short_url": "https://api-id.execute-api.region.amazonaws.com/abc12" }`

- 🚀 `GET /abc12` automatically redirects to the long URL.
