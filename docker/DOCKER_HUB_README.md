# 🌐 Open Typography Foundation — Official Docker Image
### `golamrabbiii/open-fonts` • 500,000+ Verified Open-Source Typefaces across 100 Sovereign Vaults

[![Docker Image Version](https://img.shields.io/badge/Version-v5.0.0-blue.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/golamrabbiii/open-fonts)
[![Total Fonts](https://img.shields.io/badge/Total_Fonts-334,000%2B_Verified-gold.svg?style=for-the-badge)](#)
[![Sovereign Vaults](https://img.shields.io/badge/Sovereign_Vaults-100_Independent_Vaults-critical.svg?style=for-the-badge)](#)
[![License](https://img.shields.io/badge/License-100%25_Free_%26_Open_Source-success.svg?style=for-the-badge)](#)

---

## 🏛️ Overview
`golamrabbiii/open-fonts` is the official containerized distribution of the **Open Typography Foundation**, curated by **Mohammad Golamrabbii**. It packages the master documentation, live web interactive previewer, catalog APIs, and cross-platform installation tools for **500,337+ open-source fonts** across **100 sovereign script vaults**.

---

## 🚀 Quick Start

### 1. Run the Live Web Font Studio (Port 8080)
```bash
docker run -d \
  --name open-typography-studio \
  -p 8080:80 \
  --restart unless-stopped \
  golamrabbiii/open-fonts:latest
```
Visit `http://localhost:8080` to search, preview, and explore all 100 vaults offline.

### 2. Using Docker Compose
```yaml
services:
  open-fonts:
    image: golamrabbiii/open-fonts:latest
    container_name: open-typography-studio
    restart: unless-stopped
    ports:
      - "8080:80"
```
Run:
```bash
docker compose up -d
```

### 3. Export Fonts & Metadata to Host System
```bash
docker run --rm \
  -v $(pwd)/exported-fonts:/export \
  golamrabbiii/open-fonts:latest export
```

### 4. Direct Terminal CLI Installation (No Docker Required)
If you prefer direct installation into Linux, macOS, or Windows:
```bash
# Linux / macOS
curl -fsSL https://raw.githubusercontent.com/Open-Typography-Foundation/100-Sovereign-Fonts-Vaults/main/install.sh | bash

# Windows PowerShell
irm https://raw.githubusercontent.com/Open-Typography-Foundation/100-Sovereign-Fonts-Vaults/main/install.ps1 | iex
```

---

## 📊 Catalog REST API Endpoints
When the container is running:
- `GET /api/counts` — Complete JSON breakdown of all 100 sovereign vaults and real-time font tallies.
- `GET /font_browser.html` — Full responsive offline specimen browser.
- `GET /00_MASTER_INDEX.md` — Markdown ledger of all 100 sovereign vaults.

---

## 📜 License & Compliance
All fonts curated in this foundation are 100% free and open-source under:
- **SIL Open Font License 1.1 (OFL)**
- **Apache License 2.0**
- **GNU General Public License (GPL / DFSG)**

**Archival Architect & Foundation Lead:** [Mohammad Golamrabbii](https://linktr.ee/golamrabbii)  
**Foundation Headquarters:** [Open Typography Foundation](https://github.com/Open-Typography-Foundation)
