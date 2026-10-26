# VoxgigOpenapiSpec Ruby SDK Reference

Complete API reference for the VoxgigOpenapiSpec Ruby SDK.


## VoxgigOpenapiSpecSDK

### Constructor

```ruby
require_relative 'VoxgigOpenapiSpec_sdk'

client = VoxgigOpenapiSpecSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["apikey"]` | `String` | API key for authentication. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `VoxgigOpenapiSpecSDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = VoxgigOpenapiSpecSDK.test
```


### Instance Methods

#### `GetCompanyEnrichment(data = nil)`

Create a new `GetCompanyEnrichment` entity instance. Pass `nil` for no initial data.

#### `PostCompanyEnrichment(data = nil)`

Create a new `PostCompanyEnrichment` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## GetCompanyEnrichmentEntity

```ruby
get_company_enrichment = client.GetCompanyEnrichment
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annual_revenue` | `String` | No | Estimated annual revenue. |
| `city` | `String` | No | City of the company headquarters. |
| `company_name` | `String` | No | Company name. |
| `country` | `String` | No | Country of the company headquarters. |
| `country_iso_code` | `String` | No | ISO country code of the company headquarters. |
| `crunchbase_url` | `String` | No | Crunchbase profile URL. |
| `description` | `String` | No | Short description of the company. |
| `domain` | `String` | No | The domain that was enriched (echoes the input). |
| `email_addresses` | `Array` | No | Known company email addresses. |
| `employee_count` | `String` | No | Estimated number of employees. |
| `employee_range` | `String` | No | Estimated employee count range. |
| `exchange` | `String` | No | Stock exchange where the company is listed. |
| `facebook_url` | `String` | No | Facebook profile URL. |
| `global_ranking` | `String` | No | Global web traffic ranking of the company. |
| `industry` | `String` | No | Industry the company operates in. |
| `instagram_url` | `String` | No | Instagram profile URL. |
| `latitude` | `Float` | No | Latitude of the company headquarters. |
| `linkedin_url` | `String` | No | LinkedIn profile URL. |
| `logo` | `String` | No | URL of the company logo. |
| `longitude` | `Float` | No | Longitude of the company headquarters. |
| `naics_code` | `String` | No | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | `Array` | No | Known company phone numbers. |
| `postal_code` | `String` | No | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `String` | No | Estimated annual revenue range. |
| `sic_code` | `String` | No | Standard Industrial Classification (SIC) code. |
| `state` | `String` | No | State or region of the company headquarters. |
| `street_address` | `String` | No | Street address of the company headquarters. |
| `tags` | `Array` | No | Descriptive tags for the company. |
| `technologies` | `Array` | No | Technologies detected in use by the company. |
| `ticker` | `String` | No | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `String` | No | Twitter/X profile URL. |
| `type` | `String` | No | Whether the company is public or private. |
| `year_founded` | `String` | No | Year the company was founded. |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array of entities, one per record; `data_get` reads each record. Raises on error.

```ruby
results = client.GetCompanyEnrichment.list({ "domain" => "example" })
results.each { |item| puts item.data_get }
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `GetCompanyEnrichmentEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## PostCompanyEnrichmentEntity

```ruby
post_company_enrichment = client.PostCompanyEnrichment
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annual_revenue` | `String` | No | Estimated annual revenue. |
| `api_key` | `String` | No | Your API key. |
| `city` | `String` | No | City of the company headquarters. |
| `company_name` | `String` | No | Company name. |
| `country` | `String` | No | Country of the company headquarters. |
| `country_iso_code` | `String` | No | ISO country code of the company headquarters. |
| `crunchbase_url` | `String` | No | Crunchbase profile URL. |
| `description` | `String` | No | Short description of the company. |
| `domain` | `String` | No | The domain that was enriched (echoes the input). |
| `email_addresses` | `Array` | No | Known company email addresses. |
| `employee_count` | `String` | No | Estimated number of employees. |
| `employee_range` | `String` | No | Estimated employee count range. |
| `exchange` | `String` | No | Stock exchange where the company is listed. |
| `facebook_url` | `String` | No | Facebook profile URL. |
| `fields` | `String` | No | Optional comma-separated list of top-level JSON keys to return. |
| `global_ranking` | `String` | No | Global web traffic ranking of the company. |
| `industry` | `String` | No | Industry the company operates in. |
| `instagram_url` | `String` | No | Instagram profile URL. |
| `latitude` | `Float` | No | Latitude of the company headquarters. |
| `linkedin_url` | `String` | No | LinkedIn profile URL. |
| `logo` | `String` | No | URL of the company logo. |
| `longitude` | `Float` | No | Longitude of the company headquarters. |
| `naics_code` | `String` | No | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | `Array` | No | Known company phone numbers. |
| `postal_code` | `String` | No | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `String` | No | Estimated annual revenue range. |
| `sic_code` | `String` | No | Standard Industrial Classification (SIC) code. |
| `state` | `String` | No | State or region of the company headquarters. |
| `street_address` | `String` | No | Street address of the company headquarters. |
| `tags` | `Array` | No | Descriptive tags for the company. |
| `technologies` | `Array` | No | Technologies detected in use by the company. |
| `ticker` | `String` | No | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `String` | No | Twitter/X profile URL. |
| `type` | `String` | No | Whether the company is public or private. |
| `year_founded` | `String` | No | Year the company was founded. |

### Field Usage by Operation

| Field | create |
| --- | --- |
| `annual_revenue` | - |
| `api_key` | - |
| `city` | - |
| `company_name` | - |
| `country` | - |
| `country_iso_code` | - |
| `crunchbase_url` | - |
| `description` | - |
| `domain` | Yes |
| `email_addresses` | - |
| `employee_count` | - |
| `employee_range` | - |
| `exchange` | - |
| `facebook_url` | - |
| `fields` | - |
| `global_ranking` | - |
| `industry` | - |
| `instagram_url` | - |
| `latitude` | - |
| `linkedin_url` | - |
| `logo` | - |
| `longitude` | - |
| `naics_code` | - |
| `phone_numbers` | - |
| `postal_code` | - |
| `revenue_range` | - |
| `sic_code` | - |
| `state` | - |
| `street_address` | - |
| `tags` | - |
| `technologies` | - |
| `ticker` | - |
| `twitter_url` | - |
| `type` | - |
| `year_founded` | - |

### Operations

#### `create(reqdata, ctrl = nil) -> result`

Create a new entity with the given data. Returns the created entity and raises on error.

```ruby
result = client.PostCompanyEnrichment.create({
  "domain" => "example_domain", # String
})
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `PostCompanyEnrichmentEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `netsim` | 0.0.1 | Network simulation |
| `test` | 0.0.1 | Test transport |


Features are activated via the `feature` option:

```ruby
client = VoxgigOpenapiSpecSDK.new({
  "feature" => {
    "netsim" => { "active" => true },
    "test" => { "active" => true },
  },
})
```


### Configuring features

Each feature is inactive until switched on, and an SDK with no feature
configured does no feature work at all. Every option below keeps its default
unless you name it.

The array form of \`feature\` is significant: several features wrap the
transport, and the order you list them in is the order they nest.

#### Ordering

`netsim` wrap the transport. Each
wraps whatever is already installed, so **activation order is nesting order**:
a feature activated later sits OUTSIDE one activated earlier, and sees the call
first.

That decides behaviour, not just sequence: a feature that short-circuits the
call, such as a cache serving a hit, stops every feature nested inside it from
ever seeing that call.

`test` attach to pipeline hooks
rather than the transport, so their order does not affect what they observe.

#### `netsim`

Network simulation.

**Configuration**

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

| Option | Type |
|---|---|
| `sleep` | function |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.netsim.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Wraps the transport: its place in the activation order decides what it
  sees. See [Ordering](#ordering) above.
- Inactive by default: leaving it out costs nothing at runtime.

#### `test`

Test transport.

**Configuration**

| Option | Default |
|---|---|
| `active` | `false` |

| Option | Type |
|---|---|
| `entity` | map |
| `net` | map |

These take no default: the feature behaves one way when you supply them and
another when you do not.

**Usage**

Set `feature.test.active` to true in the client options, and override any option above in the same entry. Every option keeps
its default unless you name it.

**Considerations**

- Attaches to pipeline hooks, not the transport, so activation order does
  not change what it observes.
- Installs the BASE transport that the wrapping features wrap, so it must be
  activated before them.
- Inactive by default: leaving it out costs nothing at runtime.

