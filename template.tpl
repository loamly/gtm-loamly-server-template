___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 2,
  "securityGroups": [],
  "displayName": "Loamly Analytics (Server-Side)",
  "categories": [
    "ANALYTICS",
    "ATTRIBUTION"
  ],
  "brand": {
    "id": "brand_loamly",
    "displayName": "Loamly",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAHhlWElmTU0AKgAAAAgABAEaAAUAAAABAAAAPgEbAAUAAAABAAAARgEoAAMAAAABAAIAAIdpAAQAAAABAAAATgAAAAAAAABIAAAAAQAAAEgAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAADCgAwAEAAAAAQAAADAAAAAA6LhYOwAAAAlwSFlzAAALEwAACxMBAJqcGAAAA2VJREFUaAXtmMtvTUEcx68qinql4hVVywpCwoaVSGyuP0CCdGVTCWWjFtJFF4SFhV3ZWRFJhYREIm1CbBsJVlKSeqbEW0LQ+nyvO3p6nDmvO/eOm9xf8rnnnHn85vedmTP3zBQKybaYIldhssqM4L8ITeDUTuCt2sEH/V+ivVaXCrpqLEBirrkUoSEdqHcR8xAwVO8i2hEw6kHEddp09k5sw9knDyJi34nZBHQEuqEFkkwv9QQEV45a3FtFXAgEc5f7rZBkJylQi6DDbUROp3ChzwR3HDQyNmsmYxDCdWvx/I8IW6PDBLjZpoD0NrgPtvp507/jM2mKajppZSzMADVkM72w/XAOfkQUWk+altdlEXlRSb9I1Ai/hzfwEl7AM3hefn7NtRP0jxw3C86Q35skgDIlu83vUXj453Ha726eLoKWOgX3Ed7COLwCBSYUqIJT3gf4CjbbQcYtiBPwhfyNkHoKvKPsYZipSiHr4HkdLIfS0IbyszwWKSyRaabgQTlOUzBY5iZ1FGw1bD9ONTLB9uLuxxREXAFbnnporyo7tB58/QRbm7b0zBWMo8c0NseRAC3bxm/Wa+6KT2i00vku/S3wFLIGXiqvT+W8JgcuTDHk9lWJABfBGx91L8AIyXz9X0Ygc+CmQkOA6Qlf18YI+Op5025jBExP+Lo2RsBXz5t2KxkBbWxyfwKYAMpX7QxzWSUCtGf9lqvV6ZW0Txa5Tb2YlX7q5O61iEi1OdImP2scpRkwlqGiTia0c6qGdeL0BmQVUdDGOE0lnTjsg0pMGyBt/LWn7ohwpPfqEOgAIU1Mk5oGa+EBtILN5GwPXLEVIH0uLIKlsAJWQTusKd/r7Eh5KrMAdCzSBer1sG0g4SzsCmeEn808Pk3GsXBm4FkCDsA9UA8quNWgAHVdCQpwCSyEZkhj4xTaCY8iCsuHjnH6QKJjTUOr47qkYdOqk1Qma76OJ9vAZpvIGAKb37/1NIXSiLA5qiR9kLbjRk0ndL2go85wOyRNmU8Rp6bCsN5tIecOGBHno0r6EjFBMHqpk0zHMN3QA7NshX2J0BTZbgsqa7ovEaMEqtXNifkSMUz0WhmdmC8RA0Tf5EQBTuaDjyU28aVOq1Bn9voOugy1NGfvgglanx5FGAGzFlfrqj+3xE+I3wEvk0VZj2gQAAAAAElFTkSuQmCC"
  },
  "description": "Track pageviews, detect AI bots via User-Agent, and capture RFC 9421 signatures from ChatGPT, Claude, Perplexity, and Gemini.",
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
    "help": "Your Loamly Workspace ID. Find this in Loamly Settings → Workspace.",
    "alwaysInSummary": true
  },
  {
    "type": "TEXT",
    "name": "apiKey",
    "displayName": "API Key",
    "simpleValueType": true,
    "valueValidators": [{ "type": "NON_EMPTY" }],
    "help": "Your Loamly Public API Key. Find this in Loamly Settings → API Keys."
  },
  {
    "type": "SELECT",
    "name": "eventType",
    "displayName": "Event Type",
    "simpleValueType": true,
    "defaultValue": "pageview",
    "selectItems": [
      { "value": "pageview", "displayValue": "Pageview" },
      { "value": "event", "displayValue": "Custom Event" }
    ],
    "help": "The type of event to send to Loamly."
  },
  {
    "type": "CHECKBOX",
    "name": "captureRfc9421",
    "displayName": "Capture RFC 9421 Signatures",
    "simpleValueType": true,
    "defaultValue": true,
    "help": "Reads Signature and Signature-Input HTTP headers from AI agents and forwards them to Loamly for verification."
  },
  {
    "type": "CHECKBOX",
    "name": "detectBotUa",
    "displayName": "Detect AI Bot User-Agents",
    "simpleValueType": true,
    "defaultValue": true,
    "help": "Checks the raw HTTP User-Agent header for known AI bots (ChatGPT-User, ClaudeBot, PerplexityBot, GPTBot, Googlebot-Extended, Gemini-Deep-Research)."
  },
  {
    "type": "CHECKBOX",
    "name": "enableDebug",
    "displayName": "Enable Debug Logging",
    "simpleValueType": true,
    "defaultValue": false,
    "help": "Logs debug information to the sGTM server console."
  }
]


___SANDBOXED_JS_FOR_SERVER___

const sendHttpRequest = require('sendHttpRequest');
const getEventData = require('getEventData');
const getRequestHeader = require('getRequestHeader');
const getTimestampMillis = require('getTimestampMillis');
const JSON = require('JSON');
const makeString = require('makeString');
const generateRandom = require('generateRandom');
const log = require('logToConsole');

// Configuration from template fields
const workspaceId = data.workspaceId;
const apiKey = data.apiKey;
const eventType = data.eventType || 'pageview';
const captureRfc9421 = data.captureRfc9421;
const detectBotUa = data.detectBotUa;
const enableDebug = data.enableDebug;

// ========================================================================
// 1. READ RAW HTTP HEADERS (the whole point of server-side tracking)
// ========================================================================
const rawUserAgent = getRequestHeader('user-agent') || '';
const rawReferer = getRequestHeader('referer') || '';

// ========================================================================
// 2. AI BOT USER-AGENT DETECTION
// ========================================================================
// Matches: cloudflare/rfc9421-verifier/src/index.ts lines 80-91
// Matches: fly-proxy/cmd/proxy/main.go bot detection logic
var detectedBot = null;
var botProvider = null;

if (detectBotUa && rawUserAgent) {
  var uaLower = rawUserAgent.toLowerCase();
  if (uaLower.indexOf('chatgpt-user') > -1 || uaLower.indexOf('chatgpt.com') > -1) {
    detectedBot = 'chatgpt-user';
    botProvider = 'https://chatgpt.com';
  } else if (uaLower.indexOf('gptbot') > -1) {
    detectedBot = 'gptbot';
    botProvider = 'https://chatgpt.com';
  } else if (uaLower.indexOf('perplexitybot') > -1 || uaLower.indexOf('perplexity-user') > -1) {
    detectedBot = 'perplexitybot';
    botProvider = 'https://perplexity.ai';
  } else if (uaLower.indexOf('claudebot') > -1 || uaLower.indexOf('claude-user') > -1) {
    detectedBot = 'claudebot';
    botProvider = 'https://claude.ai';
  } else if (uaLower.indexOf('anthropic-ai') > -1 || uaLower.indexOf('anthropic.com') > -1) {
    detectedBot = 'anthropic-bot';
    botProvider = 'https://claude.ai';
  } else if (uaLower.indexOf('google-extended') > -1) {
    detectedBot = 'google-extended';
    botProvider = 'https://gemini.google.com';
  } else if (uaLower.indexOf('gemini-deep-research') > -1) {
    detectedBot = 'gemini-deep-research';
    botProvider = 'https://gemini.google.com';
  } else if (uaLower.indexOf('meta-externalagent') > -1) {
    detectedBot = 'meta-externalagent';
    botProvider = 'https://meta.ai';
  } else if (uaLower.indexOf('applebot-extended') > -1) {
    detectedBot = 'applebot-extended';
    botProvider = 'https://apple.com';
  } else if (uaLower.indexOf('cohere-ai') > -1) {
    detectedBot = 'cohere-ai';
    botProvider = 'https://cohere.com';
  }
}

if (enableDebug && detectedBot) {
  log('[Loamly sGTM] AI bot detected:', detectedBot, 'provider:', botProvider);
}

// ========================================================================
// 3. RFC 9421 HTTP MESSAGE SIGNATURES
// ========================================================================
// MUST be structured object to match /api/ingest/visit expected shape
// Reference: src/app/api/ingest/visit/route.ts lines 842-843
var rfc9421Signature = null;

if (captureRfc9421) {
  var sigHeader = getRequestHeader('signature');
  var sigInputHeader = getRequestHeader('signature-input');
  var sigAgentHeader = getRequestHeader('signature-agent');

  if (sigHeader || sigInputHeader) {
    rfc9421Signature = {
      signature: sigHeader || null,
      signature_input: sigInputHeader || null,
      signature_agent: sigAgentHeader || null
    };
    if (enableDebug) {
      log('[Loamly sGTM] RFC 9421 captured:',
        'sig=' + (sigHeader ? 'yes' : 'no'),
        'input=' + (sigInputHeader ? 'yes' : 'no'),
        'agent=' + (sigAgentHeader || 'none'));
    }
    if (sigAgentHeader && !botProvider) {
      if (sigAgentHeader.indexOf('chatgpt.com') > -1 || sigAgentHeader.indexOf('openai.com') > -1) {
        botProvider = 'https://chatgpt.com';
        detectedBot = 'rfc9421-chatgpt';
      } else if (sigAgentHeader.indexOf('anthropic.com') > -1) {
        botProvider = 'https://claude.ai';
        detectedBot = 'rfc9421-claude';
      } else if (sigAgentHeader.indexOf('perplexity.ai') > -1) {
        botProvider = 'https://perplexity.ai';
        detectedBot = 'rfc9421-perplexity';
      } else if (sigAgentHeader.indexOf('google.com') > -1) {
        botProvider = 'https://gemini.google.com';
        detectedBot = 'rfc9421-gemini';
      }
    }
  }
}

// ========================================================================
// 4. EXTRACT GA4 EVENT DATA (standard browser traffic)
// ========================================================================
var clientId = getEventData('client_id') || '';
var sessionId = getEventData('ga_session_id') || getEventData('session_id') || '';
var pageUrl = getEventData('page_location') || '';
var pageTitle = getEventData('page_title') || '';
var pageReferrer = getEventData('page_referrer') || rawReferer || '';
var eventName = getEventData('event_name') || 'page_view';
var language = getEventData('language') || '';
var userAgent = rawUserAgent || getEventData('user_agent') || '';

var utmSource = getEventData('utm_source') || getEventData('campaign_source') || null;
var utmMedium = getEventData('utm_medium') || getEventData('campaign_medium') || null;
var utmCampaign = getEventData('utm_campaign') || getEventData('campaign_name') || null;
var utmTerm = getEventData('utm_term') || getEventData('campaign_term') || null;
var utmContent = getEventData('utm_content') || getEventData('campaign_content') || null;

var screenResolution = getEventData('screen_resolution') || '';
var screenWidth = null;
var screenHeight = null;
if (screenResolution && screenResolution.indexOf('x') > -1) {
  var parts = screenResolution.split('x');
  screenWidth = parts[0] || null;
  screenHeight = parts[1] || null;
}

// ========================================================================
// 5. BUILD IDEMPOTENCY KEY + EXTRACT PAGE PATH
// ========================================================================
var timestamp = getTimestampMillis();
var random = generateRandom(100000, 999999);
var idempotencyKey = 'sgtm:' + (clientId || 'bot') + ':' + makeString(timestamp) + ':' + makeString(random);

var pagePath = '/';
if (pageUrl) {
  var u = pageUrl;
  if (u.indexOf('https://') === 0) { u = u.substring(8); }
  else if (u.indexOf('http://') === 0) { u = u.substring(7); }
  var ps = u.indexOf('/');
  if (ps > -1) {
    var pwq = u.substring(ps);
    var qs = pwq.indexOf('?');
    pagePath = qs > -1 ? pwq.substring(0, qs) : pwq;
  }
}

// ========================================================================
// 6. BUILD PAYLOAD — matches /api/ingest/visit shape
// ========================================================================
var payload = {
  workspace_id: workspaceId,
  visitor_id: clientId || ('sgtm-bot-' + makeString(random)),
  session_id: makeString(sessionId),
  page_url: pageUrl,
  page_path: pagePath,
  referrer: pageReferrer || null,
  title: pageTitle || null,
  utm_source: utmSource,
  utm_medium: utmMedium,
  utm_campaign: utmCampaign,
  utm_term: utmTerm,
  utm_content: utmContent,
  user_agent: userAgent,
  screen_width: screenWidth,
  screen_height: screenHeight,
  language: language || null,
  tracker_version: 'sgtm-2.0.0',
  event_type: eventType,
  event_name: eventName,
  timestamp: makeString(timestamp),
  rfc9421_signature: rfc9421Signature,
  idempotency_key: idempotencyKey,
  sgtm_client: getEventData('x-sgtm-client') || 'GA4',
  detected_bot: detectedBot,
  bot_provider: botProvider
};

if (enableDebug) {
  log('[Loamly sGTM] Sending to /api/ingest/visit:',
    'ws=' + workspaceId, 'url=' + pageUrl,
    'bot=' + (detectedBot || 'none'), 'v=sgtm-2.0.0');
}

// ========================================================================
// 7. SEND TO LOAMLY — /api/ingest/visit (browser traffic endpoint)
// ========================================================================
sendHttpRequest(
  'https://app.loamly.ai/api/ingest/visit',
  function(statusCode, headers, body) {
    if (statusCode >= 200 && statusCode < 300) {
      if (enableDebug) { log('[Loamly sGTM] OK:', makeString(statusCode)); }
      data.gtmOnSuccess();
    } else {
      if (enableDebug) { log('[Loamly sGTM] FAIL:', makeString(statusCode), body); }
      data.gtmOnFailure();
    }
  },
  {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-Loamly-Api-Key': apiKey,
      'X-Idempotency-Key': idempotencyKey
    },
    timeout: 5000
  },
  JSON.stringify(payload)
);


___SERVER_PERMISSIONS___

[
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
      "key": { "publicId": "read_event_data", "versionId": "1" },
      "param": [
        { "key": "eventDataAccess", "value": { "type": 1, "string": "any" } }
      ]
    },
    "clientAnnotations": { "isEditedByUser": true },
    "isRequired": true
  },
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
              { "type": 3, "mapKey": [{ "type": 1, "string": "headerName" }], "mapValue": [{ "type": 1, "string": "signature-agent" }] }
            ]
          }
        },
        { "key": "headersAllowed", "value": { "type": 1, "string": "specific" } }
      ]
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

Loamly Analytics Server-Side GTM Tag v2.0.0

Data pipeline: GA4 browser events → /api/ingest/visit → visits table
(Same pipeline as client-side t.js tracker)

BREAKING CHANGES from v1:
- rfc9421_signature is now a structured object {signature, signature_input, signature_agent}
- tracker_version bumped to "sgtm-2.0.0"
- Added read_request permission for getRequestHeader()
- Added logging permission for debug mode

Detects: ChatGPT-User, GPTBot, ClaudeBot, PerplexityBot, Googlebot-Extended,
Gemini-Deep-Research, Meta-ExternalAgent, Applebot-Extended, Cohere-AI

For documentation: https://loamly.ai/docs/integrations/gtm
