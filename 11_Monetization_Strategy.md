# Monetization Strategy — UtilityApp

## 1. Recommended Models (độ sinh lời cao → thấp)

### 🔥 Tier 1 — Sinh lời cao nhất

#### A. Freemium + Subscription (khuyến nghị chính)
| | Free | Premium ($9/tháng) |
|--|------|-------------------|
| Tool usage | 5 lần/ngày/tool | Unlimited |
| File size | ≤10MB | ≤200MB |
| Batch processing | ❌ | ✅ (up to 20 files) |
| Ads | ✅ | ❌ |
| Processing speed | Normal | Priority queue |
| Export quality | Standard | Maximum |
| History | 24h | 30 days |

**Ước tính:** conversion rate 2-5% → ~$0.18-0.45/user/tháng

#### B. Pay-per-Use + Credits
- Mua gói credits: $5 (50 credits), $10 (120 credits), $20 (250 credits)
- Mỗi lần dùng tool = 1 credit (tool cơ bản) / 3 credits (tool AI) / 5 credits (video)
- **Ưu điểm:** Phù hợp user không muốn cam kết hàng tháng
- **VD:** smallpdf bán $9/tháng nhưng chỉ 24h. Credit = user mua khi cần.

#### C. Ad Revenue (Rewarded Ads on Mobile)
- **Interstitial ads:** Hiện giữa các lần xử lý file
- **Rewarded video:** User xem 30s ad → được 1 lần xử lý free (vượt limit)
- **Banner ads:** Dưới màn hình (ít gây khó chịu)
- **Ước tính:** $2-5 CPM (web), $5-10 CPM (mobile) → ~$2-5/1k sessions

### 🟡 Tier 2 — Trung bình

#### D. White-label / API Licensing
- Cho doanh nghiệp thuê API xử lý file (PDF, Image)
- Pricing: $199/tháng cho 10k requests
- Target: Startup nhỏ không muốn tự xây tool

#### E. Affiliate Marketing
- Quảng cáo tool partner (mực in, máy in, scanner)
- Commission 5-15% per sale
- **VD:** tinywow có affiliate program

#### F. Remove Watermark (one-time purchase)
- Bản free: output có watermark nhỏ
- Bỏ watermark: $4.99 (one-time)
- **Tâm lý:** User ghét watermark → willing to pay

### 🟢 Tier 3 — Bổ sung

#### G. Data Recovery / File Recovery (spinoff)
- Tool khôi phục file PDF/Office bị lỗi
- Tính phí riêng: $2.99/lần

#### H. Print-on-Demand
- User làm xong file → gửi in → ship tận nhà
- Hợp tác với dịch vụ in ấn địa phương

#### I. Enterprise Plan
- Single sign-on (SSO)
- Audit log
- Team management
- Custom branding
- $49/tháng cho 5 users

---

## 2. So sánh revenue ước tính (100k MAU)

| Model | Conversion | Revenue/tháng | Độ phức tạp |
|-------|-----------|---------------|-------------|
| **Subscription (Premium)** | 3% | **$27,000** | Trung bình |
| **Pay-per-Use Credits** | 5% | **$15,000** | Phức tạp |
| **Rewarded Ads** | 80% fill rate | **$8,000-16,000** | Dễ |
| **API Licensing** | 10 enterprise | **$2,000** | Trung bình |
| **Remove Watermark** | 8% | **$4,000** | Dễ nhất |
| **Affiliate** | 2% CTR | **$1,000** | Dễ |
| **Print-on-Demand** | 1% | **$500** | Khó (logistics) |

## 3. Chiến lược triển khai theo phase

| Phase | Models | Khi nào |
|-------|--------|---------|
| **MVP (Tháng 1-2)** | Chỉ **remove watermark** + **banner ads** | Giai đoạn build user base |
| **Growth (Tháng 3-4)** | Thêm **Freemium (Premium subscription)** + **Rewarded ads** | User ổn định |
| **Scale (Tháng 5-6)** | Thêm **Pay-per-Use credits** + **API Licensing** | Có traffic |
| **Mature** | **Enterprise** + **Affiliate** + Print-on-Demand | 100k+ MAU |

## 4. Giá gợi ý

| Product | Giá | Đối thủ tham khảo |
|---------|-----|------------------|
| Premium Monthly | $9 | smallpdf ($9), ilovepdf ($9) |
| Premium Yearly | $59 (~$4.9/tháng) | smallpdf ($72/năm) |
| Credits 50 | $5 | pdf24 ($0/credit) |
| Credits 200 | $15 | — |
| Remove Watermark | $4.99 | — |
| API 10k requests | $199 | pdf.co ($249) |
| Enterprise (5 users) | $49 | smallpdf Team ($15/user) |

## 5. Tối ưu conversion

- **First-time user:** 3 free uses → thấy value → upsell
- **Exit intent:** Khi user chuẩn bị rời → popup "Get 50% off Premium"
- **Scarcity:** "Free conversion remaining: 2" (đếm ngược)
- **Social proof:** "254,000 files processed today"
- **Mobile:** Rewarded video ads (user xem ad → free processing)
