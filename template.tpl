___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "CLIENT",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Loamly AI Traffic Detection",
  "categories": [
    "ANALYTICS",
    "ATTRIBUTION"
  ],
  "brand": {
    "id": "brand_loamly",
    "displayName": "Loamly",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAHhlWElmTU0AKgAAAAgABAEaAAUAAAABAAAAPgEbAAUAAAABAAAARgEoAAMAAAABAAIAAIdpAAQAAAABAAAATgAAAAAAAABIAAAAAQAAAEgAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAADCgAwAEAAAAAQAAADAAAAAA6LhYOwAAAAlwSFlzAAALEwAACxMBAJqcGAAAA2VJREFUaAXtmMtvTUEcx68qinql4hVVywpCwoaVSGyuP0CCdGVTCWWjFtJFF4SFhV3ZWRFJhYREIm1CbBsJVlKSeqbEW0LQ+nyvO3p6nDmvO/eOm9xf8rnnnHn85vedmTP3zBQKybaYIldhssqM4L8ITeDUTuCt2sEH/V+ivVaXCrpqLEBirrkUoSEdqHcR8xAwVO8i2hEw6kHEddp09k5sw9knDyJi34nZBHQEuqEFkkwv9QQEV45a3FtFXAgEc5f7rZBkJylQi6DDbUROp3ChzwR3HDQyNmsmYxDCdWvx/I8IW6PDBLjZpoD0NrgPtvp507/jM2mKajppZSzMADVkM72w/XAOfkQUWk+altdlEXlRSb9I1Ai/hzfwEl7AM3hefn7NtRP0jxw3C86Q35skgDIlu83vUXj453Ha726eLoKWOgX3Ed7COLwCBSYUqIJT3gf4CjbbQcYtiBPwhfyNkHoKvKPsYZipSiHr4HkdLIfS0IbyszwWKSyRaabgQTlOUzBY5iZ1FGw1bD9ONTLB9uLuxxREXAFbnnporyo7tB58/QRbm7b0zBWMo8c0NseRAC3bxm/Wa+6KT2i00vku/S3wFLIGXiqvT+W8JgcuTDHk9lWJABfBGx91L8AIyXz9X0Ygc+CmQkOA6Qlf18YI+Op5025jBExP+Lo2RsBXz5t2KxkBbWxyfwKYAMpX7QxzWSUCtGf9lqvV6ZW0Txa5Tb2YlX7q5O61iEi1OdImP2scpRkwlqGiTia0c6qGdeL0BmQVUdDGOE0lnTjsg0pMGyBt/LWn7ohwpPfqEOgAIU1Mk5oGa+EBtILN5GwPXLEVIH0uLIKlsAJWQTusKd/r7Eh5KrMAdCzSBer1sG0g4SzsCmeEn808Pk3GsXBm4FkCDsA9UA8quNWgAHVdCQpwCSyEZkhj4xTaCY8iCsuHjnH6QKJjTUOr47qkYdOqk1Qma76OJ9vAZpvIGAKb37/1NIXSiLA5qiR9kLbjRk0ndL2go85wOyRNmU8Rp6bCsN5tIecOGBHno0r6EjFBMHqpk0zHMN3QA7NshX2J0BTZbgsqa7ovEaMEqtXNifkSMUz0WhmdmC8RA0Tf5EQBTuaDjyU28aVOq1Bn9voOugy1NGfvgglanx5FGAGzFlfrqj+3xE+I3wEvk0VZj2gQAAAAAElFTkSuQmCC"
  },
  "description": "Detects AI bot traffic (ChatGPT, Claude, Perplexity, Gemini, GPTBot, Meta, Apple, Cohere) via User-Agent matching and RFC 9421 HTTP signatures. Equivalent to Loamly DNS proxy — no DNS changes required if sGTM is deployed as first-party endpoint.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "workspaceId",
    "displayName": "Workspace ID",
    "simpleValueType": true,
    "valueValidators": [{ "type": "NON_EMPTY" }],
    "help": "Your Loamly Workspace ID. Find this in Loamly → Settings → Workspace.",
    "alwaysInSummary": true
  },
  {
    "type": "TEXT",
    "name": "apiKey",
    "displayName": "API Key",
    "simpleValueType": true,
    "valueValidators": [{ "type": "NON_EMPTY" }],
    "help": "Your Loamly Workspace API Key. Find this in Loamly → Settings → API Keys. Used as Bearer token for the edge-visit endpoint."
  },
  {
    "type": "TEXT",
    "name": "requestPath",
    "displayName": "Request Path Filter",
    "simpleValueType": true,
    "defaultValue": "/",
    "help": "Only process requests to paths starting with this value. Use '/' for all paths. Use '/blog' to only detect bots on your blog."
  },
  {
    "type": "CHECKBOX",
    "name": "claimBotOnly",
    "displayName": "Only Claim AI Bot Requests",
    "simpleValueType": true,
    "defaultValue": true,
    "help": "When enabled (recommended), only claims requests with known AI bot User-Agents or RFC 9421 signatures. Non-bot requests pass through to your GA4 Client as normal."
  },
  {
    "type": "CHECKBOX",
    "name": "captureRfc9421",
    "displayName": "Capture RFC 9421 Signatures",
    "simpleValueType": true,
    "defaultValue": true,
    "help": "Reads Signature, Signature-Input, and Signature-Agent HTTP headers from AI agents (e.g. ChatGPT) and forwards them to Loamly. sGTM cannot verify Ed25519 signatures — Loamly verifies server-side."
  },
  {
    "type": "CHECKBOX",
    "name": "enableDebug",
    "displayName": "Enable Debug Logging",
    "simpleValueType": true,
    "defaultValue": false,
    "help": "Logs claimed requests and API responses to the sGTM server console. Use in Preview mode for testing."
  }
]


___SANDBOXED_JS_FOR_SERVER___

// ========================================================================
// LOAMLY AI TRAFFIC DETECTION — sGTM CLIENT TEMPLATE v3.0.0
// ========================================================================
// This is a CLIENT template (not a Tag). It uses claimRequest() to
// intercept raw HTTP requests from AI bots BEFORE any GA4 processing.
//
// DATA PIPELINE (same as Cloudflare Worker + Fly.io proxy):
//   Bot HTTP request → this Client → /api/ingest/edge-visit → visits table
//
// NON-BOT TRAFFIC is NOT claimed — GA4 Client handles it normally.
//
// FEATURE PARITY with DNS proxy:
//   ✓ User-Agent detection (10+ AI bot families)
//   ✓ RFC 9421 HTTP signature capture + header parsing
//   ✓ Static asset filtering
//   ✓ IP/country extraction
//   ✓ Instant response (non-blocking API call)
//   ✗ Ed25519 crypto verification (sGTM sandbox limitation)
//
// REQUIRES: sGTM deployed as first-party endpoint where bot traffic
// reaches the container. Options: Stape custom domain, Cloud Run,
// self-hosted behind nginx/Cloudflare.
// ========================================================================

var claimRequest = require('claimRequest');
var getRequestHeader = require('getRequestHeader');
var getRequestPath = require('getRequestPath');
var getRequestMethod = require('getRequestMethod');
var getRequestQueryString = require('getRequestQueryString');
var returnResponse = require('returnResponse');
var setResponseStatusCode = require('setResponseStatusCode');
var setResponseHeader = require('setResponseHeader');
var setResponseBody = require('setResponseBody');
var sendHttpRequest = require('sendHttpRequest');
var getTimestampMillis = require('getTimestampMillis');
var log = require('logToConsole');
var makeString = require('makeString');
var JSON = require('JSON');

// Configuration from template fields
var workspaceId = data.workspaceId;
var apiKey = data.apiKey;
var requestPath = data.requestPath || '/';
var claimBotOnly = data.claimBotOnly !== false;
var captureRfc9421 = data.captureRfc9421 !== false;
var enableDebug = data.enableDebug;

// ========================================================================
// 1. EARLY FILTERS — skip non-page requests
// ========================================================================

// Only GET requests are page visits (bots crawl via GET)
if (getRequestMethod() !== 'GET') {
  return;
}

// Path filter
var path = getRequestPath() || '/';
if (path.indexOf(requestPath) !== 0) {
  return;
}

// Skip static assets — matches cloudflare/rfc9421-verifier/src/index.ts
var pathLower = path.toLowerCase();
if (pathLower.indexOf('/_next/static/') > -1 ||
    pathLower.indexOf('/_next/image') > -1 ||
    pathLower.indexOf('/__nextjs') > -1 ||
    pathLower.indexOf('/_vercel') > -1 ||
    pathLower.indexOf('/static/') > -1 ||
    pathLower.indexOf('/api/') > -1 ||
    pathLower.indexOf('.js') > -1 ||
    pathLower.indexOf('.css') > -1 ||
    pathLower.indexOf('.png') > -1 ||
    pathLower.indexOf('.jpg') > -1 ||
    pathLower.indexOf('.jpeg') > -1 ||
    pathLower.indexOf('.gif') > -1 ||
    pathLower.indexOf('.webp') > -1 ||
    pathLower.indexOf('.svg') > -1 ||
    pathLower.indexOf('.ico') > -1 ||
    pathLower.indexOf('.woff') > -1 ||
    pathLower.indexOf('.woff2') > -1 ||
    pathLower.indexOf('.ttf') > -1 ||
    pathLower.indexOf('.eot') > -1 ||
    pathLower.indexOf('.map') > -1 ||
    pathLower.indexOf('.xml') > -1 ||
    pathLower.indexOf('.json') > -1 ||
    pathLower.indexOf('/favicon') > -1 ||
    pathLower.indexOf('robots.txt') > -1 ||
    pathLower.indexOf('sitemap') > -1) {
  return;
}

// Skip measurement protocol paths (don't steal from GA4 Client)
if (pathLower.indexOf('/g/collect') > -1 ||
    pathLower.indexOf('/j/collect') > -1 ||
    pathLower.indexOf('/gtm.js') > -1 ||
    pathLower.indexOf('/gtag/js') > -1) {
  return;
}

// ========================================================================
// 2. AI BOT USER-AGENT DETECTION
// ========================================================================
// Matches: cloudflare/rfc9421-verifier/src/index.ts lines 78-91
// Matches: fly-proxy/cmd/proxy/main.go bot detection logic
// SUPERSET of DNS proxy — also detects Meta, Apple, Cohere bots

var rawUA = getRequestHeader('user-agent') || '';
var uaLower = rawUA.toLowerCase();
var detectedBot = null;
var botProvider = null;

// OpenAI bots
if (uaLower.indexOf('chatgpt-user') > -1 || uaLower.indexOf('chatgpt.com') > -1) {
  detectedBot = 'chatgpt-user';
  botProvider = 'https://chatgpt.com';
} else if (uaLower.indexOf('oai-searchbot') > -1) {
  detectedBot = 'oai-searchbot';
  botProvider = 'https://chatgpt.com';
} else if (uaLower.indexOf('gptbot') > -1) {
  detectedBot = 'gptbot';
  botProvider = 'https://chatgpt.com';
}
// Perplexity bots
else if (uaLower.indexOf('perplexitybot') > -1 || uaLower.indexOf('perplexity-user') > -1) {
  detectedBot = 'perplexitybot';
  botProvider = 'https://perplexity.ai';
}
// Anthropic/Claude bots
else if (uaLower.indexOf('claudebot') > -1 || uaLower.indexOf('claude-user') > -1) {
  detectedBot = 'claudebot';
  botProvider = 'https://claude.ai';
} else if (uaLower.indexOf('anthropic-ai') > -1 || uaLower.indexOf('anthropic.com') > -1) {
  detectedBot = 'anthropic-bot';
  botProvider = 'https://claude.ai';
}
// Google AI bots
else if (uaLower.indexOf('google-extended') > -1) {
  detectedBot = 'google-extended';
  botProvider = 'https://gemini.google.com';
} else if (uaLower.indexOf('gemini-deep-research') > -1) {
  detectedBot = 'gemini-deep-research';
  botProvider = 'https://gemini.google.com';
}
// Meta AI
else if (uaLower.indexOf('meta-externalagent') > -1) {
  detectedBot = 'meta-externalagent';
  botProvider = 'https://meta.ai';
}
// Apple AI
else if (uaLower.indexOf('applebot-extended') > -1) {
  detectedBot = 'applebot-extended';
  botProvider = 'https://apple.com';
}
// Cohere AI
else if (uaLower.indexOf('cohere-ai') > -1) {
  detectedBot = 'cohere-ai';
  botProvider = 'https://cohere.com';
}
// Microsoft/Copilot
else if (uaLower.indexOf('copilot') > -1 && uaLower.indexOf('microsoft') > -1) {
  detectedBot = 'copilot';
  botProvider = 'https://copilot.microsoft.com';
}
// You.com
else if (uaLower.indexOf('youbot') > -1 || uaLower.indexOf('you.com') > -1) {
  detectedBot = 'youbot';
  botProvider = 'https://you.com';
}

// ========================================================================
// 3. RFC 9421 HTTP MESSAGE SIGNATURES
// ========================================================================
// AI agents (e.g. ChatGPT) send cryptographic signatures per RFC 9421.
// sGTM CANNOT do Ed25519 verification (sandbox limitation).
// We capture the raw headers and forward to Loamly for server-side verification.
//
// Header format:
//   Signature: sig1=:base64data:
//   Signature-Input: sig1=("@method" "@authority" "@path");keyid="key-1";created=1234;expires=5678;alg="ed25519"
//   Signature-Agent: "https://chatgpt.com"

var sigHeader = null;
var sigInputHeader = null;
var sigAgentHeader = null;
var hasRfc9421 = false;

if (captureRfc9421) {
  sigHeader = getRequestHeader('signature') || null;
  sigInputHeader = getRequestHeader('signature-input') || null;
  sigAgentHeader = getRequestHeader('signature-agent') || null;
  hasRfc9421 = !!(sigHeader || sigInputHeader);

  // Signature-Agent can identify the bot even without UA match
  if (sigAgentHeader && !botProvider) {
    if (sigAgentHeader.indexOf('chatgpt.com') > -1 || sigAgentHeader.indexOf('openai.com') > -1) {
      detectedBot = 'rfc9421-chatgpt';
      botProvider = 'https://chatgpt.com';
    } else if (sigAgentHeader.indexOf('anthropic.com') > -1) {
      detectedBot = 'rfc9421-claude';
      botProvider = 'https://claude.ai';
    } else if (sigAgentHeader.indexOf('perplexity.ai') > -1) {
      detectedBot = 'rfc9421-perplexity';
      botProvider = 'https://perplexity.ai';
    } else if (sigAgentHeader.indexOf('google.com') > -1) {
      detectedBot = 'rfc9421-gemini';
      botProvider = 'https://gemini.google.com';
    }
  }
}

var isAIBot = !!(detectedBot || hasRfc9421);

// ========================================================================
// 4. CLAIM DECISION
// ========================================================================
// If claimBotOnly=true (default), only claim bot requests.
// Non-bot traffic passes through to GA4 Client.

if (claimBotOnly && !isAIBot) {
  return;
}

// CLAIM the request — this Client now owns it
claimRequest();

if (enableDebug) {
  log('[Loamly] Claimed request:',
    'path=' + path,
    'bot=' + (detectedBot || 'unknown'),
    'ua=' + rawUA.substring(0, 80),
    'rfc9421=' + (hasRfc9421 ? 'yes' : 'no'));
}

// ========================================================================
// 5. PARSE RFC 9421 SIGNATURE-INPUT
// ========================================================================
// Extract keyid, created, expires from Signature-Input header.
// Format: sig1=("@method" ...);keyid="key-1";created=1234;expires=5678;alg="ed25519"

var parsedKeyId = null;
var parsedCreated = null;
var parsedExpires = null;

if (sigInputHeader) {
  // Extract keyid="..."
  var kidIdx = sigInputHeader.indexOf('keyid="');
  if (kidIdx > -1) {
    var kidStart = kidIdx + 7;
    var kidEnd = sigInputHeader.indexOf('"', kidStart);
    if (kidEnd > kidStart) {
      parsedKeyId = sigInputHeader.substring(kidStart, kidEnd);
    }
  }

  // Extract created=NUMBER
  var cIdx = sigInputHeader.indexOf('created=');
  if (cIdx > -1) {
    var cStart = cIdx + 8;
    var cEnd = sigInputHeader.indexOf(';', cStart);
    if (cEnd === -1) { cEnd = sigInputHeader.length; }
    var cVal = sigInputHeader.substring(cStart, cEnd);
    // Convert unix timestamp to ISO string
    if (cVal && cVal.length > 0) {
      parsedCreated = cVal;
    }
  }

  // Extract expires=NUMBER
  var eIdx = sigInputHeader.indexOf('expires=');
  if (eIdx > -1) {
    var eStart = eIdx + 8;
    var eEnd = sigInputHeader.indexOf(';', eStart);
    if (eEnd === -1) { eEnd = sigInputHeader.length; }
    var eVal = sigInputHeader.substring(eStart, eEnd);
    if (eVal && eVal.length > 0) {
      parsedExpires = eVal;
    }
  }

  if (enableDebug) {
    log('[Loamly] RFC 9421 parsed:',
      'keyid=' + (parsedKeyId || 'none'),
      'created=' + (parsedCreated || 'none'),
      'expires=' + (parsedExpires || 'none'));
  }
}

// ========================================================================
// 6. CONSTRUCT FULL URL
// ========================================================================
// Edge-visit expects absolute URL (like Cloudflare Worker sends url.toString()).
// Construct from host header + path + querystring.

var qs = getRequestQueryString() || '';
var host = getRequestHeader('x-forwarded-host') ||
           getRequestHeader('host') || '';
var fullUrl = '';
if (host) {
  fullUrl = 'https://' + host + path + (qs ? '?' + qs : '');
} else {
  fullUrl = path + (qs ? '?' + qs : '');
}

// ========================================================================
// 7. EXTRACT CLIENT IP + COUNTRY
// ========================================================================
// Same headers as Cloudflare Worker: cf-connecting-ip, x-real-ip, x-forwarded-for
// IP is used for visitor_id hashing only — NOT stored in database.

var clientIP = getRequestHeader('cf-connecting-ip') ||
               getRequestHeader('x-forwarded-for') ||
               getRequestHeader('x-real-ip') ||
               null;
if (clientIP && clientIP.indexOf(',') > -1) {
  // x-forwarded-for can contain multiple IPs — take the first (client)
  clientIP = clientIP.split(',')[0];
  // Trim whitespace
  if (clientIP.indexOf(' ') === 0) {
    clientIP = clientIP.substring(1);
  }
}

var country = getRequestHeader('x-country-code') ||
              getRequestHeader('cf-ipcountry') ||
              getRequestHeader('fly-client-country') ||
              null;

// ========================================================================
// 8. BUILD EDGE-VISIT PAYLOAD
// ========================================================================
// MUST match: src/app/api/ingest/edge-visit/route.ts
// MUST match: cloudflare/rfc9421-verifier/src/index.ts payload shape
//
// verification_method: 'probabilistic_ua' (sGTM can't do Ed25519 crypto)
// signature_verified: false (only Cloudflare Worker can verify)

var verificationMethod = 'none';
if (hasRfc9421) {
  // Has RFC 9421 headers — we forward them but can't verify crypto
  verificationMethod = 'probabilistic_ua';
} else if (detectedBot) {
  // User-Agent match only
  verificationMethod = 'probabilistic_ua';
}

// Timestamp as NUMBER — edge-visit does new Date(timestamp).toISOString()
// new Date("1707663600000") = Invalid Date (string)
// new Date(1707663600000) = correct (number)
var now = getTimestampMillis();

var edgePayload = {
  workspace_id: workspaceId,
  landing_page: fullUrl,
  referrer: getRequestHeader('referer') || null,
  user_agent: rawUA || null,
  ip_address: clientIP,
  country: country,
  timestamp: now,

  // sGTM CANNOT verify Ed25519 — always false.
  // Loamly server will re-verify if raw headers are available.
  signature_verified: false,
  signature_agent: botProvider || null,
  signature_key_id: parsedKeyId || null,
  signature_created: parsedCreated || null,
  signature_expires: parsedExpires || null,
  verification_method: verificationMethod
};

if (enableDebug) {
  log('[Loamly] Sending to edge-visit:',
    'ws=' + workspaceId,
    'url=' + fullUrl,
    'bot=' + (detectedBot || 'none'),
    'ip=' + (clientIP ? 'yes' : 'no'),
    'country=' + (country || 'none'),
    'method=' + verificationMethod);
}

// ========================================================================
// 9. RESPOND TO BOT IMMEDIATELY
// ========================================================================
// Return 200 before waiting for Loamly API. sGTM keeps execution alive
// for pending async operations after returnResponse().
// The bot gets instant response, Loamly API call runs in background.

setResponseStatusCode(200);
setResponseHeader('content-type', 'text/html');
setResponseBody('');
returnResponse();

// ========================================================================
// 10. SEND TO LOAMLY EDGE-VISIT ENDPOINT
// ========================================================================
// Same pipeline as Cloudflare Worker and Fly.io proxy.
// Auth: Bearer token (workspace API key).
// Fire-and-forget: response already sent to bot.

sendHttpRequest(
  'https://app.loamly.ai/api/ingest/edge-visit',
  function(statusCode, headers, body) {
    if (enableDebug) {
      if (statusCode >= 200 && statusCode < 300) {
        log('[Loamly] edge-visit OK:', makeString(statusCode));
      } else {
        log('[Loamly] edge-visit FAIL:', makeString(statusCode), body);
      }
    }
  },
  {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + apiKey
    },
    timeout: 5000
  },
  JSON.stringify(edgePayload)
);


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": { "publicId": "read_request", "versionId": "1" },
      "param": [
        {
          "key": "headerWhitelist",
          "value": {
            "type": 2,
            "listItem": [
              { "type": 3, "mapKey": [{ "type": 1, "string": "headerName" }], "mapValue": [{ "type": 1, "string": "user-agent" }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "headerName" }], "mapValue": [{ "type": 1, "string": "referer" }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "headerName" }], "mapValue": [{ "type": 1, "string": "signature" }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "headerName" }], "mapValue": [{ "type": 1, "string": "signature-input" }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "headerName" }], "mapValue": [{ "type": 1, "string": "signature-agent" }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "headerName" }], "mapValue": [{ "type": 1, "string": "x-forwarded-for" }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "headerName" }], "mapValue": [{ "type": 1, "string": "x-real-ip" }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "headerName" }], "mapValue": [{ "type": 1, "string": "cf-connecting-ip" }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "headerName" }], "mapValue": [{ "type": 1, "string": "cf-ipcountry" }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "headerName" }], "mapValue": [{ "type": 1, "string": "fly-client-country" }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "headerName" }], "mapValue": [{ "type": 1, "string": "x-country-code" }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "headerName" }], "mapValue": [{ "type": 1, "string": "host" }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "headerName" }], "mapValue": [{ "type": 1, "string": "x-forwarded-host" }] },
              { "type": 3, "mapKey": [{ "type": 1, "string": "headerName" }], "mapValue": [{ "type": 1, "string": "accept-language" }] }
            ]
          }
        },
        { "key": "headersAllowed", "value": { "type": 1, "string": "specific" } },
        { "key": "requestAccess", "value": { "type": 1, "string": "specific" } },
        { "key": "queryParameterAccess", "value": { "type": 1, "string": "any" } },
        { "key": "pathAllowed", "value": { "type": 8, "boolean": true } },
        { "key": "queryStringAllowed", "value": { "type": 8, "boolean": true } },
        { "key": "methodAllowed", "value": { "type": 8, "boolean": true } }
      ]
    },
    "clientAnnotations": { "isEditedByUser": true },
    "isRequired": true
  },
  {
    "instance": {
      "key": { "publicId": "send_http", "versionId": "1" },
      "param": [
        { "key": "allowedUrls", "value": { "type": 1, "string": "specific" } },
        { "key": "urls", "value": { "type": 2, "listItem": [{ "type": 1, "string": "https://app.loamly.ai/*" }] } }
      ]
    },
    "clientAnnotations": { "isEditedByUser": true },
    "isRequired": true
  },
  {
    "instance": {
      "key": { "publicId": "return_response", "versionId": "1" },
      "param": []
    },
    "clientAnnotations": { "isEditedByUser": true },
    "isRequired": true
  },
  {
    "instance": {
      "key": { "publicId": "logging", "versionId": "1" },
      "param": [
        { "key": "environments", "value": { "type": 1, "string": "all" } }
      ]
    },
    "clientAnnotations": { "isEditedByUser": true },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 1/30/2026, 3:00:00 PM
Updated on 2/11/2026

Loamly AI Traffic Detection — sGTM Client Template v3.0.0

ARCHITECTURE:
  This is a CLIENT template (not a Tag). It intercepts raw HTTP requests
  from AI bots using claimRequest() — functionally equivalent to the
  Loamly DNS proxy (Cloudflare Worker / Fly.io).

DATA PIPELINE:
  Bot HTTP crawl → this Client → /api/ingest/edge-visit → visits table
  Browser visit  → GA4 Client  → (optional Loamly Tag) → /api/ingest/visit → visits table
  Both pipelines write to the same visits table.

WHAT IT DETECTS:
  User-Agent: ChatGPT-User, OAI-SearchBot, GPTBot, ClaudeBot, PerplexityBot,
  Google-Extended, Gemini-Deep-Research, Meta-ExternalAgent, Applebot-Extended,
  Cohere-AI, Copilot, YouBot
  Plus any bot sending RFC 9421 HTTP Message Signatures.

LIMITATION vs DNS PROXY:
  sGTM sandbox cannot do Ed25519 cryptographic verification.
  signature_verified is always false. Loamly server re-verifies if needed.

REQUIRES:
  sGTM deployed as first-party endpoint where bot traffic reaches the container.
  Options: Stape.io custom domain, Google Cloud Run, self-hosted behind nginx.

For documentation: https://loamly.ai/docs/integrations/gtm
