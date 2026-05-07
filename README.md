# Utility App — Swiss Army Knife

**Tên dự án:** UtilityApp.

**Mô tả:** Ứng dụng đa năng xử lý PDF, Image, Video, File, AI — chạy trên Web (Next.js) và Mobile (Flutter).

**Reference:** tinywow.com, smallpdf.com.

**Team:** Dev A (Web) + Dev B (Mobile), part-time.

**Timeline:** 6 tháng.

## Mục lục tài liệu

| # | File | Nội dung |
|---|------|----------|
| 1 | `01_Overall_Architecture.md` | Kiến trúc tổng thể, tech stack, data flow |
| 2 | `02_PDF_Tools_Spec.md` | Spec chi tiết các tool PDF |
| 3 | `03_Image_Tools_Spec.md` | Spec chi tiết các tool Image |
| 4 | `04_Video_Tools_Spec.md` | Spec chi tiết các tool Video |
| 5 | `05_File_Converters_Spec.md` | Spec chi tiết các File converters |
| 6 | `06_AI_Tools_Spec.md` | Spec chi tiết các tool AI |
| 7 | `07_API_Backend_Spec.md` | Backend API endpoints |
| 8 | `08_Database_Schema.md` | Database schema |
| 9 | `09_Mobile_App_Spec.md` | Flutter app spec |
| 10 | `10_Deployment_Guide.md` | Deployment & CI/CD |

## Quy ước chung

### Input/Output pattern
- User upload file → xử lý → download kết quả
- File tự động xoá sau 24h (hoặc sau khi download)
- Không yêu cầu login cho basic tools
- Premium: file > 50MB, batch processing, không ads

### Processing priority
1. **Client-side** (WASM / Native) — free, không tốn server
2. **Serverless** (Cloud Run) — khi file lớn
3. **AI API** (OpenAI / Replicate) — khi cần AI

### Naming convention
- URL: `/tool-category/tool-name` (VD: `/pdf/merge`, `/image/resize`)
- API: `POST /api/process/{category}/{tool}` 
- File: `{userId}_{timestamp}_{originalName}`
