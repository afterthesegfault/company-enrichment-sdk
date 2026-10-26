# VoxgigOpenapiSpec Ruby SDK



The Ruby SDK for the VoxgigOpenapiSpec API — an entity-oriented client using idiomatic Ruby conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.GetCompanyEnrichment` — with named operations (`list`/`create`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to RubyGems. Install it from the
GitHub release tag (`rb/vX.Y.Z`, see [Tags](https://github.com/voxgig-sdk/voxgig-openapi-spec-sdk/tags)), or
from a clone:

```bash
git clone https://github.com/voxgig-sdk/voxgig-openapi-spec-sdk
```

Then add it to your `Gemfile` by path, and run `bundle install`:

```ruby
gem "voxgig-sdk-voxgig-openapi-spec-sdk", path: "./voxgig-openapi-spec-sdk/rb"
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record. The client sends the API key as the `api_key` query parameter.

### 1. Create a client

```ruby
require_relative "VoxgigOpenapiSpec_sdk"

client = VoxgigOpenapiSpecSDK.new({
  "apikey" => ENV["VOXGIG_OPENAPI_SPEC_APIKEY"],
})
```

### 2. List getcompanyenrichment records

```ruby
begin
  # list returns an Array of GetCompanyEnrichment entities, one per record; data_get reads the record.
  getcompanyenrichments = client.GetCompanyEnrichment.list({ "domain" => "example" })
  getcompanyenrichments.each do |item|
    record = item.data_get
    puts "#{record["annual_revenue"]}"
  end
rescue => err
  warn "list failed: #{err}"
end
```


## Error handling

Entity operations raise on failure, so rescue them:

```ruby
begin
  getcompanyenrichments = client.GetCompanyEnrichment.list({ "domain" => "example" })
rescue => err
  warn "list failed: #{err}"
end
```

`direct` does **not** raise — it returns the result hash. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example_id" },
})

warn "request failed: #{result["err"] || "HTTP #{result["status"]}"}" unless result["ok"]
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})

if result["ok"]
  puts result["status"]  # 200
  puts result["data"]    # response body
else
  # On an HTTP error status there is no err (only a transport failure sets
  # it), so fall back to the status code.
  warn(result["err"] || "HTTP #{result["status"]}")
end
```

### Prepare a request without sending it

```ruby
begin
  fetchdef = client.prepare({
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => { "id" => "example" },
  })
  puts fetchdef["url"]
  puts fetchdef["method"]
  puts fetchdef["headers"]
rescue => err
  warn "prepare failed: #{err}"
end
```

### Use test mode

Create a mock client for unit testing — no server required:

```ruby
client = VoxgigOpenapiSpecSDK.test

# list returns an Array of GetCompanyEnrichment entities, one per mock record (raises on
# error); data_get reads each record.
getcompanyenrichments = client.GetCompanyEnrichment.list({ "domain" => "example" })
getcompanyenrichments.each { |item| puts item.data_get }
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ruby
mock_fetch = ->(url, init) {
  return {
    "status" => 200,
    "statusText" => "OK",
    "headers" => {},
    "json" => ->() { { "id" => "mock01" } },
  }, nil
}

client = VoxgigOpenapiSpecSDK.new({
  "base" => "http://localhost:8080",
  "system" => {
    "fetch" => mock_fetch,
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
cd rb && ruby -Itest -e "Dir['test/*_test.rb'].each { |f| require_relative f }"
```


## Reference

### VoxgigOpenapiSpecSDK

```ruby
require_relative "VoxgigOpenapiSpec_sdk"
client = VoxgigOpenapiSpecSDK.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Hash` | Feature activation flags. |
| `extend` | `Hash` | Additional Feature instances to load. |
| `system` | `Hash` | System overrides (e.g. custom `fetch` lambda). |

### test

```ruby
client = VoxgigOpenapiSpecSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### VoxgigOpenapiSpecSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Hash` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Hash` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Hash` | Build and send an HTTP request. Returns a result hash (`result["ok"]`); does not raise. |
| `GetCompanyEnrichment` | `(data) -> GetCompanyEnrichmentEntity` | Create a GetCompanyEnrichment entity instance. |
| `PostCompanyEnrichment` | `(data) -> PostCompanyEnrichmentEntity` | Create a PostCompanyEnrichment entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `list` | `(reqmatch = nil, ctrl) -> Array` | List entities matching the criteria (call with no argument to list all), one per record. Raises on error. |
| `create` | `(reqdata, ctrl) -> any` | Create a new entity, and return it. Raises on error. |
| `data_get` | `() -> Hash` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> Hash` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the entity, and `list` an `Array` of entities, one
per record; an entity's `data_get` reads its record. On failure they raise a
`VoxgigOpenapiSpecError` (a `StandardError` subclass), so wrap calls in
`begin`/`rescue` where you need to handle errors.

The `direct` escape hatch is the exception: it never raises and instead
returns a result `Hash` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Integer` | HTTP status code. |
| `headers` | `Hash` | Response headers. |
| `data` | `any` | Parsed JSON response body. |
| `err` | `Error` | Present when `ok` is `false`. |

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

Create an instance: `get_company_enrichment = client.GetCompanyEnrichment`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `annual_revenue` | `String` | Estimated annual revenue. |
| `city` | `String` | City of the company headquarters. |
| `company_name` | `String` | Company name. |
| `country` | `String` | Country of the company headquarters. |
| `country_iso_code` | `String` | ISO country code of the company headquarters. |
| `crunchbase_url` | `String` | Crunchbase profile URL. |
| `description` | `String` | Short description of the company. |
| `domain` | `String` | The domain that was enriched (echoes the input). |
| `email_addresses` | `Array` | Known company email addresses. |
| `employee_count` | `String` | Estimated number of employees. |
| `employee_range` | `String` | Estimated employee count range. |
| `exchange` | `String` | Stock exchange where the company is listed. |
| `facebook_url` | `String` | Facebook profile URL. |
| `global_ranking` | `String` | Global web traffic ranking of the company. |
| `industry` | `String` | Industry the company operates in. |
| `instagram_url` | `String` | Instagram profile URL. |
| `latitude` | `Float` | Latitude of the company headquarters. |
| `linkedin_url` | `String` | LinkedIn profile URL. |
| `logo` | `String` | URL of the company logo. |
| `longitude` | `Float` | Longitude of the company headquarters. |
| `naics_code` | `String` | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | `Array` | Known company phone numbers. |
| `postal_code` | `String` | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `String` | Estimated annual revenue range. |
| `sic_code` | `String` | Standard Industrial Classification (SIC) code. |
| `state` | `String` | State or region of the company headquarters. |
| `street_address` | `String` | Street address of the company headquarters. |
| `tags` | `Array` | Descriptive tags for the company. |
| `technologies` | `Array` | Technologies detected in use by the company. |
| `ticker` | `String` | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `String` | Twitter/X profile URL. |
| `type` | `String` | Whether the company is public or private. |
| `year_founded` | `String` | Year the company was founded. |

#### Example: List

```ruby
# list returns an Array of GetCompanyEnrichment entities, one per record (raises on error).
get_company_enrichments = client.GetCompanyEnrichment.list({ "domain" => "example" })
get_company_enrichments.each { |item| puts item.data_get }
```


### PostCompanyEnrichment

Create an instance: `post_company_enrichment = client.PostCompanyEnrichment`

#### Operations

| Method | Description |
| --- | --- |
| `create(data)` | Create a new entity with the given data. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `annual_revenue` | `String` | Estimated annual revenue. |
| `api_key` | `String` | Your API key. |
| `city` | `String` | City of the company headquarters. |
| `company_name` | `String` | Company name. |
| `country` | `String` | Country of the company headquarters. |
| `country_iso_code` | `String` | ISO country code of the company headquarters. |
| `crunchbase_url` | `String` | Crunchbase profile URL. |
| `description` | `String` | Short description of the company. |
| `domain` | `String` | The domain that was enriched (echoes the input). |
| `email_addresses` | `Array` | Known company email addresses. |
| `employee_count` | `String` | Estimated number of employees. |
| `employee_range` | `String` | Estimated employee count range. |
| `exchange` | `String` | Stock exchange where the company is listed. |
| `facebook_url` | `String` | Facebook profile URL. |
| `fields` | `String` | Optional comma-separated list of top-level JSON keys to return. |
| `global_ranking` | `String` | Global web traffic ranking of the company. |
| `industry` | `String` | Industry the company operates in. |
| `instagram_url` | `String` | Instagram profile URL. |
| `latitude` | `Float` | Latitude of the company headquarters. |
| `linkedin_url` | `String` | LinkedIn profile URL. |
| `logo` | `String` | URL of the company logo. |
| `longitude` | `Float` | Longitude of the company headquarters. |
| `naics_code` | `String` | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | `Array` | Known company phone numbers. |
| `postal_code` | `String` | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `String` | Estimated annual revenue range. |
| `sic_code` | `String` | Standard Industrial Classification (SIC) code. |
| `state` | `String` | State or region of the company headquarters. |
| `street_address` | `String` | Street address of the company headquarters. |
| `tags` | `Array` | Descriptive tags for the company. |
| `technologies` | `Array` | Technologies detected in use by the company. |
| `ticker` | `String` | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `String` | Twitter/X profile URL. |
| `type` | `String` | Whether the company is public or private. |
| `year_founded` | `String` | Year the company was founded. |

#### Example: Create

```ruby
post_company_enrichment = client.PostCompanyEnrichment.create({
  "domain" => "example_domain", # String
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

Features are the extension mechanism. A feature is a Ruby class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **NetsimFeature**: Network simulation
- **TestFeature**: Test transport

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as hashes

The Ruby SDK uses plain Ruby hashes throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers.to_map()` to safely validate that a value is a hash.

### Module structure

```
rb/
├── VoxgigOpenapiSpec_sdk.rb       -- Main SDK module
├── config.rb                  -- Configuration
├── schema.rb                  -- Generated option + entity specs
├── features.rb                -- Feature factory
├── core/                      -- Core types and context
├── entity/                    -- Entity implementations
├── feature/                   -- Built-in features (Base, Test, Log)
├── utility/                   -- Utility functions and struct library
└── test/                      -- Test suites
```

The main module (`VoxgigOpenapiSpec_sdk`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```ruby
getcompanyenrichment = client.GetCompanyEnrichment
getcompanyenrichment.list({ "domain" => "example" })

# getcompanyenrichment.data_get now returns the getcompanyenrichment data from the last list
# getcompanyenrichment.match_get returns the last match criteria
```

Call `make` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
