# ==============================================================================
# Open Typography Foundation — Master Font Distribution & Studio Container
# Curated by Mohammad Golamrabbii | 500,000+ Verified Open-Source Typefaces
# ==============================================================================

FROM nginx:alpine

LABEL maintainer="Mohammad Golamrabbii <https://linktr.ee/golamrabbii>" \
      org.opencontainers.image.title="Open Typography Foundation Master Hub" \
      org.opencontainers.image.description="Interactive Web Font Studio & Universal Font Distribution for 500,000+ Open-Source Fonts across 100 Sovereign Vaults" \
      org.opencontainers.image.version="5.0.0" \
      org.opencontainers.image.licenses="OFL-1.1, Apache-2.0, GPL" \
      org.opencontainers.image.url="https://github.com/Open-Typography-Foundation/100-Sovereign-Fonts-Vaults" \
      org.opencontainers.image.source="https://github.com/Open-Typography-Foundation/100-Sovereign-Fonts-Vaults"

# Install system dependencies: font tools, fontconfig, bash, curl, jq
RUN apk add --no-cache \
    fontconfig \
    freetype \
    bash \
    curl \
    jq \
    ca-certificates \
    tzdata

# Create font directories for system registration and volume export
RUN mkdir -p /usr/share/fonts/opentypography \
             /var/www/opentypography \
             /export \
             /scripts

# Set working directory
WORKDIR /var/www/opentypography

# Copy web hub files, index, and offline browser
COPY font_browser.html /var/www/opentypography/index.html
COPY font_browser.html /var/www/opentypography/font_browser.html
COPY vault_counts.json /var/www/opentypography/vault_counts.json
COPY 00_MASTER_INDEX.md /var/www/opentypography/00_MASTER_INDEX.md
COPY README.md /var/www/opentypography/README.md
COPY install.sh /var/www/opentypography/install.sh
COPY install.ps1 /var/www/opentypography/install.ps1

# Copy custom Nginx configuration
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

# Copy entrypoint script
COPY docker/entrypoint.sh /scripts/entrypoint.sh
RUN chmod +x /scripts/entrypoint.sh

# Expose HTTP port
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

ENTRYPOINT ["/scripts/entrypoint.sh"]
CMD ["serve"]
