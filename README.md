# 🐚 pwsh-slim

> Minimal PowerShell container image based on Debian stable-slim

[![PowerShell](https://img.shields.io/github/v/release/PowerShell/PowerShell?label=PowerShell&logo=powershell&logoColor=white&color=5391FE)](https://github.com/PowerShell/PowerShell)
[![Debian](https://img.shields.io/badge/Debian-stable--slim-A81D33?logo=debian)](https://hub.docker.com/_/debian)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

### 📦 Latest Build

[![Version](https://img.shields.io/badge/version-7.5.4--20260125--34-blue)](https://quay.io/repository/janrk/pwsh-slim?tab=tags)
[![Version with Date](https://img.shields.io/badge/version-7.5.4-blue)](https://quay.io/repository/janrk/pwsh-slim?tab=tags)
[![Build Date](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fquay.io%2Fapi%2Fv1%2Frepository%2Fjanrk%2Fpwsh-slim&query=%24.tags.latest.last_modified&label=build%20date&color=blue)](https://quay.io/repository/janrk/pwsh-slim)
[![Image Size](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fquay.io%2Fapi%2Fv1%2Frepository%2Fjanrk%2Fpwsh-slim&query=%24.tags.latest.size&label=size&color=green)](https://quay.io/repository/janrk/pwsh-slim)

---

## 🚀 Quick Start

```bash
# Pull the image
docker pull quay.io/janrk/pwsh-slim:latest

# Run interactive shell
docker run -it quay.io/janrk/pwsh-slim

# Run a script
docker run -v $(pwd):/scripts quay.io/janrk/pwsh-slim pwsh -File /scripts/myscript.ps1
```

## 🏷️ Available Tags

| Tag | Description |
|-----|-------------|
| `latest` | Latest PowerShell version |
| `7` | Major version (rolling) |
| `7.5` | Minor version (rolling) |
| `7.5.4` | Specific version |
| `7.5.4-YYYYMMDD-N` | Version with build date and run number |

## 📋 Features

- ✅ Minimal footprint based on Debian stable-slim
- ✅ Latest PowerShell version auto-updated
- ✅ Multiple tag formats for version pinning
- ✅ Automated weekly builds
