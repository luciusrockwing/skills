---
name: server-healthcheck
description: Run a comprehensive server healthcheck — CPU, memory, disk, swap, network, DNS, systemd services, process health, zombie checks, and custom service status (FNS, Pi-hole, Tailscale). Presents results in a clean pass/fail table with gotchas for continuous improvement.
---

# Server Healthcheck

Run all checks, report pass/fail per category, end with a summary table. Always include the **Gotchas** section at the bottom — append any new failure patterns or environment-specific quirks encountered.

## Order of checks

Run these sequentially. Stop for input only if a critical failure is found (disk >90%, OOM, filesystem errors).

### 1. Uptime
- `uptime` — record load averages (1, 5, 15 min)
- Note days since last reboot — healthy if >1d (warn if <1h)

### 2. CPU
- `cat /proc/loadavg` — correlate with core count
- `nproc` for core count
- Pass if load < 2 core count

### 3. Memory
- `free -h` — total, used, available, swap usage
- Pass if available > 20% of total
- Pass if swap used < 50% of total swap

### 4. Disk
- `df -h /` and `df -h` for all mounts
- Pass if < 80% on root, < 85% on any data mount
- If available, also check inodes: `df -i /`

### 5. Systemd services
- `systemctl --failed` — count and list any failed units
- Pass if 0 failed units
- If any are FNS, Pi-hole, Tailscale, Cloudflared — flag separately

### 6. Custom services (this server specific)
- **FNS**: `systemctl is-active fast-note-sync.service`
- **Pi-hole**: `pihole status` — check FTL listening on port 53, IPv4+IPv6
- **Tailscale**: `ip -br addr show tailscale0` — confirm IP present
- **Cloudflared tunnel**: `pgrep -a cloudflared` — confirm running
- **jcode**: `pgrep -a jcode` — confirm serving

### 7. Network
- `ip -br addr` — list interfaces with IPs
- `nslookup google.com` — verify DNS resolution
- `ping -c1 8.8.8.8` — verify internet connectivity

### 8. Process health
- `ps aux --sort=-%mem | head -8` — top 5 memory consumers
- `ps aux --sort=-%cpu | head -8` — top 5 CPU consumers
- Count zombie procs: `ps aux | awk '{print $8}' | grep -c 'Z'`
  - Pass if < 5 zombies

### 9. Filesystem
- `findmnt /` — verify root filesystem type and options (rw, no errors)
- `cat /sys/class/thermal/thermal_zone*/temp 2>/dev/null` — temps if available

### 10. Swap
- `swapon --show` — confirm swap device/file present, note used amount

## Output format

### Summary table

| Check | Status | Detail |
|---|---|---|
| Uptime | ✅ / ⚠️ / ❌ | ... |
| CPU Load | ✅ / ⚠️ / ❌ | ... |
| Memory | ✅ / ⚠️ / ❌ | ... |
| Disk | ✅ / ⚠️ / ❌ | ... |
| Systemd | ✅ / ⚠️ / ❌ | ... |
| FNS Service | ✅ / ⚠️ / ❌ | ... |
| Pi-hole DNS | ✅ / ⚠️ / ❌ | ... |
| Tailscale | ✅ / ⚠️ / ❌ | ... |
| Cloudflared | ✅ / ⚠️ / ❌ | ... |
| jcode | ✅ / ⚠️ / ❌ | ... |
| Network | ✅ / ⚠️ / ❌ | ... |
| Zombie Procs | ✅ / ⚠️ / ❌ | ... |
| Filesystem | ✅ / ⚠️ / ❌ | ... |
| Swap | ✅ / ⚠️ / ❌ | ... |

Status: ✅ = normal, ⚠️ = warn (degraded but not down), ❌ = critical (needs attention)

### Gotchas (append here)

```yaml
observed_at: "YYYY-MM-DD HH:MM"
environment: "e.g. Ubuntu Minimal on GCP e2-micro"
gotchas:
  - issue: "..."
    cause: "..."
    fix: "..."
```

## Gotchas section

The last thing the skill outputs is a **Gotchas** block. Start with the existing known gotchas below. If this run discovers something unexpected, append a new `.gotchas[]` entry.

### Known gotchas

```yaml
- issue: "Thermal sensors not available"
  cause: "GCP VMs (and many VPS) don't expose /sys/class/thermal/thermal_zone*"
  fix: "Silently skip thermal check when the path doesn't exist. Not a problem."
- issue: "Zombie process count >0 alarms on first run"
  cause: "A couple zombie procs are normal on Linux — the parent will reap them via wait(). Only worry if count >50."
  fix: "Set alert threshold to 5+ zombies instead of 0."
- issue: "Pi-hole status command exits non-zero on query-only distributions ('pihole status' not available)"
  cause: "Some Pi-hole installs omit the interactive status command."
  fix: "Fall back to `dig @127.0.0.1 google.com` or check port 53 with `ss -tlnp | grep :53`."
- issue: "Systemd services may show 'loaded but inactive' as not-failed, which can mask a stopped service"
  cause: "systemctl --failed only shows units in 'failed' state, not manually stopped ones."
  fix: "Explicitly check specific services by name with systemctl is-active."
```

## Tools required

Bash, Read, Grep (for reading service status files if needed).
