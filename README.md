# Vellinge Bilverkstad

Statisk mockup/hemsida för **Vellinge Bilverkstad AB** – en lokal MECA-ansluten bilverkstad i Vellinge.

Sidan är byggd som en fristående statisk HTML-sida med Tailwind via CDN. Inga build-steg krävs.

## Innehåll

- `index.html` – hela sidan (header, hero, tjänster, recensioner, kontakt, footer, sticky mobile bar)
- `images/meca-logo.svg` – MECA:s officiella ordmärke (vit version, för mörk bakgrund)
- `images/meca-logo-dark.svg` – MECA:s officiella ordmärke (färgad version, för ljus bakgrund)

## Köra lokalt

Starta en enkel HTTP-server i projektroten:

```bash
python3 -m http.server 8080
```

Öppna sedan:

```
http://localhost:8080
```

Alternativ (om Python saknas):

```bash
npx serve .
# eller
php -S localhost:8080
```

## Deploy

Sidan är 100 % statisk och kan deployas direkt från projektroten på vilken statisk hosting som helst:

- **GitHub Pages** – slå på Pages från `main` branch och `/` (root). Ingen build command behövs.
- **Vercel** – importera repot, ingen build command, output = repo root.
- **Netlify** – importera repot, build command lämnas tomt, publish directory = `.`
- **Cloudflare Pages**, **S3 + CloudFront**, **Surge.sh** m.fl. fungerar likadant.

Inga environment variables, ingen backend, inga API-nycklar behövs.

## Tekniska noteringar

- **Tailwind CSS** laddas via CDN (`cdn.tailwindcss.com`). För produktion rekommenderas en byggd bundle, men för mockup-/demo-syfte är CDN:n fullt tillräcklig.
- **Bilder** – MECA-loggor ligger lokalt i `images/`. En hjälpbild (bil på lyft) laddas från Unsplash.
- **Karta** – OpenStreetMap-embed (ingen API-nyckel krävs).
- **Bokning** – alla "Boka"-knappar går direkt till verkstadens bokningsflöde i MECA.
- **Kontaktuppgifter** – Mejsegatan 8, 235 32 Vellinge · 040-22 10 14 · vellinge@mecabilservice.se
- **Öppettider** – Mån–fre 08:15–16:30 · Lör–sön stängt

## Licens

Mockup skapad för Vellinge Bilverkstad AB. MECA:s ordmärke används i enlighet med deras riktlinjer för anslutna verkstäder.
