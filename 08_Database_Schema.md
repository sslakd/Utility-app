# Database Schema

## Supabase (PostgreSQL)

### users
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email TEXT UNIQUE,
  name TEXT,
  avatar_url TEXT,
  auth_provider TEXT DEFAULT 'email', -- 'google' | 'email' | 'apple'
  plan TEXT DEFAULT 'free',           -- 'free' | 'premium'
  plan_expires_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

### files
```sql
CREATE TABLE files (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  original_name TEXT NOT NULL,
  storage_key TEXT NOT NULL,         -- path in R2
  file_size BIGINT NOT NULL,         -- bytes
  mime_type TEXT,
  category TEXT,                     -- 'pdf' | 'image' | 'video' | 'file'
  status TEXT DEFAULT 'pending',     -- 'pending' | 'processing' | 'completed' | 'failed'
  expires_at TIMESTAMPTZ DEFAULT NOW() + INTERVAL '7 days',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_files_user_id ON files(user_id);
CREATE INDEX idx_files_status ON files(status);
```

### file_uploads (anonymous users)
```sql
CREATE TABLE file_uploads (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  session_id TEXT,                   -- anonymous session ID
  storage_key TEXT NOT NULL,
  original_name TEXT,
  file_size BIGINT,
  mime_type TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ DEFAULT NOW() + INTERVAL '24 hours'
);

CREATE INDEX idx_file_uploads_session ON file_uploads(session_id);
```

### processing_jobs
```sql
CREATE TABLE processing_jobs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  file_id UUID REFERENCES files(id),
  tool TEXT NOT NULL,                -- e.g. 'pdf/merge', 'image/remove-bg'
  status TEXT DEFAULT 'queued',      -- 'queued' | 'processing' | 'completed' | 'failed'
  progress INT DEFAULT 0,            -- 0-100
  result_key TEXT,                   -- R2 key of result file
  error_message TEXT,
  estimated_time_seconds INT,
  started_at TIMESTAMPTZ,
  completed_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_jobs_user ON processing_jobs(user_id);
CREATE INDEX idx_jobs_status ON processing_jobs(status);
```

### tool_usage (rate limiting)
```sql
CREATE TABLE tool_usage (
  id SERIAL PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  session_id TEXT,                   -- fallback for anonymous
  tool TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_usage_user ON tool_usage(user_id);
CREATE INDEX idx_usage_session ON tool_usage(session_id);
CREATE INDEX idx_usage_time ON tool_usage(created_at);
```

### subscriptions
```sql
CREATE TABLE subscriptions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id) UNIQUE,
  stripe_subscription_id TEXT UNIQUE,
  stripe_customer_id TEXT,
  status TEXT DEFAULT 'active',      -- 'active' | 'canceled' | 'past_due'
  plan TEXT DEFAULT 'premium',
  current_period_start TIMESTAMPTZ,
  current_period_end TIMESTAMPTZ,
  canceled_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

## Firebase Firestore (Mobile sync)

**Collection: `users/{userId}`**
```json
{
  "email": "user@example.com",
  "name": "User Name",
  "plan": "free",
  "planExpiresAt": null,
  "createdAt": "2026-05-06T00:00:00Z"
}
```

**Collection: `files/{fileId}`**
```json
{
  "userId": "uid123",
  "originalName": "document.pdf",
  "storageKey": "uploads/uid123/1712312312_document.pdf",
  "fileSize": 12345,
  "mimeType": "application/pdf",
  "category": "pdf",
  "status": "completed",
  "expiresAt": "2026-05-13T00:00:00Z",
  "createdAt": "2026-05-06T00:00:00Z"
}
```

**Collection: `usage/{usageId}`**
```json
{
  "userId": "uid123",
  "tool": "pdf/merge",
  "timestamp": "2026-05-06T00:00:00Z"
}
```
