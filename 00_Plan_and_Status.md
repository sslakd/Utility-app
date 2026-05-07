# Utility App — Overall Plan & Status

> **Last updated:** 2026-05-07
> **Repo:** github.com/sslakd/Utility-app
> **Team:** Dev A (Web — Next.js) | Dev B (Mobile — Flutter)

---

## 🎯 Tổng quan dự án

**Mục tiêu:** Xây dựng Utility Swiss Army Knife — 40+ tools xử lý [PDF](02_PDF_Tools_Spec.md), [Image](03_Image_Tools_Spec.md), [Video](04_Video_Tools_Spec.md), [File](05_File_Converters_Spec.md), [AI](06_AI_Tools_Spec.md) + [Gamification](12_Gamification_Strategy.md) — chạy trên [Web](01_Overall_Architecture.md#2-tech-stack) + [Mobile](09_Mobile_App_Spec.md).
**Timeline:** 6 tháng (05/2026 → 11/2026)
**Team size:** 2 devs (part-time)
**Monetization:** [9 models](11_Monetization_Strategy.md#1-recommended-models-độ-sinh-lời-cao--thấp) — Freemium, Credits, Ads, API, Enterprise...

---

## 📅 Gantt — 6 tháng

| Tháng | Dev A (Web) | Dev B (Mobile) | Milestone |
|-------|------------|----------------|-----------|
| **T1** (05/2026) | Setup [Next.js](10_Deployment_Guide.md#1-web-app-nextjs) + [Auth](01_Overall_Architecture.md#5-auth-strategy) + [3 PDF tools](02_PDF_Tools_Spec.md#1-merge-pdf) (Merge / Compress / JPG-to-PDF) + [MVP Gamification](12_Gamification_Strategy.md#-mvp-gamification-tháng-1-2--effort-thấp-impact-cao) (Progress Bar / Loading Tips / Share to Unlock / Streak) | Setup [Flutter](09_Mobile_App_Spec.md) + [Auth](01_Overall_Architecture.md#5-auth-strategy) + [3 PDF tools](02_PDF_Tools_Spec.md#1-merge-pdf) + [MVP Gamification](12_Gamification_Strategy.md#-mvp-gamification-tháng-1-2--effort-thấp-impact-cao) | **MVP: 3 tools + gamification** |
| **T2** (06/2026) | [PDF Suite](02_PDF_Tools_Spec.md) (10 tools) + [Image](03_Image_Tools_Spec.md) (3) + [XP/Level + Badges](12_Gamification_Strategy.md#5-xp--level-system) | [PDF Suite](02_PDF_Tools_Spec.md) (10 tools) + [Image](03_Image_Tools_Spec.md) (3) + [XP/Level + Badges](12_Gamification_Strategy.md#5-xp--level-system) | **10 PDF + Core Gamification** |
| **T3** (07/2026) | [Image Studio](03_Image_Tools_Spec.md) (15 tools) + [Quests + Mastery](12_Gamification_Strategy.md#7-dailyweekly-quests) | [Image Studio](03_Image_Tools_Spec.md) (15 tools) + [Quests + Mastery](12_Gamification_Strategy.md#7-dailyweekly-quests) | **Image hoàn chỉnh + Quests** |
| **T4** (08/2026) | [Video](04_Video_Tools_Spec.md) (7) + [File](05_File_Converters_Spec.md) (5) + [Mystery Box + Themes](12_Gamification_Strategy.md#9-mystery-box-loot-crate) | [Video](04_Video_Tools_Spec.md) (7) + [File](05_File_Converters_Spec.md) (5) + [Mystery Box + Themes](12_Gamification_Strategy.md#9-mystery-box-loot-crate) | **37 tools + Extended Gamification** |
| **T5** (09/2026) | [AI Tools](06_AI_Tools_Spec.md) + [Premium](11_Monetization_Strategy.md#a-freemium--subscription-khuyến-nghị-chính) + [Personal Stats](12_Gamification_Strategy.md#13-tool-stats--personal-analytics) | [Data Sync](09_Mobile_App_Spec.md#6-sync-web--mobile) + [Premium](11_Monetization_Strategy.md#a-freemium--subscription-khuyến-nghị-chính) + [Personal Stats](12_Gamification_Strategy.md#13-tool-stats--personal-analytics) | **40+ tools + Premium** |
| **T6** (10/2026) | SEO + [Leaderboard + Processing Pet](12_Gamification_Strategy.md#11-processing-pet) + Launch | App Store + [Leaderboard + Processing Pet](12_Gamification_Strategy.md#11-processing-pet) + Launch | **Go live + Advanced Gamification** |

---

## 📊 Chi tiết tools theo phase

### Phase 1 — [PDF Suite](02_PDF_Tools_Spec.md) (Tháng 5-6)
| Tool | Web | Mobile | Priority | Spec |
|------|-----|--------|----------|------|
| Merge PDF | ✅ | ✅ | 🔴 P0 | [Spec](02_PDF_Tools_Spec.md#1-merge-pdf) |
| Compress PDF | ✅ | ✅ | 🔴 P0 | [Spec](02_PDF_Tools_Spec.md#2-compress-pdf) |
| JPG to PDF | ✅ | ✅ | 🔴 P0 | [Spec](02_PDF_Tools_Spec.md#3-jpg-to-pdf) |
| Split PDF | ✅ | ✅ | 🟡 P1 | [Spec](02_PDF_Tools_Spec.md#6-split-pdf) |
| Rotate PDF | ✅ | ✅ | 🟡 P1 | [Spec](02_PDF_Tools_Spec.md#7-rotate-pdf) |
| Remove Password | ✅ | ✅ | 🟡 P1 | [Spec](02_PDF_Tools_Spec.md#8-remove-password-unlock-pdf) |
| Protect PDF | ✅ | ✅ | 🟡 P1 | [Spec](02_PDF_Tools_Spec.md#9-protect-pdf) |
| PDF to Word | ✅ | ✅ | 🟢 P2 | [Spec](02_PDF_Tools_Spec.md#4-pdf-to-word) |
| PDF Sign | ✅ | ✅ | 🟢 P2 | [Spec](02_PDF_Tools_Spec.md#10-pdf-sign) |
| Extract Text | ✅ | ✅ | 🟢 P2 | [Spec](02_PDF_Tools_Spec.md#11-extract-text-from-pdf) |
| Translate PDF | ✅ | ❌ | 🟢 P2 | [Spec](02_PDF_Tools_Spec.md#12-pdf-translator) |

### Phase 2 — [Image Studio](03_Image_Tools_Spec.md) (Tháng 7)
| Tool | Web | Mobile | Priority | Spec |
|------|-----|--------|----------|------|
| Resize | ✅ | ✅ | 🔴 P0 | [Spec](03_Image_Tools_Spec.md#1-resize-image) |
| Compress | ✅ | ✅ | 🔴 P0 | [Spec](03_Image_Tools_Spec.md#2-compress-image) |
| Crop | ✅ | ✅ | 🔴 P0 | [Spec](03_Image_Tools_Spec.md#3-crop-image) |
| BG Remover (AI) | ✅ | ✅ | 🔴 P0 | [Spec](03_Image_Tools_Spec.md#4-background-remover-ai) |
| Upscale (AI) | ✅ | ✅ | 🟡 P1 | [Spec](03_Image_Tools_Spec.md#5-upscale-image-ai) |
| Collage Maker | ✅ | ✅ | 🟡 P1 | [Spec](03_Image_Tools_Spec.md#7-collage-maker) |
| Add Text | ✅ | ✅ | 🟡 P1 | [Spec](03_Image_Tools_Spec.md#8-add-text-to-image) |
| Watermark | ✅ | ✅ | 🟡 P1 | [Spec](03_Image_Tools_Spec.md#9-watermark-image) |
| Filter / Grayscale | ✅ | ✅ | 🟡 P1 | [Spec](03_Image_Tools_Spec.md#10-image-filter) |
| OCR | ✅ | ✅ | 🟡 P1 | [Spec](03_Image_Tools_Spec.md#11-image-to-text-ocr) |
| HEIC to JPG | ✅ | ✅ | 🟢 P2 | [Spec](03_Image_Tools_Spec.md#12-heicheif-to-jpg) |
| Flip / Rotate | ✅ | ✅ | 🟢 P2 | [Spec](03_Image_Tools_Spec.md#14-flip--rotate-image) |
| Blur BG | ✅ | ❌ | 🟢 P2 | [Spec](03_Image_Tools_Spec.md#6-blur-background) |
| Transparent BG | ✅ | ✅ | 🟢 P2 | [Spec](03_Image_Tools_Spec.md#13-transparent-background) |
| Chart Maker | ✅ | ❌ | 🟢 P2 | [Spec](03_Image_Tools_Spec.md#15-chart-maker) |

### Phase 3 — [Video](04_Video_Tools_Spec.md) + [File](05_File_Converters_Spec.md) (Tháng 8)
| Tool | Web | Mobile | Priority | Spec |
|------|-----|--------|----------|------|
| Compress Video | ✅ | ✅ | 🔴 P0 | [Spec](04_Video_Tools_Spec.md#1-compress-video) |
| Trim Video | ✅ | ✅ | 🔴 P0 | [Spec](04_Video_Tools_Spec.md#2-trim-video) |
| MP4 to MP3 | ✅ | ✅ | 🟡 P1 | [Spec](04_Video_Tools_Spec.md#3-mp4-to-mp3) |
| Video to GIF | ✅ | ✅ | 🟡 P1 | [Spec](04_Video_Tools_Spec.md#4-video-to-gif) |
| MOV to MP4 | ✅ | ✅ | 🟡 P1 | [Spec](04_Video_Tools_Spec.md#5-mov-to-mp4) |
| MKV to MP4 | ✅ | ❌ | 🟢 P2 | [Spec](04_Video_Tools_Spec.md#6-mkv-to-mp4) |
| Resize Video | ✅ | ❌ | 🟢 P2 | [Spec](04_Video_Tools_Spec.md#8-resize-video) |
| CSV ↔ Excel | ✅ | ✅ | 🔴 P0 | [Spec](05_File_Converters_Spec.md#1-csv-to-excel) |
| Excel ↔ PDF | ✅ | ❌ | 🟡 P1 | [Spec](05_File_Converters_Spec.md#3-excel-to-pdf) |
| XML ↔ JSON | ✅ | ✅ | 🟢 P2 | [Spec](05_File_Converters_Spec.md#4-xml-to-json--json-to-xml) |
| Split CSV | ✅ | ❌ | 🟢 P2 | [Spec](05_File_Converters_Spec.md#6-split-csv--split-excel) |

### Phase 4 — [AI](06_AI_Tools_Spec.md) + [Premium](11_Monetization_Strategy.md) (Tháng 9)
| Tool | Web | Mobile | Priority | Spec |
|------|-----|--------|----------|------|
| Grammar Fixer | ✅ | ✅ | 🟡 P1 | [Spec](06_AI_Tools_Spec.md#4-grammar-fixer) |
| Blog Writer | ✅ | ❌ | 🟢 P2 | [Spec](06_AI_Tools_Spec.md#5-blog-writer--article-writer) |
| Summarizer | ✅ | ✅ | 🟢 P2 | [Spec](06_AI_Tools_Spec.md#6-summarizer) |
| Translator | ✅ | ✅ | 🟡 P1 | [Spec](06_AI_Tools_Spec.md#7-translator) |
| Premium Plan | ✅ | ✅ | 🔴 P0 | [Pricing](11_Monetization_Strategy.md#4-giá-gợi-ý) |
| Data Sync | — | ✅ | 🔴 P0 | [Sync spec](09_Mobile_App_Spec.md#6-sync-web--mobile) |

---

## 📈 Progress Tracking

### Overall Progress: **5%** (Phase Planning done)

| Phase | Tools Count | Done | Progress |
|-------|-------------|------|----------|
| **Phase 0 — Planning** ([12 docs](#-danh-sách-tài-liệu)) | 12 | 12 | **100%** ✅ |
| Phase 1 — [PDF Suite](02_PDF_Tools_Spec.md) (Web) | 12 | 0 | 0% |
| Phase 1 — [PDF Suite](02_PDF_Tools_Spec.md) (Mobile) | 12 | 0 | 0% |
| Phase 2 — [Image Studio](03_Image_Tools_Spec.md) (Web) | 15 | 0 | 0% |
| Phase 2 — [Image Studio](03_Image_Tools_Spec.md) (Mobile) | 15 | 0 | 0% |
| Phase 3 — [Video](04_Video_Tools_Spec.md) (Web) | 7 | 0 | 0% |
| Phase 3 — [Video](04_Video_Tools_Spec.md) (Mobile) | 7 | 0 | 0% |
| Phase 3 — [File](05_File_Converters_Spec.md) (Web) | 5 | 0 | 0% |
| Phase 3 — [File](05_File_Converters_Spec.md) (Mobile) | 5 | 0 | 0% |
| Phase 4 — [AI](06_AI_Tools_Spec.md) (Web) | 4 | 0 | 0% |
| Phase 4 — [AI](06_AI_Tools_Spec.md) (Mobile) | 4 | 0 | 0% |
| Phase 4 — [Premium](11_Monetization_Strategy.md) | 1 | 0 | 0% |

---

## 🧱 Tech Stack Check

| Component | Stack | Status | Notes | Guide |
|-----------|-------|--------|-------|-------|
| Web framework | **[Next.js](01_Overall_Architecture.md#web-dev-a)** | ❌ Chưa setup | `npx create-next-app` | [Deploy](10_Deployment_Guide.md#1-web-app-nextjs) |
| Mobile framework | **[Flutter](09_Mobile_App_Spec.md)** | ❌ Chưa setup | `flutter create` | [Deploy](10_Deployment_Guide.md#2-mobile-app-flutter) |
| Database | **[Supabase](08_Database_Schema.md#supabase-postgresql)** | ❌ Chưa setup | Tạo project + schema | [Schema](08_Database_Schema.md#supabase-postgresql) |
| File storage | **[Cloudflare R2](10_Deployment_Guide.md#4-file-storage-cloudflare-r2)** | ❌ Chưa setup | Tạo buckets | [Setup](10_Deployment_Guide.md#4-file-storage-cloudflare-r2) |
| Auth | **[Firebase Auth](01_Overall_Architecture.md#5-auth-strategy)** | ❌ Chưa setup | Enable providers | [Strategy](01_Overall_Architecture.md#5-auth-strategy) |
| Payments | **[Stripe](11_Monetization_Strategy.md)** | ❌ Chưa setup | Products + webhook | [Pricing](11_Monetization_Strategy.md#4-giá-gợi-ý) |
| Mobile CI | **[Codemagic](10_Deployment_Guide.md#ci-cd-codemagic)** | ❌ Chưa setup | Build iOS + Android | [Guide](10_Deployment_Guide.md#ci-cd-codemagic) |
| Processing | **[Cloud Run](10_Deployment_Guide.md#3-backend-services)** | ❌ Chưa setup | Docker + deploy | [Guide](10_Deployment_Guide.md#3-backend-services) |
| Domain | utilityapp.io | ❌ Chưa mua | ~$15/yr | — |

---

## 💰 Budget Tracking

| Item | Estimated | Spent | Remaining | Model |
|------|-----------|-------|-----------|-------|
| Vercel Pro | $20/mo | $0 | $20 | [Web hosting](10_Deployment_Guide.md#1-web-app-nextjs) |
| Supabase Pro | $25/mo | $0 | $25 | [Database](08_Database_Schema.md) |
| Cloudflare R2 | ~$5/mo | $0 | $5 | [File storage](10_Deployment_Guide.md#4-file-storage-cloudflare-r2) |
| OpenAI API | ~$10/mo | $0 | $10 | [AI tools](06_AI_Tools_Spec.md) |
| Apple Developer | $99/yr | $0 | $99 | [App Store](10_Deployment_Guide.md#2-mobile-app-flutter) |
| Codemagic Pro | ~$30/mo | $0 | $30 | [Mobile CI](10_Deployment_Guide.md#ci-cd-codemagic) |
| Domain | ~$15/yr | $0 | $15 | — |

---

## 📝 Task tracker

### 🔴 P0 — Tuần này
- [ ] Setup [Next.js](10_Deployment_Guide.md#1-web-app-nextjs) project + deploy Vercel
- [ ] Setup [Flutter](10_Deployment_Guide.md#2-mobile-app-flutter) project + chạy được trên iOS
- [ ] Setup [Supabase](08_Database_Schema.md) + [Cloudflare R2](10_Deployment_Guide.md#4-file-storage-cloudflare-r2)
- [ ] [PDF Merge](02_PDF_Tools_Spec.md#1-merge-pdf) (Web + Mobile) — tool đầu tiên
- [ ] [Progress Bar](12_Gamification_Strategy.md#1-progress-bar-todays-goal) "Today's Goal"
- [ ] [Fun Loading Tips](12_Gamification_Strategy.md#4-fun-loading-tips)
- [ ] [Share to Unlock](12_Gamification_Strategy.md#3-share-to-unlock)
- [ ] [Streak System](12_Gamification_Strategy.md#2-streak-system-chuỗi-ngày) — 4 [MVP Gamification](12_Gamification_Strategy.md#-mvp-gamification-tháng-1-2--effort-thấp-impact-cao) features

### 🟡 P1 — Tuần sau
- [ ] [Auth](01_Overall_Architecture.md#5-auth-strategy): Google login + Anonymous
- [ ] File upload/download flow ([Web](01_Overall_Architecture.md#3-data-flow-xử-lý-file) + [Mobile](09_Mobile_App_Spec.md))
- [ ] [PDF Compress](02_PDF_Tools_Spec.md#2-compress-pdf) + [JPG-to-PDF](02_PDF_Tools_Spec.md#3-jpg-to-pdf)
- [ ] Premium pricing page (static) — [tham khảo pricing](11_Monetization_Strategy.md#4-giá-gợi-ý)

### 🟢 P2 — Tháng sau
- [ ] 7 PDF tools còn lại ([spec](02_PDF_Tools_Spec.md))
- [ ] Image tools bắt đầu ([spec](03_Image_Tools_Spec.md))
- [ ] Stripe integration ([monetization](11_Monetization_Strategy.md))
- [ ] [XP + Level System](12_Gamification_Strategy.md#5-xp--level-system)
- [ ] [Achievement Badges](12_Gamification_Strategy.md#6-achievement-badges)
- [ ] [Daily/Weekly Quests](12_Gamification_Strategy.md#7-dailyweekly-quests)

---

## 📂 Danh sách tài liệu

| # | File | Nội dung |
|---|------|----------|
| 00 | `📊 00_Plan_and_Status.md` | **Overall plan & progress tracking** ← bạn đang ở đây |
| 01 | `🏗️ 01_Overall_Architecture.md` | [Kiến trúc tổng thể](01_Overall_Architecture.md), tech stack, data flow |
| 02 | `📄 02_PDF_Tools_Spec.md` | 12 [PDF tools](02_PDF_Tools_Spec.md) spec |
| 03 | `🖼️ 03_Image_Tools_Spec.md` | 15 [Image tools](03_Image_Tools_Spec.md) spec |
| 04 | `🎬 04_Video_Tools_Spec.md` | 8 [Video tools](04_Video_Tools_Spec.md) spec |
| 05 | `📁 05_File_Converters_Spec.md` | 7 [File converters](05_File_Converters_Spec.md) spec |
| 06 | `🤖 06_AI_Tools_Spec.md` | 7 [AI tools](06_AI_Tools_Spec.md) spec |
| 07 | `🔌 07_API_Backend_Spec.md` | 200+ [API endpoints](07_API_Backend_Spec.md) spec |
| 08 | `🗄️ 08_Database_Schema.md` | [Database tables](08_Database_Schema.md) & collections |
| 09 | `📱 09_Mobile_App_Spec.md` | [Flutter](09_Mobile_App_Spec.md) project structure |
| 10 | `🚀 10_Deployment_Guide.md` | [Vercel, Codemagic, Cloud Run](10_Deployment_Guide.md) |
| 11 | `💰 11_Monetization_Strategy.md` | 9 [monetization models](11_Monetization_Strategy.md) |
| 12 | `🎮 12_Gamification_Strategy.md` | 13 [gamification features](12_Gamification_Strategy.md), [ma trận ưu tiên](12_Gamification_Strategy.md#-ma-trận-ưu-tiên) |

---

## 🔗 Links

| Resource | URL |
|----------|-----|
| GitHub Repo | https://github.com/sslakd/Utility-app |
| Google Drive | `My Drive/UtilityApp_Docs/` |
| App Icon | [`assets/icons/app_icon.png`](assets/icons/app_icon.png) |
| Reference: tinywow | https://tinywow.com |
| Reference: smallpdf | https://www.smallpdf.com |
| Tài liệu local | `~/Desktop/UtilityApp_Docs/` |

---

## 📌 Notes

- **Xử lý [client-side](01_Overall_Architecture.md#pattern-1-client-side-processing-ưu-tiên)** (WASM/Canvas) khi có thể → tiết kiệm server cost
- **Xử lý [server-side](01_Overall_Architecture.md#pattern-2-server-side-processing-file-lớn)** cho file lớn (Video, AI) → [Cloud Run](10_Deployment_Guide.md#3-backend-services)
- **Premium:** [Stripe webhook](10_Deployment_Guide.md#stripe-webhook) → update Firestore → cả web + mobile check role
- Mỗi tool = 1 [endpoint API](07_API_Backend_Spec.md#file-processing-endpoints) + 1 UI screen (pattern reusable)
- **[Gamification](12_Gamification_Strategy.md#-ma-trận-ưu-tiên)** = 13 features: 4 làm ngay (MVP), 5 làm trong core phase, 4 để sau
- **[Monetization](11_Monetization_Strategy.md#3-chiến-lược-triển-khai-theo-phase)**: Phase MVP = remove watermark + banner ads → Phase Growth = Freemium → Phase Scale = Credits + API
