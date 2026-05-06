# Mobile App Spec (Flutter)

## Tổng quan
- **Framework:** Flutter 3.x (Dart)
- **State Management:** Riverpod hoặc Bloc
- **Target:** iOS 15+ | Android 8+
- **Architecture:** Clean Architecture

## Project Structure
```
lib/
├── core/
│   ├── constants/        # API URLs, colors, strings
│   ├── theme/            # Dark/Light theme
│   ├── network/          # Dio HTTP client
│   ├── storage/          # Local storage (Hive/SharedPrefs)
│   └── utils/            # Helpers
├── data/
│   ├── models/           # Data models
│   ├── repositories/     # Data layer
│   ├── datasources/      # Remote (API) + Local (Hive)
│   └── providers/        # Riverpod providers
├── domain/
│   ├── entities/
│   ├── repositories/     # Abstract interfaces
│   └── usecases/         # Business logic
├── presentation/
│   ├── home/             # Home screen
│   ├── tools/            # Tool screens (PDF/Image/Video/AI)
│   ├── auth/             # Login/Register
│   ├── profile/          # User profile
│   ├── premium/          # Premium/Pricing
│   ├── history/          # File history
│   └── widgets/          # Shared widgets
└── main.dart
```

## Navigation Structure
```
BottomNav
├── Home (tool grid categories)
├── Recent (history)
├── Premium (pricing)
└── Profile (auth/settings)

Tool Categories
├── PDF Tools (12 tools)
│   └── ToolScreen (Merge, Split, Compress...)
├── Image Tools (15 tools)
│   └── ToolScreen (Resize, Crop, BG Remove...)
├── Video Tools (8 tools)
│   └── ToolScreen (Compress, Trim, Convert...)
├── File Tools (7 tools)
│   └── ToolScreen (CSV↔Excel, XML↔JSON...)
└── AI Tools (7 tools)
    └── ToolScreen (OCR, Grammar, Write...)
```

## Key Packages
| Chức năng | Package |
|-----------|---------|
| HTTP client | `dio` |
| State management | `riverpod` / `flutter_bloc` |
| File picker | `file_picker` |
| Camera | `image_picker`, `camera` |
| PDF | `pdfrx` (viewer), `syncfusion_flutter_pdf` (edit) |
| Image | `image_cropper`, `flutter_image_compress` |
| Video | `ffmpeg_kit_flutter` (nếu implement) |
| Auth | `firebase_auth`, `google_sign_in` |
| Database | `cloud_firestore` |
| Local storage | `hive` (cache), `shared_preferences` |
| Analytics | `firebase_analytics`, `firebase_crashlytics` |
| Payment | `revenuecat` (subscriptions) |
| Share | `share_plus` |
| SVG | `flutter_svg` |
| Charts | `fl_chart` |
| OCR | `google_mlkit_text_recognition` |

## Key Screens

### Home Screen
- Grid layout: Categories (PDF / Image / Video / File / AI)
- Mỗi category hiển thị 4 tools phổ biến, "See all"
- Search bar tìm tool
- Banner premium

### Tool Screen (dùng chung pattern)
```
AppBar (tool name)
├── Upload button / Camera button
├── Processing indicator
├── Preview (thumbnail / text preview)
├── Options panel (quality, format, etc.)
└── Download / Share button
```

### Premium Screen
- Plan comparison table
- Subscribe button (RevenueCat)
- Restore purchases

### History Screen
- List files đã xử lý (thumbnail + name + date)
- Swipe to delete
- Filter by category
- Premium: filter + search

## Offline Strategy
- **Cache processed files:** Hive local storage
- **Pending operations:** Queue cơ bản, xử lý khi online
- **Dark mode:** Hive persistence

## Push Notifications (optional)
- Processing complete notification (cho job lâu)
- Premium expiry reminder
- Marketing (optional)

## App Config
| Key | Value |
|-----|-------|
| App name | SwissKnife / UtilityApp |
| Package | com.vmo.utilityapp |
| Min iOS | 15.0 |
| Min Android | 8.0 (API 26) |
| Orientation | Portrait (chính) + Landscape (video/image) |
| Localization | EN + JP + VI |
