# Loamly Server-Side GTM Tag

Send Loamly tracking from your GTM Server Container.

## When to use this

You already have a GTM Server Container running (Stape, Cloud Run, etc). This tag sends pageviews to Loamly server-side, with access to HTTP headers for AI agent detection.

## Prerequisites

- GTM Server Container running
- GA4 Client receiving events
- Loamly workspace ID and API key

## Install

**From GTM Gallery:**

1. Open your Server Container in [tagmanager.google.com](https://tagmanager.google.com)
2. Templates → Search Gallery
3. Search "Loamly" → Add to workspace

**Create tag:**

1. Tags → New
2. Select "Loamly Analytics (Server-Side)"
3. Enter:
   - Workspace ID (Settings → Workspace in Loamly)
   - API Key (Settings → API Keys in Loamly)
4. Trigger: page_view events
5. Save → Publish

**Manual install:**

1. Download `template.tpl`
2. Templates → New → Import
3. Create tag as above

## Options

| Field | Description |
|-------|-------------|
| Workspace ID | Your Loamly workspace ID |
| API Key | Your Loamly API key |
| Event Type | Pageview or Custom Event |
| Capture RFC 9421 | Detect AI agent signatures (on by default) |
| Debug Logging | Log to server console |

## How it works

```
Browser → gtag.js → Your sGTM (ss.example.com)
                         ↓
               Loamly tag fires
                         ↓
               POST → app.loamly.ai/api/ingest/visit
```

## Verify

1. sGTM Preview mode
2. Send a pageview from your site
3. Check tag fired with status 201
4. Check [app.loamly.ai](https://app.loamly.ai) for visit

## Problems?

- Tag not firing → check trigger matches page_view
- 401 error → wrong API key
- 403 error → workspace ID doesn't match API key
- No data → wait 2 min, check sGTM debug panel

## Support

- Docs: [loamly.ai/docs](https://loamly.ai/docs)
- Email: hello@loamly.ai

## License

Apache 2.0
