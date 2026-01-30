___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Loamly Analytics (Server-Side)",
  "categories": ["ANALYTICS", "ATTRIBUTION"],
  "brand": {
    "id": "brand_loamly",
    "displayName": "Loamly",
    "thumbnail": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAAE8ElEQVR4nO2Za2wUVRTHf3d2u9ttS1sKpS0PeQgIIoL4AFFBjSgxGmOMH4wxJsYYP/jBGB+JMSYm+sGY+EFj1PhIjFFjjAqKBgUVFRFReYiAgLxaoKWFdrvd7szszvXc2Z1ld9rtdncX+uE/mczO3HPv+Z9z7j33zMCIRjSi/18Jwz3BypUr6e7uRkqJZVn4fD6EEBiGgWEYxGIxAoEAhmGwYsWK4QbJHHLNmjVIKXNeTNMkHA5jWRa2bSOlxLZt8vl8fmlzUUbX9dzStm0Mw0AIgWma+Hw+dF0nHA4TDAaJRCKEQiGEELnFSCQiQ6EQ4XCYYDCI3+/H7/fj8/lwu91YlkUqleLSSy+lubmZqqqqAYHMRWUAKIpCMpkkkUhw/fXXEw6HCYVCucdHHnmEnp4eRo8ejWVZAy5G9QXo6ekhFovR3t5OW1tb7rlUKsXq1auz2hBCkEwmSSQSeL1eampqCAaD2dflJi8dTNu2icfj9Pb24na7cblcCCFwu93Ytk0ikcAwDFKpFK+99hpOpxNFUUilUsRiMYLBIE6nE9M0SafTAz5npxoAfr8fl8tFOp3G6XTi8/kIhUJIKXE6nSQSCTo6Ogafge7ubhobG3E4HHR1dREIBAgGg9i2TSKRIJlM4vV6CQQC2LZNKpVi2bJlA+pAZgBS+B1OhBDEYjFqamqorKwkEAhQVVWF1+vF5XJhmiaJRALLskin0wPah5xqAMTjcRoaGvB6vfT09NDQ0EAkEsHhcOB0OnE6nbhcLtLpNPF4HCklDocDl8uVywCHw0EymeTcc8+lvr5+8BnweDzU1tbS29tLdXU10WgUl8tFOBzG5XLhdDpxu93Ytk0sFsOyLFwuF36/H4/Hg6IoxONxUqkUkyZNoqKiIsdAUR8ATdOorq4mkUgQj8eJRCJEo1FcLheqqhIOh1FVFdM0icfj2LaN0+kkEAjg9/tRFIVIJEI6naapqYmysrIBgTF9fHbtNi68ZR6+yjL8l9Rh+bx4N39JY0MDra2tVFRUEAgECAQCuFwuVFUlFAphmiaWZeF0OvH7/YTDYRRFIRqNkkqlOOecc6isrBxY6vT09KBpGsOllhQCKTlpwk7CQy0oo1x4G2NE1T5ufewNJk+eTDweR1VVQqEQqqpiWRahUAjTNLFtO5cBwWCQ6dOnM2bMmKx2CgYgFA5j2zY/fvQJUwNRAqMqULzeHAAuRaJKSThloXb1cs71c3ho0wpOOeUUEolEzgfC4TCqqmJZFqFQCMMwcDqdhEIhFi5cOChjCgagsroGn9+PBCJun6bvK2f00e9xDdB4sNexeqoLwzCQUvLDzl+xaxt59N6HWLJkCfX19TgcDsLhMC6XK1dKGIaBaZoEg0EWLFhAa2vrYEIpc9IREpQsyDjRn+xT+dX4tH/jQf5eDNLp5MT3UZz/8y/7kz5F/WCY/z6rLyTgbMnQFwSh9l2WC5FMJlFVlfLy8pP9/MMKIPOU6erqoru7m3g8njMgKfSJRz+kZZS+lxMpUO+L4fZu2+K3zdfiqnSw/IKlRCKR3OMdHR20t7cTj8fZfPhw/qSi9oHvd+yke/e+wYWSkBJVNEGZVwTLnYQvaMTuF8b/cLfIBXWpbLF3s05K6hcLqjZjT1vBkhuXcdpppxGPx3Nl84EDB+ju7s7dy2QyNDY25u5NN27cSFtb259HNOJy0j/Xv56v/wHLGQwAAAAASUVORK5CYII="
  },
  "description": "Server-side analytics tag for Loamly. Sends pageviews and events to Loamly API with full HTTP header access for AI traffic detection and RFC 9421 signature verification.",
  "containerContexts": ["SERVER"]
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


___SANDBOXED_JS_FOR_SERVER_TEMPLATE___

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
  timestamp: new Date(timestamp).toISOString(),
  rfc9421_signature: rfc9421Signature,
  sgtm_client: getClientName() || 'unknown',
  idempotency_key: idempotencyKey
};

log('Sending payload:', JSON.stringify(payload));

// Send to Loamly API
const url = 'https://app.loamly.ai/api/ingest/visit';
const options = {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'X-Loamly-Api-Key': apiKey,
    'X-Idempotency-Key': idempotencyKey
  },
  timeout: 5000
};

sendHttpRequest(url, options, JSON.stringify(payload))
  .then(function(response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      log('Success - Status:', response.statusCode);
      data.gtmOnSuccess();
    } else {
      log('Error - Status:', response.statusCode);
      log('Response:', response.body);
      data.gtmOnFailure();
    }
  })
  .catch(function(error) {
    log('Request failed:', error);
    data.gtmOnFailure();
  });


___SERVER_PERMISSIONS___

[
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
          "key": "headerWhitelist",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "user-agent"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "signature"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "signature-input"
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "headerName"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "signature-agent"
                  }
                ]
              }
            ]
          }
        },
        {
          "key": "headersAllowed",
          "value": {
            "type": 8,
            "boolean": true
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
