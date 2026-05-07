# Deployment Guide

## 1. Web App (Next.js)

### Hosting: Vercel
```
vercel --prod
```

**Environment variables (.env.local):**
```env
NEXT_PUBLIC_SUPABASE_URL=...
NEXT_PUBLIC_SUPABASE_ANON_KEY=...
SUPABASE_SERVICE_ROLE_KEY=...
NEXTAUTH_SECRET=...
NEXTAUTH_URL=https://utilityapp.com
GOOGLE_CLIENT_ID=...
GOOGLE_CLIENT_SECRET=...
STRIPE_SECRET_KEY=...
STRIPE_WEBHOOK_SECRET=...
OPENAI_API_KEY=...
CLOUDFLARE_R2_ACCESS_KEY=...
CLOUDFLARE_R2_SECRET_KEY=...
CLOUDFLARE_R2_BUCKET=...
NEXT_PUBLIC_CLOUDFLARE_R2_PUBLIC_URL=...
```

### Domain + DNS
- Domain: utilityapp.com
- CNAME → cname.vercel-dns.com

---

## 2. Mobile App (Flutter)

### Build
```bash
# iOS
flutter build ios --release

# Android
flutter build appbundle --release
```

### Deployment
- **iOS:** App Store Connect (Apple Developer $99/năm)
- **Android:** Google Play Console ($25 một lần)

### CI/CD: Codemagic
```
codemagic.yaml workflow:
  - Build iOS (ipa) + Android (aab)
  - Run tests
  - Upload to TestFlight / Internal Testing
  - Deploy to App Store / Play Store
```

---

## 3. Backend Services

### Cloud Run (Server-side processing)
```yaml
# cloudbuild.yaml
steps:
  - name: 'gcr.io/cloud-builders/docker'
    args: ['build', '-t', 'gcr.io/$PROJECT_ID/processor', '.']
  - name: 'gcr.io/cloud-builders/docker'
    args: ['push', 'gcr.io/$PROJECT_ID/processor']
  - name: 'gcr.io/google.com/cloudsdktool/cloud-sdk'
    entrypoint: gcloud
    args:
      - 'run'
      - 'deploy'
      - 'processor'
      - '--image=gcr.io/$PROJECT_ID/processor'
      - '--region=asia-southeast1'
      - '--memory=2Gi'
      - '--cpu=2'
      - '--timeout=600'
      - '--min-instances=0'
      - '--max-instances=10'
      - '--concurrency=4'
```

### Stripe Webhook
```bash
stripe listen --forward-to localhost:3000/api/stripe/webhook
stripe trigger checkout.session.completed
```

---

## 4. File Storage (Cloudflare R2)

```bash
# Setup
r2 admin bucket create utilityapp-uploads
r2 admin bucket create utilityapp-processed

# Lifecycle policy
r2 admin bucket set-lifecycle utilityapp-uploads \
  --rule '{"id": "temp-24h", "condition": {"prefix": "temp/"}, "expiration": {"days": 1}}'
r2 admin bucket set-lifecycle utilityapp-uploads \
  --rule '{"id": "uploads-7d", "expiration": {"days": 7}}'
r2 admin bucket set-lifecycle utilityapp-processed \
  --rule '{"id": "processed-7d", "expiration": {"days": 7}}'
```

---

## 5. Monitoring

| Tool | Mục đích |
|------|----------|
| Vercel Analytics | Web performance, errors |
| Sentry | Error tracking (web + mobile) |
| Firebase Crashlytics | Mobile crash reports |
| PostHog | User analytics, funnels |
| Uptime Robot | API uptime monitoring |

---

## 6. Initial Setup Checklist

- [ ] Domain + Vercel deployment
- [ ] Supabase project + schema migration
- [ ] Cloudflare R2 bucket setup
- [ ] Firebase project (Auth + Firestore + Analytics)
- [ ] Stripe account + products
- [ ] OpenAI / Replicate API keys
- [ ] Google OAuth (web + mobile)
- [ ] Codemagic CI setup
- [ ] Sentry + PostHog
- [ ] SSL certificate (Vercel auto)
- [ ] DNS records
- [ ] Landing page SEO (meta tags, sitemap)

---

## 🔗 Cross-references

- [📊 Plan & Status](00_Plan_and_Status.md) — Overall plan, task tracker, progress
- [🏗️ Tổng quan kiến trúc](01_Overall_Architecture.md) — Tech stack, data flow
- [🔌 API Backend Spec](07_API_Backend_Spec.md) — API endpoints
- [🗄️ Database Schema](08_Database_Schema.md) — Tables & collections
- [📱 Mobile App Spec (Flutter)](09_Mobile_App_Spec.md) — Mobile structure
- [💰 Monetization Strategy](11_Monetization_Strategy.md) — 9 models kiếm tiền
