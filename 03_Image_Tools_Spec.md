# Image Tools Spec

## Overview
Xử lý ảnh các định dạng: JPG, PNG, BMP, GIF, WEBP, HEIC/HEIF.

## Tool List

### 1. Resize Image
| Item | Detail |
|------|--------|
| **Mô tả** | Thay đổi kích thước ảnh |
| **Input** | 1 ảnh |
| **Output** | Ảnh đã resize |
| **Library** | Canvas API (web) / Image package (Flutter) |
| **Options** | Preset (Instagram/YouTube/Facebook/Twitter), Custom width x height, Keep aspect ratio, Crop to fit |
| **Processing** | Client-side |
| **UI** | Preview trực tiếp + Before/After slider |

### 2. Compress Image
| Item | Detail |
|------|--------|
| **Mô tả** | Giảm dung lượng ảnh |
| **Library** | Canvas (web) / flutter_image_compress |
| **Options** | Quality slider (1-100%), Target file size, Auto mode |
| **Processing** | Client-side |

### 3. Crop Image
| Item | Detail |
|------|--------|
| **Mô tả** | Cắt ảnh |
| **Library** | Cropper.js (web) / image_cropper (Flutter) |
| **Options** | Freehand crop, Fixed aspect ratios (1:1, 4:3, 16:9, 3:2), Circle crop |
| **Processing** | Client-side |

### 4. Background Remover (AI)
| Item | Detail |
|------|--------|
| **Mô tả** | Xoá nền ảnh tự động |
| **Library** | rembg (server-side Python) hoặc Replicate API (u2net model) |
| **Note** | Có thể dùng AI model miễn phí (u2net) hoặc paid (remove.bg API) |
| **Processing** | Server-side |
| **Options** | Keep subject, Replace background (color/image), Transparent BG |
| **UI** | Before/After + Zoom để kiểm tra edge |

### 5. Upscale Image (AI)
| Item | Detail |
|------|--------|
| **Mô tả** | Tăng độ phân giải ảnh (2x, 4x) |
| **Library** | Replicate API (Real-ESRGAN) |
| **Processing** | Server-side |
| **Limit** | Free: 1 lần/day, Premium: unlimited |

### 6. Blur Background
| Item | Detail |
|------|--------|
| **Mô tả** | Làm mờ nền (portrait mode) |
| **Library** | MediaPipe (WASM) — detect person + blur background |
| **Processing** | Client-side (WebAssembly) |

### 7. Collage Maker
| Item | Detail |
|------|--------|
| **Mô tả** | Ghép nhiều ảnh thành 1 ảnh |
| **Library** | Canvas API (web) / Custom Flutter widget |
| **Options** | Templates (2-9 photos grid), Custom layout, Border, Spacing, Background color |
| **Processing** | Client-side |

### 8. Add Text to Image
| Item | Detail |
|------|--------|
| **Mô tả** | Thêm chữ lên ảnh |
| **Library** | Canvas (web) / Custom paint (Flutter) |
| **Options** | Font, Size, Color, Position, Rotation, Shadow, Opacity |
| **Processing** | Client-side |

### 9. Watermark Image
| Item | Detail |
|------|--------|
| **Mô tả** | Thêm watermark (text/logo) |
| **Options** | Position (center/corner/tiled), Opacity, Size, Rotate |
| **Processing** | Client-side |

### 10. Image Filter (Colorize / Grayscale / Sepia)
| Item | Detail |
|------|--------|
| **Mô tả** | Apply filter màu |
| **Library** | Canvas pixel manipulation |
| **Filters** | Grayscale, Sepia, Negative, Vintage, Cool, Warm |
| **Processing** | Client-side |

### 11. Image to Text (OCR)
| Item | Detail |
|------|--------|
| **Mô tả** | Trích xuất text từ ảnh |
| **Library** | Tesseract.js (WASM) hoặc Google Cloud Vision |
| **Processing** | Client-side (WASM) cho cơ bản, Server-side (AI) cho nâng cao |

### 12. HEIC/HEIF to JPG
| Item | Detail |
|------|--------|
| **Mô tả** | Chuyển ảnh HEIC (iPhone) → JPG |
| **Library** | heic2any (WASM web) / flutter_image_compress (native) |
| **Processing** | Client-side |

### 13. Transparent Background
| Item | Detail |
|------|--------|
| **Mô tả** | Tạo ảnh PNG trong suốt |
| **Library** | Canvas (web) |
| **Options** | Select color to remove, Tolerance slider, Edge smoothing |

### 14. Flip / Rotate Image
| Item | Detail |
|------|--------|
| **Mô tả** | Lật ngang/dọc, xoay 90/180/270 độ |
| **Processing** | Client-side |

### 15. Chart Maker
| Item | Detail |
|------|--------|
| **Mô tả** | Tạo biểu đồ từ dữ liệu nhập |
| **Library** | Chart.js (web) / fl_chart (Flutter) |
| **Types** | Bar, Line, Pie, Doughnut, Area |
| **Export** | PNG download |

## Shared UI Components (Image)

```
ImageToolLayout
├── FileUpload (single/multi image, camera capture on mobile)
├── CanvasEditor (drag, zoom, crop tools)
├── FilterPanel (filter list, color adjustments)
├── BeforeAfterSlider
├── OptionsPanel
└── DownloadButton (PNG/JPG)
```

## Mobile-specific
- Camera integration: `image_picker` + `camera` packages
- Gallery: `photo_manager` package
- Native heif support: `flutter_image_compress`
