# VoxgigOpenapiSpec Lua SDK



The Lua SDK for the VoxgigOpenapiSpec API — an entity-oriented client using Lua conventions.

It exposes the API as capitalised, semantic **Entities** — e.g. `client:GetCompanyEnrichment()` — each with the same small set of operations (`list`, `create`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to LuaRocks. Install it from the
GitHub release tag (`lua/vX.Y.Z`, see [Tags](https://github.com/voxgig-sdk/voxgig-openapi-spec-sdk/tags)),
or add the source directory to your `LUA_PATH`:

```bash
export LUA_PATH="path/to/lua/?.lua;path/to/lua/?/init.lua;;"
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record. The client sends the API key as the `api_key` query parameter.

### 1. Create a client

```lua
local sdk = require("voxgig-openapi-spec_sdk")

local client = sdk.new({
  apikey = os.getenv("VOXGIG_OPENAPI_SPEC_APIKEY"),
})
```

### 2. List getcompanyenrichment records

Entity operations return `(value, err)`. For `list`, `value` is an
array of entities, one per record — iterate it directly (there is no
wrapper), and read each record with `data_get()`.

```lua
local getcompanyenrichments, err = client:GetCompanyEnrichment():list({ domain = "example" })
if err then error(err) end

for _, item in ipairs(getcompanyenrichments) do
  for k, val in pairs(item:data_get()) do print(k, val) end
end
```


## Error handling

Entity operations return `(value, err)`. Check `err` before using
the value:

```lua
local getcompanyenrichments, err = client:GetCompanyEnrichment():list({ domain = "example" })
if err then error(err) end
```

`direct` follows the same `(value, err)` convention:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example_id" },
})
if err then error(err) end
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
if err then error(err) end

if result["ok"] then
  print(result["status"])  -- 200
  print(result["data"])    -- response body
end
```

### Prepare a request without sending it

```lua
local fetchdef, err = client:prepare({
  path = "/api/resource/{id}",
  method = "DELETE",
  params = { id = "example" },
})
if err then error(err) end

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```lua
local client = sdk.test()

local result, err = client:GetCompanyEnrichment():list({ domain = "example" })
-- result is an array of entities, one per mock record; err is set on failure
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```lua
local function mock_fetch(url, init)
  return {
    status = 200,
    statusText = "OK",
    headers = {},
    json = function()
      return { id = "mock01" }
    end,
  }, nil
end

local client = sdk.new({
  base = "http://localhost:8080",
  system = {
    fetch = mock_fetch,
  },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
VOXGIG_OPENAPI_SPEC_TEST_LIVE=TRUE
VOXGIG_OPENAPI_SPEC_APIKEY=<your-key>
```

Then run:

```bash
cd lua && busted test/
```


## Reference

### VoxgigOpenapiSpecSDK

```lua
local sdk = require("voxgig-openapi-spec_sdk")
local client = sdk.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `table` | Feature activation flags. |
| `extend` | `table` | Additional Feature instances to load. |
| `system` | `table` | System overrides (e.g. custom `fetch` function). |

### test

```lua
local client = sdk.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### VoxgigOpenapiSpecSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> table` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> table, err` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs) -> table, err` | Build and send an HTTP request. |
| `GetCompanyEnrichment` | `(data) -> GetCompanyEnrichmentEntity` | Create a GetCompanyEnrichment entity instance. |
| `PostCompanyEnrichment` | `(data) -> PostCompanyEnrichmentEntity` | Create a PostCompanyEnrichment entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `list` | `(reqmatch, ctrl) -> any, err` | List entities matching the criteria, one per record. |
| `create` | `(reqdata, ctrl) -> any, err` | Create a new entity, and return it. |
| `data_get` | `() -> table` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> table` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> string` | Return the entity name. |

### Result shape

Entity operations return `(value, err)`. The `value` is the entity
itself — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `create` | the entity, whose `data_get()` reads its record (a `table`) |
| `list` | an array (`table`) of entities, one per record |

Check `err` first (it is non-`nil` on failure), then use `value`:

    local get_company_enrichment, err = client:GetCompanyEnrichment():list({ domain = "example" })
    if err then error(err) end
    -- get_company_enrichment is an array of entities, one per record

Only `direct()` returns a response envelope — a `table` with `ok`,
`status`, `headers`, and `data` keys.

### Entities

#### GetCompanyEnrichment

| Field | Description |
| --- | --- |
| `annual_revenue` | Estimated annual revenue. |
| `city` | City of the company headquarters. |
| `company_name` | Company name. |
| `country` | Country of the company headquarters. |
| `country_iso_code` | ISO country code of the company headquarters. |
| `crunchbase_url` | Crunchbase profile URL. |
| `description` | Short description of the company. |
| `domain` | The domain that was enriched (echoes the input). |
| `email_addresses` | Known company email addresses. |
| `employee_count` | Estimated number of employees. |
| `employee_range` | Estimated employee count range. |
| `exchange` | Stock exchange where the company is listed. |
| `facebook_url` | Facebook profile URL. |
| `global_ranking` | Global web traffic ranking of the company. |
| `industry` | Industry the company operates in. |
| `instagram_url` | Instagram profile URL. |
| `latitude` | Latitude of the company headquarters. |
| `linkedin_url` | LinkedIn profile URL. |
| `logo` | URL of the company logo. |
| `longitude` | Longitude of the company headquarters. |
| `naics_code` | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | Known company phone numbers. |
| `postal_code` | Postal or ZIP code of the company headquarters. |
| `revenue_range` | Estimated annual revenue range. |
| `sic_code` | Standard Industrial Classification (SIC) code. |
| `state` | State or region of the company headquarters. |
| `street_address` | Street address of the company headquarters. |
| `tags` | Descriptive tags for the company. |
| `technologies` | Technologies detected in use by the company. |
| `ticker` | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | Twitter/X profile URL. |
| `type` | Whether the company is public or private. |
| `year_founded` | Year the company was founded. |

Operations: List.

API path: `/`

#### PostCompanyEnrichment

| Field | Description |
| --- | --- |
| `annual_revenue` | Estimated annual revenue. |
| `api_key` | Your API key. |
| `city` | City of the company headquarters. |
| `company_name` | Company name. |
| `country` | Country of the company headquarters. |
| `country_iso_code` | ISO country code of the company headquarters. |
| `crunchbase_url` | Crunchbase profile URL. |
| `description` | Short description of the company. |
| `domain` | The domain that was enriched (echoes the input). |
| `email_addresses` | Known company email addresses. |
| `employee_count` | Estimated number of employees. |
| `employee_range` | Estimated employee count range. |
| `exchange` | Stock exchange where the company is listed. |
| `facebook_url` | Facebook profile URL. |
| `fields` | Optional comma-separated list of top-level JSON keys to return. |
| `global_ranking` | Global web traffic ranking of the company. |
| `industry` | Industry the company operates in. |
| `instagram_url` | Instagram profile URL. |
| `latitude` | Latitude of the company headquarters. |
| `linkedin_url` | LinkedIn profile URL. |
| `logo` | URL of the company logo. |
| `longitude` | Longitude of the company headquarters. |
| `naics_code` | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | Known company phone numbers. |
| `postal_code` | Postal or ZIP code of the company headquarters. |
| `revenue_range` | Estimated annual revenue range. |
| `sic_code` | Standard Industrial Classification (SIC) code. |
| `state` | State or region of the company headquarters. |
| `street_address` | Street address of the company headquarters. |
| `tags` | Descriptive tags for the company. |
| `technologies` | Technologies detected in use by the company. |
| `ticker` | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | Twitter/X profile URL. |
| `type` | Whether the company is public or private. |
| `year_founded` | Year the company was founded. |

Operations: Create.

API path: `/`



## Entities


### GetCompanyEnrichment

Create an instance: `local get_company_enrichment = client:GetCompanyEnrichment(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `annual_revenue` | `string` | Estimated annual revenue. |
| `city` | `string` | City of the company headquarters. |
| `company_name` | `string` | Company name. |
| `country` | `string` | Country of the company headquarters. |
| `country_iso_code` | `string` | ISO country code of the company headquarters. |
| `crunchbase_url` | `string` | Crunchbase profile URL. |
| `description` | `string` | Short description of the company. |
| `domain` | `string` | The domain that was enriched (echoes the input). |
| `email_addresses` | `table` | Known company email addresses. |
| `employee_count` | `string` | Estimated number of employees. |
| `employee_range` | `string` | Estimated employee count range. |
| `exchange` | `string` | Stock exchange where the company is listed. |
| `facebook_url` | `string` | Facebook profile URL. |
| `global_ranking` | `string` | Global web traffic ranking of the company. |
| `industry` | `string` | Industry the company operates in. |
| `instagram_url` | `string` | Instagram profile URL. |
| `latitude` | `number` | Latitude of the company headquarters. |
| `linkedin_url` | `string` | LinkedIn profile URL. |
| `logo` | `string` | URL of the company logo. |
| `longitude` | `number` | Longitude of the company headquarters. |
| `naics_code` | `string` | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | `table` | Known company phone numbers. |
| `postal_code` | `string` | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `string` | Estimated annual revenue range. |
| `sic_code` | `string` | Standard Industrial Classification (SIC) code. |
| `state` | `string` | State or region of the company headquarters. |
| `street_address` | `string` | Street address of the company headquarters. |
| `tags` | `table` | Descriptive tags for the company. |
| `technologies` | `table` | Technologies detected in use by the company. |
| `ticker` | `string` | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `string` | Twitter/X profile URL. |
| `type` | `string` | Whether the company is public or private. |
| `year_founded` | `string` | Year the company was founded. |

#### Example: List

```lua
local get_company_enrichments, err = client:GetCompanyEnrichment():list({ domain = "example" })
```


### PostCompanyEnrichment

Create an instance: `local post_company_enrichment = client:PostCompanyEnrichment(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `annual_revenue` | `string` | Estimated annual revenue. |
| `api_key` | `string` | Your API key. |
| `city` | `string` | City of the company headquarters. |
| `company_name` | `string` | Company name. |
| `country` | `string` | Country of the company headquarters. |
| `country_iso_code` | `string` | ISO country code of the company headquarters. |
| `crunchbase_url` | `string` | Crunchbase profile URL. |
| `description` | `string` | Short description of the company. |
| `domain` | `string` | The domain that was enriched (echoes the input). |
| `email_addresses` | `table` | Known company email addresses. |
| `employee_count` | `string` | Estimated number of employees. |
| `employee_range` | `string` | Estimated employee count range. |
| `exchange` | `string` | Stock exchange where the company is listed. |
| `facebook_url` | `string` | Facebook profile URL. |
| `fields` | `string` | Optional comma-separated list of top-level JSON keys to return. |
| `global_ranking` | `string` | Global web traffic ranking of the company. |
| `industry` | `string` | Industry the company operates in. |
| `instagram_url` | `string` | Instagram profile URL. |
| `latitude` | `number` | Latitude of the company headquarters. |
| `linkedin_url` | `string` | LinkedIn profile URL. |
| `logo` | `string` | URL of the company logo. |
| `longitude` | `number` | Longitude of the company headquarters. |
| `naics_code` | `string` | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | `table` | Known company phone numbers. |
| `postal_code` | `string` | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `string` | Estimated annual revenue range. |
| `sic_code` | `string` | Standard Industrial Classification (SIC) code. |
| `state` | `string` | State or region of the company headquarters. |
| `street_address` | `string` | Street address of the company headquarters. |
| `tags` | `table` | Descriptive tags for the company. |
| `technologies` | `table` | Technologies detected in use by the company. |
| `ticker` | `string` | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `string` | Twitter/X profile URL. |
| `type` | `string` | Whether the company is public or private. |
| `year_founded` | `string` | Year the company was founded. |

#### Example: Create

```lua
local post_company_enrichment, err = client:PostCompanyEnrichment():create({
  domain = "example_domain", -- string
})
```

## Features

This SDK ships 2 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`netsim`](#netsim) | Network simulation |
| [`test`](#test) | Test transport |

### netsim

Network simulation.

| Option | Default |
|---|---|
| `active` | `false` |
| `errorTimes` | `0` |
| `failEvery` | `0` |
| `failRate` | `0` |
| `failStatus` | `503` |
| `failTimes` | `0` |
| `latency` | `0` |
| `offline` | `false` |
| `rateLimitTimes` | `0` |
| `retryAfter` | `0` |
| `seed` | `1` |

Set `feature.netsim.active` to enable it, then override any of the options above.

`netsim` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### test

Test transport.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is a Lua table
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **NetsimFeature**: Network simulation
- **TestFeature**: Test transport

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as tables

The Lua SDK uses plain Lua tables throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a table.

### Module structure

```
lua/
├── voxgig-openapi-spec_sdk.lua    -- Main SDK module
├── config.lua               -- Configuration
├── schema.lua               -- Generated option + entity specs
├── features.lua             -- Feature factory
├── core/                    -- Core types and context
├── entity/                  -- Entity implementations
├── feature/                 -- Built-in features (Base, Test, Log)
├── utility/                 -- Utility functions and struct library
└── test/                    -- Test suites
```

The main module (`voxgig-openapi-spec_sdk`) exports the SDK constructor
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```lua
local getcompanyenrichment = client:GetCompanyEnrichment()
getcompanyenrichment:list({ domain = "example" })

-- getcompanyenrichment:data_get() now returns the getcompanyenrichment data from the last list
-- getcompanyenrichment:match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
