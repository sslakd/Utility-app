# File Converters Spec

## Overview
Chuyển đổi giữa các định dạng file văn phòng phổ biến.

## Tool List

### 1. CSV to Excel
| Item | Detail |
|------|--------|
| **Mô tả** | Chuyển CSV → XLSX |
| **Input** | .csv file |
| **Output** | .xlsx |
| **Library** | Sheet.js (WASM) / openpyxl (server Python) |
| **Processing** | Client-side |
| **Options** | Delimiter (comma/tab/semicolon), Encoding (UTF-8/SJIS), Auto-detect headers |
| **UI** | Preview table trước khi convert |

### 2. Excel to CSV
| Item | Detail |
|------|--------|
| **Mô tả** | Chuyển XLSX → CSV |
| **Input** | .xlsx / .xls |
| **Output** | .csv |
| **Library** | Sheet.js (WASM) |
| **Options** | Select sheet, Delimiter, Encoding |
| **Processing** | Client-side |

### 3. Excel to PDF
| Item | Detail |
|------|--------|
| **Mô tả** | Chuyển Excel → PDF |
| **Input** | .xlsx |
| **Output** | .pdf |
| **Library** | Server-side (LibreOffice headless) |
| **Processing** | Server-side |
| **Options** | Page layout (portrait/landscape), Fit to page |

### 4. XML to JSON / JSON to XML
| Item | Detail |
|------|--------|
| **Mô tả** | Chuyển đổi XML ↔ JSON |
| **Library** | xml2js / fast-xml-parser (WASM) |
| **Processing** | Client-side |
| **UI** | Code editor (Monaco) + Preview |

### 5. XML to CSV / CSV to XML
| Item | Detail |
|------|--------|
| **Mô tả** | Chuyển XML ↔ CSV |
| **Processing** | Client-side |

### 6. Split CSV / Split Excel
| Item | Detail |
|------|--------|
| **Mô tả** | Chia file CSV/Excel thành nhiều file nhỏ |
| **Options** | By number of rows, By column value |
| **Processing** | Client-side |
| **Limit** | Free: ≤10k rows, Premium: unlimited |

