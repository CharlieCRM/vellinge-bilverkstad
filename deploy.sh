#!/usr/bin/env bash
# Deploy Vellinge Bilverkstad-mockup till Cloudflare Pages.
#
# Förutsätter att wrangler är installerat och CLOUDFLARE_API_TOKEN är satt
# (eller att du kör wrangler login i en interaktiv terminal först).
#
# Användning:
#   1. Sätt token: export CLOUDFLARE_API_TOKEN="..."
#      (eller kör: wrangler login)
#   2. Kör: ./deploy.sh
#
# Token: https://dash.cloudflare.com/profile/api-tokens
# Behörighet: Cloudflare Pages: Edit
set -euo pipefail

cd "$(dirname "$0")"

PROJECT="vellinge-bilverkstad"
BRANCH="main"

if [ -z "${CLOUDFLARE_API_TOKEN:-}" ] && ! wrangler whoami >/dev/null 2>&1; then
  echo "✘ Varken CLOUDFLARE_API_TOKEN eller wrangler-login hittad."
  echo "  Kör: export CLOUDFLARE_API_TOKEN=..."
  echo "  Eller: wrangler login"
  exit 1
fi

echo "→ Skapar Pages-projekt '$PROJECT' om det inte finns..."
wrangler pages project create "$PROJECT" --production-branch="$BRANCH" 2>/dev/null || true

echo "→ Deployar till '$PROJECT' från branch '$BRANCH'..."
wrangler pages deploy . \
  --project-name="$PROJECT" \
  --branch="$BRANCH" \
  --commit-dirty=true

echo ""
echo "✓ Deploy klar."
echo "  Preview URL: https://$BRANCH.$PROJECT.pages.dev"
echo "  Custom domain (sätt manuellt i dashboard): vellinge-bilverkstad.silverpoint.se"
