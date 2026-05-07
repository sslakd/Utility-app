# Gamification Strategy — UtilityApp

## Mục tiêu
Giữ chân user, tăng engagement, tạo lý do quay lại mỗi ngày.

---

## 🎮 MVP Gamification (Tháng 1-2 — Effort thấp, Impact cao)

### 1. Progress Bar "Today's Goal"
```
━━━━━━━━━░░░ [3/5 tools used today]
Next tool → +1 free credit!
```
- Reset mỗi ngày
- Hoàn thành 5 tools → unlock 1 free Premium use hoặc 5 credits
- Lưu: localStorage (web) / SharedPreferences (mobile)
- **Effort:** 0.5 ngày

### 2. Streak System (Chuỗi ngày)
- Đếm số ngày liên tiếp có ít nhất 1 lần xử lý
- Day 3: "🔥 3-day streak! Bonus 2 free uses"
- Day 7: "7 days! Unlock Compress Pro quality"
- Day 30: "Monthly Master! 1 day Premium free"
- Break streak → reset về 0, notification: "Your streak is at risk!"
- **DB:** `users.streak_count`, `users.last_active_date`
- **Effort:** 1 ngày

### 3. Share to Unlock
- Sau khi xử lý xong: button "Share result → Unlock 1 Premium use"
- Share: native share sheet (ảnh trước/sau, file PDF)
- Output có watermark nhỏ: "Made with UtilityApp"
- Chỉ tính 1 lần share/ngày
- **Effort:** 1 ngày (web) / 0.5 ngày (mobile)

### 4. Fun Loading Tips
- JSON array ~20 tips, random mỗi lần processing
```
💡 Did you know? PDF Merge can handle up to 20 files at once
💡 Pro tip: Hold Ctrl to select multiple files
💡 You've saved 1.2GB by compressing PDFs this month!
```
- **Effort:** 0.25 ngày

---

## 🏆 Core Gamification (Tháng 2-3)

### 5. XP + Level System
| Level | XP Required | Unlock |
|-------|-------------|--------|
| 1 | 0 | Basic tools |
| 5 | 500 | Batch (2 files) |
| 10 | 2,000 | Priority queue |
| 15 | 5,000 | Upscale AI 2x |
| 25 | 15,000 | Unlimited batch |
| 50 | 50,000 | 1 day Premium free/month |

**XP Sources:**
| Action | XP |
|--------|----|
| Process file (any tool) | 10 |
| Process AI tool | 50 |
| First use of the day | 20 (bonus) |
| Complete daily quest | 100 |
| Share result | 30 |
| 7-day streak | 200 |
| Refer friend | 500 |

**Database:**
```sql
-- users table add
xp_count INTEGER DEFAULT 0,
level INTEGER DEFAULT 1,
```

**Effort:** 2 ngày

### 6. Achievement Badges
| Badge | Condition | Reward |
|-------|-----------|--------|
| 📄 PDF Newbie | Process 10 PDF files | Badge + 2 free uses |
| 🖼️ Image Editor | Use 5 different Image tools | Badge + theme token |
| ⚡ Speed Demon | Process 50 files in one day | Badge + 24h no ads |
| 🦉 Night Owl | Use app between 0-5 AM | Secret badge |
| 💪 Power User | Process file >100MB | Badge |
| 🎯 Collector | Use all 5 categories | Badge + unlock 1 Premium tool for 24h |
| 🔥 Streak Master | 30-day streak | Badge + 3 days Premium |
| 🤖 AI Explorer | Use 3 AI tools | Badge |
| 📱 Social Butterfly | Share 10 results | Badge |

**Database:**
```sql
CREATE TABLE user_badges (
  id SERIAL PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  badge_id TEXT NOT NULL,
  unlocked_at TIMESTAMPTZ DEFAULT NOW()
);
```

**Effort:** 3 ngày

### 7. Daily/Weekly Quests
**Daily quests (3 random/ngày):**
```
☐ Merge 3 files → +20XP
☐ Use any Image tool → +10XP
☐ Compress a file → +15XP
☐ Upload from camera (mobile) → +20XP
☐ Use 2 different tools → +15XP
☐ Share app → +30XP
☐ Process a file >10MB → +15XP
```

**Weekly quests (2 random/tuần):**
```
☐ Process 50 files → +200XP + "Workhorse" badge
☐ Use 4 different categories → +150XP
☐ Upload file >50MB → +100XP
☐ Maintain 5-day streak → +150XP
☐ Use 3 AI tools → +200XP
```

**Database:**
```sql
CREATE TABLE user_quests (
  id SERIAL PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  quest_id TEXT NOT NULL,
  quest_type TEXT DEFAULT 'daily', -- 'daily' | 'weekly'
  progress INT DEFAULT 0,
  target INT NOT NULL,
  completed BOOLEAN DEFAULT FALSE,
  expires_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

**Effort:** 3 ngày

---

## 🟡 Extended Gamification (Tháng 3-4)

### 8. Tool Mastery (Per-Tool Level)
- Mỗi tool có level riêng (PDF Merge Lv.7, BG Remover Lv.3)
- Level lên theo số lần dùng
- Level cao → tool chạy nhanh hơn, chất lượng cao hơn
- Display: progress ring trên mỗi icon tool
- **Effort:** 3 ngày

### 9. Mystery Box (Loot Crate)
- Mỗi 5 file xử lý → 1 mystery box
- Click để mở (animation)
- **Rewards:**
  - 50%: 3-10 credits
  - 20%: Badge
  - 15%: 1h Premium
  - 10%: Theme token
  - 4%: 24h Premium
  - 1%: 7 days Premium (rare!)
- **Effort:** 4 ngày

### 10. Unlockable Themes
| Theme | Unlock Condition |
|-------|-----------------|
| Dark Ocean | Process 100 files |
| Neon Night | Process 500 files |
| Studio Pro | Use BG Remover 50 times |
| Retro | Complete 30 daily quests |
| Premium Gold | Premium subscriber |
| Secret Rainbow | Use all tools at least once |

- **Effort:** 5 ngày (cần theme system)

---

## 🔴 Advanced Gamification (Tháng 5-6)

### 11. Processing Pet
- Virtual pet ở góc màn hình
- Mỗi lần xử lý → pet ăn → lớn lên
- Level = pet evolution (egg → baby → teen → adult → legendary)
- Bỏ qua 7 ngày → pet buồn, notification "Your pet misses you!"
- **Effort:** 10+ ngày (phức tạp)

### 12. Leaderboard (Anonymous)
- "You processed 8 files today — top 15% of users"
- Weekly top 10 → bonus credits
- Ẩn danh, chỉ dùng avatar mặc định
- **Effort:** 5 ngày

### 13. Tool Stats & Personal Analytics
- "You've compressed 15,230 MB — that's a stack taller than the Burj Khalifa 🏗️"
- "342 backgrounds removed 📸"
- "Most used tool: PDF Merge (127 times)"
- "Peak hour: 9 PM — night owl mode 🦉"
- **Effort:** 4 ngày

---

## 📊 Ma trận ưu tiên

| Feature | Effort | Impact | Viral? | Phase |
|---------|--------|--------|--------|-------|
| Progress Bar | 🟢 Dễ | 🔥 Cao | ❌ | **Tháng 1 (MVP)** |
| Share to Unlock | 🟢 Dễ | 🔥 Cao | ✅ | **Tháng 1 (MVP)** |
| Fun Loading Tips | 🟢 Dễ | 🟡 Medium | ❌ | **Tháng 1 (MVP)** |
| Streak System | 🟢 Dễ | 🔥 Cao | ❌ | **Tháng 1 (MVP)** |
| XP + Level | 🟡 Medium | 🔥 Cao | ❌ | Tháng 2 |
| Achievement Badges | 🟡 Medium | 🔥 Cao | ✅ | Tháng 2 |
| Daily/Weekly Quests | 🟡 Medium | 🔥 Cao | ❌ | Tháng 2-3 |
| Tool Mastery | 🟡 Medium | 🟡 Medium | ❌ | Tháng 3 |
| Mystery Box | 🟡 Medium | 🔥 Cao | ❌ | Tháng 3 |
| Themes | 🟡 Medium | 🟡 Medium | ❌ | Tháng 3-4 |
| Personal Stats | 🟡 Medium | 🔥 Cao | ✅ | Tháng 4 |
| Leaderboard | 🔴 Khó | 🟡 Medium | ✅ | Tháng 5 |
| Processing Pet | 🔴 Khó | 🟡 Medium | ❌ | Tháng 5-6 |

---

## 🔗 Gamification & Monetization

Gamification không chỉ giữ chân — nó còn **thúc đẩy conversion sang Premium**:

| Trigger | Premium Upsell |
|---------|---------------|
| Hết daily free uses | "Get unlimited — Premium $9/mo" |
| Streak broken | "Revive streak → 7 day Premium trial" |
| Mystery box 1% rare | "Buy Premium... or try again tomorrow" |
| Level 25+ rewards | Unlock Premium features naturally |
| Share to Unlock | Viral loop → new users → new Premium prospects |

---

## 🔗 Cross-references

- [📊 Plan & Status](00_Plan_and_Status.md) — Overall plan, [Task tracker](00_Plan_and_Status.md#-task-tracker), [Gantt](00_Plan_and_Status.md#-gantt--6-tháng)
- [🏗️ Tổng quan kiến trúc](01_Overall_Architecture.md) — Tech stack, data flow
- [🗄️ Database Schema](08_Database_Schema.md) — Tables & collections
- [📱 Mobile App Spec (Flutter)](09_Mobile_App_Spec.md) — Mobile structure
- [💰 Monetization Strategy](11_Monetization_Strategy.md) — [Gamification → Monetization](11_Monetization_Strategy.md#-tối-ưu-conversion)
- [🔌 API Backend Spec](07_API_Backend_Spec.md) — Rate limiting & Premium
