#!/bin/sh
set -eu

# Panel base path (applied before the panel starts).
/app/x-ui setting -webBasePath /xp9k3panel/ >/dev/null 2>&1 || true

# Fixed panel login, applied on every container start.
# Railway variables PANEL_USER / PANEL_PASS override these defaults.
PANEL_USER="${PANEL_USER:-AXIS}"
PANEL_PASS="${PANEL_PASS:-e456t530}"
/app/x-ui setting -username "$PANEL_USER" -password "$PANEL_PASS" >/dev/null 2>&1 || true

# Hand over to 3x-ui's own entrypoint (becomes PID 1).
exec /app/DockerEntrypoint.sh
