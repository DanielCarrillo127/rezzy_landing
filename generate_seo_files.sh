#!/bin/bash

# Configura tu dominio aquí (con https:// incluido)
DOMAIN="https://..."

# Ruta donde están tus archivos HTML
WEB_ROOT="/var/www/html/landing"

# Fecha actual en formato ISO
TODAY=$(date +"%Y-%m-%d")

echo "Generando robots.txt..."
cat > "$WEB_ROOT/robots.txt" <<EOF
User-agent: *
Allow: /
Sitemap: $DOMAIN/sitemap.xml
EOF

echo "Generando sitemap.xml..."
cat > "$WEB_ROOT/sitemap.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>$DOMAIN/</loc>
    <lastmod>$TODAY</lastmod>
    <changefreq>monthly</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>$DOMAIN/contacto</loc>
    <lastmod>$TODAY</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
  <url>
    <loc>$DOMAIN/contacto-empresa</loc>
    <lastmod>$TODAY</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
</urlset>
EOF

echo "Archivos SEO generados en $WEB_ROOT"
