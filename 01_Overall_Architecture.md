# Kiến Trúc Tổng Thể

## 1. Tổng Quan Hệ Thống

```
┌─────────────────────────┐     ┌──────────────────────────┐
│    Web App (Next.js)    │     │  Mobile App (Flutter)    │
│  - SSR / Client-side    │     │  - iOS / Android         │
│  - Tailwind + shadcn/ui │     │  - Material UI 3         │
│  - Zustand + React Query│     │  - Riverpod / Bloc       │
└────────┬──────────────┬──┘     └───┬──────────────────────┘
         │              │            │
         │              │            │
         ▼              ▼            ▼
┌──────────────────────────────────────────────┐
│          Shared Backend Services             │
│                                              │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐   │
│  │Firebase  │  │Supabase  │  │Cloudflare│   │
│  │  Auth    │  │PostgreSQL│  │   R2     │   │
│  └──────────┘  └──────────┘  └──────────┘   │
│                                              │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐   │
│  │ Stripe   │  │Cloud Run │  │OpenAI /  │   │
│  │ Payments │  │(server)  │  │Replicate │   │
│  └──────────┘  └──────────┘  └──────────┘   │
└──────────────────────────────────────────────┘
```

## 2. Tech Stack

### Web (Dev A)
| Component | Công nghệ | Lý do |
|-----------|----------|-------|
| Framework | Next.js 14 (App Router) | SSR, SEO, Fast |
| UI | Tailwind CSS + shadcn/ui | Component library |
| State | React Query + Zustand | Cache + state |
| Auth | NextAuth.js | Google OAuth |
| DB | Supabase | PostgreSQL + realtime |
| File | Cloudflare R2 | S3-compatible, rẻ |
| Serverless | Cloud Run / Vercel Edge | Scale tự động |
| Payment | Stripe | Webhook subscription |

### Mobile (Dev B)
| Component | Công nghệ | Lý do |
|-----------|----------|-------|
| Framework | Flutter 3.x | Cross-platform |
| State | Riverpod / Bloc | Clean architecture |
| Auth | Firebase Auth | SDK sẵn |
| DB | Firebase Firestore | Realtime sync |
| File | Cloudflare R2 SDK | Cùng bucket với web |
| Payment | RevenueCat | Quản lý subscription |
| CI/CD | Codemagic | Build iOS + Android |

## 3. Data Flow Xử Lý File

### Pattern 1: Client-side Processing (ưu tiên)
```
User upload → [WASM / Native lib] → Preview → Download
```

### Pattern 2: Server-side Processing (file lớn)
```
User upload → Vercel/Cloud Run → [ffmpeg-wasm / pdf-lib] → R2 storage → Download URL
```

### Pattern 3: AI Processing
```
User upload → Cloud Run → [OpenAI / Replicate API] → R2 storage → Download URL
```

## 4. File Storage Strategy

**Bucket structure trên Cloudflare R2:**
```
/uploads/{userId}/{timestamp}_{filename}
/processed/{userId}/{timestamp}_{filename}
/temp/{sessionId}_{filename} (tự động xoá sau 24h)
```

**Lifecycle rules:**
- `temp/`: auto-delete sau 24h
- `uploads/`: giữ 7 ngày
- `processed/`: giữ 7 ngày
- Premium users: giữ 30 ngày

## 5. Auth Strategy

| Feature | Anonymous | Free User | Premium User |
|---------|-----------|-----------|-------------|
| Basic tools (≤10MB) | ✅ | ✅ | ✅ |
| Basic tools (>10MB) | ❌ | ✅ | ✅ |
| File size limit | 10MB | 50MB | 200MB |
| Batch processing | ❌ | ❌ | ✅ |
| Ad-free | ❌ | ❌ | ✅ |
| History | ❌ | 7 days | 30 days |

## 6. Sync Web ↔ Mobile

- **Auth:** Firebase Auth (cùng UID xác thực)
- **Files:** Cùng bucket R2 (upload web = xem được trên mobile)
- **Premium:** Stripe webhook → cập nhật Firestore → cả 2 platform check role
- **History:** Firestore collection chung
