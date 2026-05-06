# PDF Tools Spec

## Overview
Tập hợp các tool xử lý PDF. Xử lý client-side bằng WebAssembly (pdf-lib, PDF.js) khi có thể.

## Tool List

### 1. Merge PDF
| Item | Detail |
|------|--------|
| **Mô tả** | Gộp nhiều file PDF thành 1 file duy nhất |
| **Input** | 2+ file PDF |
| **Output** | 1 file PDF |
| **Library** | pdf-lib (WASM) |
| **Giới hạn free** | Tối đa 5 files, mỗi file ≤10MB |
| **Processing** | Client-side |
| **UI** | Drag & drop + Reorder buttons + Preview pages |
| **Error** | File corrupted → báo lỗi + skip file đó |

### 2. Compress PDF
| Item | Detail |
|------|--------|
| **Mô tả** | Giảm dung lượng PDF (lossy) |
| **Input** | 1 file PDF |
| **Output** | PDF nén |
| **Library** | pdf-lib (WASM) — giảm resolution ảnh, remove unused objects |
| **Giới hạn** | Free: ≤10MB, Premium: ≤200MB |
| **Processing** | Client-side (nhẹ) / Server-side (nặng) |
| **UI** | Slider quality (High/Medium/Low) + Preview size |

### 3. JPG to PDF
| Item | Detail |
|------|--------|
| **Mô tả** | Chuyển ảnh JPG/PNG/BMP thành PDF |
| **Input** | 1+ images |
| **Output** | Multi-page PDF |
| **Library** | pdf-lib (WASM) |
| **Options** | Page size (A4/Letter/Fit), Orientation (Portrait/Landscape), Margin |
| **Processing** | Client-side |
| **UI** | Thumbnail preview + Reorder + Auto-rotate |

### 4. PDF to Word
| Item | Detail |
|------|--------|
| **Mô tả** | Chuyển PDF → Word (.docx) |
| **Input** | 1 file PDF |
| **Output** | .docx file |
| **Library** | pdf.js (extract text) + docx.js (tạo docx) hoặc **server-side** dùng LibreOffice |
| **Giới hạn** | Free: 3 pages, Premium: unlimited |
| **Processing** | Server-side (Cloud Run) |
| **UI** | Progress bar + Preview text trước khi download |

### 5. PDF to Excel
| Item | Detail |
|------|--------|
| **Mô tả** | Trích xuất bảng từ PDF → Excel |
| **Input** | 1 file PDF (có bảng) |
| **Output** | .xlsx file |
| **Library** | Camelot/Tabula (server-side Python) hoặc AI |
| **Processing** | Server-side |
| **UI** | Preview bảng extracted |

### 6. Split PDF
| Item | Detail |
|------|--------|
| **Mô tả** | Tách 1 PDF thành nhiều file nhỏ |
| **Input** | 1 file PDF |
| **Output** | Nhiều file PDF |
| **Options** | Split by page range, split every N pages, extract specific pages |
| **Library** | pdf-lib (WASM) |
| **Processing** | Client-side |
| **UI** | Page range input + Preview page thumbnails |

### 7. Rotate PDF
| Item | Detail |
|------|--------|
| **Mô tả** | Xoay trang PDF |
| **Library** | pdf-lib (WASM) |
| **Processing** | Client-side |

### 8. Remove Password (Unlock PDF)
| Item | Detail |
|------|--------|
| **Mô tả** | Mở khoá PDF (user password) |
| **Library** | pdf-lib (WASM) |
| **Note** | Chỉ unlock PDF có user password. Owner password = không thể |

### 9. Protect PDF
| Item | Detail |
|------|--------|
| **Mô tả** | Thêm mật khẩu cho PDF |
| **Library** | pdf-lib (WASM) |
| **Options** | Set user password, owner password, printing/edit permissions |

### 10. PDF Sign
| Item | Detail |
|------|--------|
| **Mô tả** | Ký điện tử lên PDF |
| **Library** | pdf-lib (WASM) |
| **UI** | Draw signature pad + Upload signature image + Text signature |

### 11. Extract Text from PDF
| Item | Detail |
|------|--------|
| **Mô tả** | Trích xuất text từ PDF |
| **Library** | PDF.js (WASM) |
| **Output** | .txt file |

### 12. PDF Translator
| Item | Detail |
|------|--------|
| **Mô tả** | Dịch nội dung PDF |
| **Processing** | Server-side (OpenAI / Google Translate API) |
| **Lưu ý** | Giữ nguyên formatting |

## Shared UI Components (PDF)

```
ToolLayout
├── FileUpload (drag & drop, multi-file)
├── ProcessingProgress (progress bar)
├── PreviewPanel (page thumbnails)
├── OptionsPanel (tool-specific settings)
└── DownloadButton
```

## Mobile Notes (Flutter)
- PDF rendering: `pdfrx` package (fast, supports large files)
- PDF manipulation: `syncfusion_flutter_pdf` hoặc custom dart implementation
- Signature: Custom paint + touch events
- Barcode/QR on mobile: `mobile_scanner`
