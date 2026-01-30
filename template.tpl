___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Loamly Analytics (Server-Side)",
  "categories": [
    "ANALYTICS",
    "ATTRIBUTION"
  ],
  "brand": {
    "id": "brand_dummy",
    "displayName": "Loamly",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAHhlWElmTU0AKgAAAAgABAEaAAUAAAABAAAAPgEbAAUAAAABAAAARgEoAAMAAAABAAIAAIdpAAQAAAABAAAATgAAAAAAAABIAAAAAQAAAEgAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAADCgAwAEAAAAAQAAADAAAAAA6LhYOwAAAAlwSFlzAAALEwAACxMBAJqcGAAAA2VJREFUaAXtmMtvTUEcx68qinql4hVVywpCwoaVSGyuP0CCdGVTCWWjFtJFF4SFhV3ZWRFJhYREIm1CbBsJVlKSeqbEW0LQ+nyvO3p6nDmvO/eOm9xf8rnnnHn85vedmTP3zBQKybaYIldhssqM4L8ITeDUTuCt2sEH/V+ivVaXCrpqLEBirrkUoSEdqHcR8xAwVO8i2hEw6kHEddp09k5sw9knDyJi34nZBHQEuqEFkkwv9QQEV45a3FtFXAgEc5f7rZBkJylQi6DDbUROp3ChzwR3HDQyNmsmYxDCdWvx/I8IW6PDBLjZpoD0NrgPtvp507/jM2mKajppZSzMADVkM72w/XAOfkQUWk+altdlEXlRSb9I1Ai/hzfwEl7AM3hefn7NtRP0jxw3C86Q35skgDIlu83vUXj453Ha726eLoKWOgX3Ed7COLwCBSYUqIJT3gf4CjbbQcYtiBPwhfyNkHoKvKPsYZipSiHr4HkdLIfS0IbyszwWKSyRaabgQTlOUzBY5iZ1FGw1bD9ONTLB9uLuxxREXAFbnnporyo7tB58/QRbm7b0zBWMo8c0NseRAC3bxm/Wa+6KT2i00vku/S3wFLIGXiqvT+W8JgcuTDHk9lWJABfBGx91L8AIyXz9X0Ygc+CmQkOA6Qlf18YI+Op5025jBExP+Lo2RsBXz5t2KxkBbWxyfwKYAMpX7QxzWSUCtGf9lqvV6ZW0Txa5Tb2YlX7q5O61iEi1OdImP2scpRkwlqGiTia0c6qGdeL0BmQVUdDGOE0lnTjsg0pMGyBt/LWn7ohwpPfqEOgAIU1Mk5oGa+EBtILN5GwPXLEVIH0uLIKlsAJWQTusKd/r7Eh5KrMAdCzSBer1sG0g4SzsCmeEn808Pk3GsXBm4FkCDsA9UA8quNWgAHVdCQpwCSyEZkhj4xTaCY8iCsuHjnH6QKJjTUOr47qkYdOqk1Qma76OJ9vAZpvIGAKb37/1NIXSiLA5qiR9kLbjRk0ndL2go85wOyRNmU8Rp6bCsN5tIecOGBHno0r6EjFBMHqpk0zHMN3QA7NshX2J0BTZbgsqa7ovEaMEqtXNifkSMUz0WhmdmC8RA0Tf5EQBTuaDjyU28aVOq1Bn9voOugy1NGfvgglanx5FGAGzFlfrqj+3xE+I3wEvk0VZj2gQAAAAAElFTkSuQmCC"
  },
  "description": "Send pageviews to Loamly server-side. Detects AI agents via HTTP headers.",
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
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Your Loamly Workspace ID. Find this in Loamly Settings → Workspace.",
    "alwaysInSummary": true
  },
  {
    "type": "TEXT",
    "name": "apiKey",
    "displayName": "API Key",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Your Loamly Public API Key. Find this in Loamly Settings → API Keys."
  },
  {
    "type": "SELECT",
    "name": "eventType",
    "displayName": "Event Type",
    "simpleValueType": true,
    "defaultValue": "pageview",
    "selectItems": [
      {
        "value": "pageview",
        "displayValue": "Pageview"
      },
      {
        "value": "event",
        "displayValue": "Custom Event"
      }
    ],
    "help": "The type of event to send to Loamly."
  },
  {
    "type": "CHECKBOX",
    "name": "captureRfc9421",
    "displayName": "Capture RFC 9421 Signatures",
    "simpleValueType": true,
    "defaultValue": true,
    "help": "When enabled, captures HTTP signature headers from AI agents (ChatGPT, etc.) for verification."
  },
  {
    "type": "CHECKBOX",
    "name": "enableLogging",
    "displayName": "Enable Debug Logging",
    "simpleValueType": true,
    "defaultValue": false,
    "help": "Log debug information to the server container console."
  }
]


___SANDBOXED_JS_FOR_SERVER___

const sendHttpRequest = require('sendHttpRequest');
const getEventData = require('getEventData');
const getRequestHeader = require('getRequestHeader');
const getClientName = require('getClientName');
const getTimestampMillis = require('getTimestampMillis');
const JSON = require('JSON');
const logToConsole = require('logToConsole');
const makeString = require('makeString');
const generateRandom = require('generateRandom');

// Configuration from template fields
const workspaceId = data.workspaceId;
const apiKey = data.apiKey;
const eventType = data.eventType || 'pageview';
const captureRfc9421 = data.captureRfc9421;
const enableLogging = data.enableLogging;

// Helper function for logging
const log = function(message, data) {
  if (enableLogging) {
    if (data !== undefined) {
      logToConsole('[Loamly sGTM] ' + message, data);
    } else {
      logToConsole('[Loamly sGTM] ' + message);
    }
  }
};

log('Processing event...');

// Extract standard event data from GA4 Client
const clientId = getEventData('client_id') || '';
const sessionId = getEventData('ga_session_id') || getEventData('session_id') || '';
const pageUrl = getEventData('page_location') || '';
const pageTitle = getEventData('page_title') || '';
const pageReferrer = getEventData('page_referrer') || '';
const userAgent = getEventData('user_agent') || getRequestHeader('user-agent') || '';
const eventName = getEventData('event_name') || 'page_view';
const language = getEventData('language') || '';

// Extract UTM parameters
const utmSource = getEventData('utm_source') || getEventData('campaign_source') || null;
const utmMedium = getEventData('utm_medium') || getEventData('campaign_medium') || null;
const utmCampaign = getEventData('utm_campaign') || getEventData('campaign_name') || null;
const utmTerm = getEventData('utm_term') || getEventData('campaign_term') || null;
const utmContent = getEventData('utm_content') || getEventData('campaign_content') || null;

// Extract screen resolution
const screenResolution = getEventData('screen_resolution') || '';
let screenWidth = null;
let screenHeight = null;
if (screenResolution && screenResolution.indexOf('x') > -1) {
  const parts = screenResolution.split('x');
  screenWidth = parts[0] || null;
  screenHeight = parts[1] || null;
}

// Capture RFC 9421 HTTP Message Signatures (for AI agent detection)
let rfc9421Signature = null;
if (captureRfc9421) {
  const signature = getRequestHeader('signature');
  const signatureInput = getRequestHeader('signature-input');
  const signatureAgent = getRequestHeader('signature-agent');
  
  if (signature && signatureInput) {
    rfc9421Signature = {
      signature: signature,
      signature_input: signatureInput,
      signature_agent: signatureAgent || null
    };
    log('RFC 9421 signature detected from:', signatureAgent);
  }
}

// Build idempotency key to prevent duplicates
const timestamp = getTimestampMillis();
const random = generateRandom(100000, 999999);
const idempotencyKey = 'sgtm:' + clientId + ':' + timestamp + ':' + makeString(random);

// Extract page path from URL
let pagePath = null;
if (pageUrl) {
  try {
    // Simple path extraction - URL starts with protocol
    const urlWithoutProtocol = pageUrl.replace(/^https?:\/\//, '');
    const pathStart = urlWithoutProtocol.indexOf('/');
    if (pathStart > -1) {
      const pathWithQuery = urlWithoutProtocol.substring(pathStart);
      const queryStart = pathWithQuery.indexOf('?');
      pagePath = queryStart > -1 ? pathWithQuery.substring(0, queryStart) : pathWithQuery;
    } else {
      pagePath = '/';
    }
  } catch (e) {
    pagePath = '/';
  }
}

// Build the payload
const payload = {
  workspace_id: workspaceId,
  visitor_id: clientId,
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
  tracker_version: 'sgtm-1.0.0',
  event_type: eventType,
  event_name: eventName,
  timestamp: makeString(timestamp),
  rfc9421_signature: rfc9421Signature,
  sgtm_client: getClientName() || 'unknown',
  idempotency_key: idempotencyKey
};

log('Sending payload:', JSON.stringify(payload));

// Send to Loamly API
const url = 'https://app.loamly.ai/api/ingest/visit';

sendHttpRequest(
  url,
  function(statusCode, headers, body) {
    if (statusCode >= 200 && statusCode < 300) {
      log('Success - Status:', statusCode);
      data.gtmOnSuccess();
    } else {
      log('Error - Status:', statusCode);
      log('Response:', body);
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
      "key": {
        "publicId": "read_container_data",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "send_http",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedUrls",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://app.loamly.ai/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queryParameterAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "all"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 1/30/2026, 3:00:00 PM

Loamly Analytics Server-Side GTM Tag v1.0.0

Features:
- Sends pageviews and custom events to Loamly API
- Captures RFC 9421 HTTP Message Signatures for AI agent detection
- Works with GA4 Client and other sGTM clients
- Idempotency support to prevent duplicate events

For documentation, visit: https://loamly.ai/docs/integrations/gtm
