# AI Tools Spec

## Overview
Các tool sử dụng AI/ML để xử lý văn bản và hình ảnh.

## Tool List

### 1. Background Remover
*(Đã spec trong Image Tools — cần AI model)*

**Model options:**
- **Free:** u2net (Rembg) — chạy trên Cloud Run GPU
- **Paid:** remove.bg API ($0.05/image) hoặc replicate.com/u2net ($0.01)

**Recommendation:** Dùng Replicate API (miễn phí 1M tokens/tháng)

### 2. Image Upscale
**Model:** Real-ESRGAN (Replicate)
**Cost:** ~$0.01/image on Replicate

### 3. OCR (Image to Text)
| Item | Detail |
|------|--------|
| **Mô tả** | Trích xuất text từ ảnh |
| **Basic** | Tesseract.js (WASM) — chạy client, support EN/JP/VI |
| **Advanced** | Google Cloud Vision — accurate hơn, $1.50/1k images |
| **Recommendation** | Dùng Tesseract.js cho free, fallback Vision API nếu cần |

### 4. Grammar Fixer
| Item | Detail |
|------|--------|
| **Mô tả** | Sửa lỗi ngữ pháp tiếng Anh |
| **API** | OpenAI GPT-4o-mini / LanguageTool API |
| **Cost** | OpenAI: ~$0.01/request |
| **UI** | Textarea input → Diff highlight (đỏ = sai, xanh = sửa) |

### 5. Blog Writer / Article Writer
| Item | Detail |
|------|--------|
| **Mô tả** | Viết blog/article từ chủ đề |
| **API** | OpenAI GPT-4o-mini |
| **Options** | Length (short/medium/long), Tone (formal/casual/professional), Language |
| **UI** | Input topic → Generate → Edit → Copy/Download |

### 6. Summarizer
| Item | Detail |
|------|--------|
| **Mô tả** | Tóm tắt văn bản |
| **API** | OpenAI GPT-4o-mini |
| **Options** | Summary length (brief/detailed), Bullet points format, Key takeaways |

### 7. Translator
| Item | Detail |
|------|--------|
| **Mô tả** | Dịch văn bản/file |
| **API** | Google Translate API (rẻ hơn) hoặc OpenAI |
| **Cost** | Google Translate: $20/1M chars |
| **Supported** | 100+ languages |

### 8. AI Chat (optional)
| Item | Detail |
|------|--------|
| **Mô tả** | Chat với AI để hỏi về file đã upload (Chat with PDF) |
| **API** | OpenAI Assistants API (File search) |
| **Note** | Tính năng advanced, implement sau cùng |

---

## 🔗 Cross-references

- [📊 Plan & Status](00_Plan_and_Status.md) — Overall plan, task tracker, progress
- [🏗️ Tổng quan kiến trúc](01_Overall_Architecture.md) — Tech stack, data flow
- [🔌 API Backend Spec](07_API_Backend_Spec.md) — AI API endpoints
- [💰 Monetization Strategy](11_Monetization_Strategy.md) — 9 models kiếm tiền
- [🎮 Gamification Strategy](12_Gamification_Strategy.md) — 13 features gamification
