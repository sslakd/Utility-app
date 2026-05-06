# Video Tools Spec

## Overview
Xử lý video các định dạng: MP4, MOV, MKV, AVI, WEBM.

## Tool List

### 1. Compress Video
| Item | Detail |
|------|--------|
| **Mô tả** | Giảm dung lượng video |
| **Input** | 1 file video |
| **Output** | MP4 đã nén |
| **Library** | ffmpeg.wasm (web) / FFmpegKit (mobile) |
| **Options** | Quality (Low/Medium/High), Target size, Resolution (720p/1080p) |
| **Processing** | **Server-side** cho file lớn >50MB (Cloud Run) |
| **Limit** | Free: ≤50MB, Premium: ≤500MB |

### 2. Trim Video
| Item | Detail |
|------|--------|
| **Mô tả** | Cắt video theo thời gian |
| **Input** | 1 file video |
| **Library** | ffmpeg.wasm / FFmpegKit |
| **Options** | Start time + End time (slider), Preserve audio |
| **Processing** | Server-side |

### 3. MP4 to MP3
| Item | Detail |
|------|--------|
| **Mô tả** | Trích xuất audio từ video |
| **Output** | .mp3 file |
| **Library** | ffmpeg.wasm / FFmpegKit |
| **Options** | Bitrate (128/192/320kbps), Format (mp3/wav/flac) |
| **Processing** | Server-side |

### 4. Video to GIF
| Item | Detail |
|------|--------|
| **Mô tả** | Chuyển đoạn video thành GIF |
| **Output** | .gif |
| **Options** | Start time, Duration, FPS, Width, Quality |
| **Processing** | Server-side |

### 5. MOV to MP4
| Item | Detail |
|------|--------|
| **Mô tả** | Chuyển MOV → MP4 |
| **Library** | ffmpeg (server) |
| **Processing** | Server-side |

### 6. MKV to MP4
| Item | Detail |
|------|--------|
| **Mô tả** | Chuyển MKV → MP4 |
| **Processing** | Server-side |

### 7. Extract Audio from Video
| Item | Detail |
|------|--------|
| **Mô tả** | Tách riêng audio track |
| **Output** | .mp3 / .wav |
| **Processing** | Server-side |

### 8. Resize Video
| Item | Detail |
|------|--------|
| **Mô tả** | Thay đổi độ phân giải video |
| **Presets** | 1080p → 720p / 480p / 360p |
| **Processing** | Server-side |

## Architecture Notes

Video tools **không thể** xử lý client-side 100% vì ffmpeg.wasm chậm với file >20MB.

**Giải pháp:**
1. File ≤20MB: ffmpeg.wasm (client-side) — free
2. File >20MB: Upload lên Cloud Run → xử lý với ffmpeg → R2 storage → download

**Cloud Run config:**
- Memory: 2GB
- CPU: 2 vCPU
- Timeout: 10 phút
- Region: asia-southeast1 (gần user)
