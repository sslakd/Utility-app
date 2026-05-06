# Backend API Spec

## Base URL
- **Production:** `https://api.utilityapp.com`
- **Staging:** `https://staging-api.utilityapp.com`
- **Local:** `http://localhost:3000`

## Authentication

```
POST /api/auth/register
POST /api/auth/login
POST /api/auth/google
GET  /api/auth/me
```

## File Upload

```
POST /api/upload
Content-Type: multipart/form-data
Body: { file: File }
Response: { uploadId: string, url: string }
```

| Header | Giá trị |
|--------|---------|
| `Authorization` | `Bearer {token}` (optional) |
| `Content-Range` | bytes 0-1023/5000000 (cho chunked upload) |

## File Processing Endpoints

### PDF Tools
```
POST /api/pdf/merge
POST /api/pdf/compress
POST /api/pdf/split
POST /api/pdf/protect
POST /api/pdf/unlock
POST /api/pdf/rotate
POST /api/pdf/to-word
POST /api/pdf/to-excel
POST /api/pdf/to-jpg
POST /api/pdf/from-jpg
POST /api/pdf/sign
POST /api/pdf/extract-text
POST /api/pdf/translate
```

### Image Tools
```
POST /api/image/resize
POST /api/image/compress
POST /api/image/crop
POST /api/image/remove-bg
POST /api/image/upscale
POST /api/image/blur-bg
POST /api/image/collage
POST /api/image/add-text
POST /api/image/watermark
POST /api/image/filter
POST /api/image/to-text       (OCR)
POST /api/image/heic-to-jpg
POST /api/image/flip
```

### Video Tools
```
POST /api/video/compress
POST /api/video/trim
POST /api/video/mp4-to-mp3
POST /api/video/to-gif
POST /api/video/mov-to-mp4
POST /api/video/mkv-to-mp4
POST /api/video/extract-audio
POST /api/video/resize
```

### File Tools
```
POST /api/file/csv-to-excel
POST /api/file/excel-to-csv
POST /api/file/excel-to-pdf
POST /api/file/xml-to-json
POST /api/file/json-to-xml
POST /api/file/xml-to-csv
POST /api/file/split-csv
```

### AI Tools
```
POST /api/ai/grammar-fix
POST /api/ai/blog-writer
POST /api/ai/summarize
POST /api/ai/translate
POST /api/ai/chat (advanced)
```

## Request/Response Pattern

### Request (Upload & Process)
```json
{
  "uploadId": "abc123",
  "options": {
    "quality": "high",
    "format": "jpg",
    "pageSize": "A4"
  }
}
```

### Response (Sync)
```json
{
  "success": true,
  "downloadUrl": "https://r2.utilityapp.com/processed/abc123_result.pdf",
  "fileName": "result.pdf",
  "fileSize": 12345,
  "expiresIn": 86400
}
```

### Response (Async — cho processing lâu như AI/video)
```json
{
  "success": true,
  "jobId": "job_xyz",
  "status": "processing",
  "estimatedTime": 30
}
```

```
GET /api/jobs/{jobId}
Response: { status: "processing" | "completed" | "failed", downloadUrl: "..." }
```

## Rate Limiting
| Plan | Requests/hour | File size |
|------|---------------|-----------|
| Anonymous | 10 | 10MB |
| Free | 50 | 50MB |
| Premium | 500 | 200MB |

## Error Codes
| Code | Ý nghĩa |
|------|---------|
| 400 | Invalid input/options |
| 401 | Unauthorized |
| 403 | Rate limit exceeded / Not premium |
| 413 | File too large |
| 422 | File corrupted / Cannot process |
| 500 | Server error |
| 504 | Processing timeout |
