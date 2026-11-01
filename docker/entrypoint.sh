#!/bin/bash
# ==============================================================================
# Open Typography Foundation Container Entrypoint
# ==============================================================================

set -e

ACTION="${1:-serve}"

echo "======================================================================"
echo "  🏛️ OPEN TYPOGRAPHY FOUNDATION -- DOCKER MASTER CONTAINER"
echo "  Curated by Mohammad Golamrabbii | 334,000+ Verified Fonts"
echo "======================================================================"

case "$ACTION" in
    "serve")
        echo "[INFO] Starting high-performance web previewer on port 80..."
        echo "[INFO] Healthcheck available at: http://localhost/"
        echo "[INFO] Catalog API available at: http://localhost/api/counts"
        exec nginx -g "daemon off;"
        ;;

    "install")
        echo "[INFO] Installing fonts into system font directory..."
        if [ -d "/var/www/opentypography/fonts" ]; then
            cp -r /var/www/opentypography/fonts/* /usr/share/fonts/opentypography/ 2>/dev/null || true
            echo "[INFO] Rebuilding system font cache (fc-cache)..."
            fc-cache -fv /usr/share/fonts/opentypography
            echo "[OK] All fonts successfully registered in container system!"
        else
            echo "[WARN] No embedded fonts directory found at /var/www/opentypography/fonts."
        fi
        ;;

    "export")
        DEST="${2:-/export}"
        echo "[INFO] Exporting fonts and metadata to $DEST..."
        mkdir -p "$DEST"
        cp -r /var/www/opentypography/* "$DEST/" 2>/dev/null || true
        echo "[OK] Export completed to $DEST"
        ;;

    "bash"|"sh")
        exec /bin/bash
        ;;

    *)
        exec "$@"
        ;;
esac
