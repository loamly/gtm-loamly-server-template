# Loamly AI Traffic Detection — sGTM Client Template

Detect AI bot crawlers (ChatGPT, Claude, Perplexity, Gemini, GPTBot, Meta, Apple, Cohere) directly in your Google Tag Manager Server Container. No DNS changes required.

## What this does

This is an sGTM **Client template** that intercepts raw HTTP requests from AI bots before they reach your GA4 pipeline. It uses `claimRequest()` to grab bot traffic at the HTTP level — the same approach as the Loamly DNS proxy (Cloudflare Worker / Fly.io), but running inside your existing sGTM container.

**Detected bots:**

| Bot | User-Agent pattern | Provider |
|---|---|---|
| ChatGPT browsing | `ChatGPT-User` | OpenAI |
| ChatGPT search | `OAI-SearchBot` | OpenAI |
| GPTBot (training) | `GPTBot` | OpenAI |
| ClaudeBot | `ClaudeBot`, `Claude-User` | Anthropic |
| PerplexityBot | `PerplexityBot`, `Perplexity-User` | Perplexity |
| Google Extended | `Google-Extended` | Google |
| Gemini Deep Research | `Gemini-Deep-Research` | Google |
| Meta AI | `Meta-ExternalAgent` | Meta |
| Applebot Extended | `Applebot-Extended` | Apple |
| Cohere AI | `Cohere-AI` | Cohere |
| Microsoft Copilot | `Copilot` + `Microsoft` | Microsoft |
| You.com | `YouBot` | You.com |

Plus any bot sending **RFC 9421 HTTP Message Signatures** (e.g. ChatGPT's cryptographic request signing).

## How it works

```
AI bot crawls your site (GET /pricing)
        ↓
   Your sGTM endpoint (ss.example.com)
        ↓
   Loamly Client claims the request
   (reads User-Agent + RFC 9421 headers)
        ↓
   Returns 200 to bot immediately
        ↓
   POST → app.loamly.ai/api/ingest/edge-visit (async, non-blocking)
        ↓
   Same visits table as DNS proxy + client-side tracker
```

Non-bot browser traffic is **not claimed** — your GA4 Client handles it normally.

## Prerequisites

- GTM Server Container running (Stape, Cloud Run, self-hosted, etc.)
- Loamly workspace with API key
- **Important:** Bot traffic must reach your sGTM endpoint. This works when:
  - Your sGTM runs on a custom domain that receives all site traffic (e.g. Stape custom domain)
  - Your sGTM is behind a reverse proxy that routes all traffic through it
  - Bots are explicitly directed to your sGTM endpoint

## Install

### From GTM Gallery

1. Open your **Server Container** in [tagmanager.google.com](https://tagmanager.google.com)
2. Go to **Templates** → **Search Gallery**
3. Search **"Loamly"** → Add to workspace
4. Go to **Clients** → **New**
5. Select **"Loamly AI Traffic Detection"**
6. Enter your **Workspace ID** and **API Key** (from Loamly → Settings)
7. Save → **Publish**

### Manual install

1. Download [`template.tpl`](https://raw.githubusercontent.com/loamly/gtm-loamly-server-template/main/template.tpl)
2. In your Server Container: **Templates** → **New** → **Import**
3. Create a new **Client** using the imported template
4. Enter your Workspace ID and API Key
5. Save → Publish

## Configuration

| Field | Default | Description |
|---|---|---|
| **Workspace ID** | (required) | Your Loamly workspace ID. Find in Loamly → Settings → Workspace. |
| **API Key** | (required) | Your Loamly workspace API key. Find in Loamly → Settings → API Keys. |
| **Request Path Filter** | `/` | Only process paths starting with this. Use `/` for all, `/blog` for blog only. |
| **Only Claim AI Bot Requests** | ✅ On | Recommended. Only claims bot traffic. Non-bot requests pass to GA4 as normal. |
| **Capture RFC 9421 Signatures** | ✅ On | Reads Signature, Signature-Input, Signature-Agent headers from AI agents. |
| **Debug Logging** | Off | Logs to sGTM console. Enable in Preview mode for testing. |

## Architecture comparison

| Feature | Client-side GTM | sGTM (this template) | DNS proxy |
|---|---|---|---|
| Browser pageviews | ✅ | ✅ (via GA4 Client) | ✅ |
| AI referrer detection | ✅ | ✅ (via GA4 Client) | ✅ |
| Raw bot crawl detection | ❌ | ✅ | ✅ |
| RFC 9421 signature capture | ❌ | ✅ | ✅ |
| Ed25519 crypto verification | ❌ | ❌ | ✅ |
| Requires DNS changes | No | No | Yes |
| Requires sGTM | No | Yes | No |

## Verify it works

1. Open **sGTM Preview mode**
2. Send a test request with an AI bot User-Agent:
   ```bash
   curl -H "User-Agent: Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko); compatible; ChatGPT-User/1.0; +https://openai.com/bot" \
     https://your-sgtm-domain.com/any-page
   ```
3. In Preview, verify:
   - The Loamly Client **claimed** the request
   - Debug log shows `[Loamly] Claimed request: path=/ bot=chatgpt-user`
   - API response shows `edge-visit OK: 201`
4. Check [app.loamly.ai](https://app.loamly.ai) for the bot visit

## FAQ

**Q: Does this replace the DNS proxy?**
A: For User-Agent detection, yes — it detects the same bots. The DNS proxy additionally provides Ed25519 cryptographic verification of RFC 9421 signatures, which sGTM cannot do (sandbox limitation). For most customers, UA detection catches 95%+ of AI bot traffic.

**Q: Will this break my GA4 tracking?**
A: No. With "Only Claim AI Bot Requests" enabled (default), non-bot traffic passes through to your GA4 Client unchanged. The template only claims requests with known AI bot User-Agents or RFC 9421 signature headers.

**Q: Which bots does this NOT detect?**
A: Bots that don't identify themselves via User-Agent (stealth crawlers). These are rare among major AI providers — ChatGPT, Claude, Perplexity, and Gemini all use identifiable User-Agents.

**Q: Does this work with Stape?**
A: Yes. If your Stape sGTM runs on a custom domain that receives site traffic, this template will detect bots hitting that domain.

## Troubleshooting

| Problem | Fix |
|---|---|
| Client not claiming requests | Check bot UA is in the request. Enable Debug Logging and check sGTM console. |
| 401 from edge-visit | Wrong API key. Use the workspace API key from Loamly Settings. |
| 403 from edge-visit | Workspace ID doesn't match the API key's workspace. |
| No data in Loamly | Verify the bot request actually reaches your sGTM endpoint. Check your sGTM domain setup. |
| GA4 events stopped | Disable "Only Claim AI Bot Requests" was unchecked — re-enable it. |

## Support

- **Docs:** [loamly.ai/docs/integrations/gtm](https://loamly.ai/docs/integrations/gtm)
- **Email:** hello@loamly.ai

## License

Apache 2.0
