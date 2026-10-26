# VoxgigOpenapiSpec PHP SDK Reference

Complete API reference for the VoxgigOpenapiSpec PHP SDK.


## VoxgigOpenapiSpecSDK

### Constructor

```php
require_once __DIR__ . '/voxgigopenapispec_sdk.php';

$client = new VoxgigOpenapiSpecSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["apikey"]` | `string` | API key for authentication. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `VoxgigOpenapiSpecSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = VoxgigOpenapiSpecSDK::test();
```


### Instance Methods

#### `GetCompanyEnrichment($data = null)`

Create a new `GetCompanyEnrichmentEntity` instance. Pass `null` for no initial data.

#### `PostCompanyEnrichment($data = null)`

Create a new `PostCompanyEnrichmentEntity` instance. Pass `null` for no initial data.

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): VoxgigOpenapiSpecUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## GetCompanyEnrichmentEntity

```php
$get_company_enrichment = $client->GetCompanyEnrichment();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annual_revenue` | `string` | No | Estimated annual revenue. |
| `city` | `string` | No | City of the company headquarters. |
| `company_name` | `string` | No | Company name. |
| `country` | `string` | No | Country of the company headquarters. |
| `country_iso_code` | `string` | No | ISO country code of the company headquarters. |
| `crunchbase_url` | `string` | No | Crunchbase profile URL. |
| `description` | `string` | No | Short description of the company. |
| `domain` | `string` | No | The domain that was enriched (echoes the input). |
| `email_addresses` | `array` | No | Known company email addresses. |
| `employee_count` | `string` | No | Estimated number of employees. |
| `employee_range` | `string` | No | Estimated employee count range. |
| `exchange` | `string` | No | Stock exchange where the company is listed. |
| `facebook_url` | `string` | No | Facebook profile URL. |
| `global_ranking` | `string` | No | Global web traffic ranking of the company. |
| `industry` | `string` | No | Industry the company operates in. |
| `instagram_url` | `string` | No | Instagram profile URL. |
| `latitude` | `float` | No | Latitude of the company headquarters. |
| `linkedin_url` | `string` | No | LinkedIn profile URL. |
| `logo` | `string` | No | URL of the company logo. |
| `longitude` | `float` | No | Longitude of the company headquarters. |
| `naics_code` | `string` | No | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | `array` | No | Known company phone numbers. |
| `postal_code` | `string` | No | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `string` | No | Estimated annual revenue range. |
| `sic_code` | `string` | No | Standard Industrial Classification (SIC) code. |
| `state` | `string` | No | State or region of the company headquarters. |
| `street_address` | `string` | No | Street address of the company headquarters. |
| `tags` | `array` | No | Descriptive tags for the company. |
| `technologies` | `array` | No | Technologies detected in use by the company. |
| `ticker` | `string` | No | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `string` | No | Twitter/X profile URL. |
| `type` | `string` | No | Whether the company is public or private. |
| `year_founded` | `string` | No | Year the company was founded. |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array of entities, one per record, and throws on error.

```php
$results = $client->GetCompanyEnrichment()->list(["domain" => "example"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): GetCompanyEnrichmentEntity`

Create a new `GetCompanyEnrichmentEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## PostCompanyEnrichmentEntity

```php
$post_company_enrichment = $client->PostCompanyEnrichment();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annual_revenue` | `string` | No | Estimated annual revenue. |
| `api_key` | `string` | No | Your API key. |
| `city` | `string` | No | City of the company headquarters. |
| `company_name` | `string` | No | Company name. |
| `country` | `string` | No | Country of the company headquarters. |
| `country_iso_code` | `string` | No | ISO country code of the company headquarters. |
| `crunchbase_url` | `string` | No | Crunchbase profile URL. |
| `description` | `string` | No | Short description of the company. |
| `domain` | `string` | No | The domain that was enriched (echoes the input). |
| `email_addresses` | `array` | No | Known company email addresses. |
| `employee_count` | `string` | No | Estimated number of employees. |
| `employee_range` | `string` | No | Estimated employee count range. |
| `exchange` | `string` | No | Stock exchange where the company is listed. |
| `facebook_url` | `string` | No | Facebook profile URL. |
| `fields` | `string` | No | Optional comma-separated list of top-level JSON keys to return. |
| `global_ranking` | `string` | No | Global web traffic ranking of the company. |
| `industry` | `string` | No | Industry the company operates in. |
| `instagram_url` | `string` | No | Instagram profile URL. |
| `latitude` | `float` | No | Latitude of the company headquarters. |
| `linkedin_url` | `string` | No | LinkedIn profile URL. |
| `logo` | `string` | No | URL of the company logo. |
| `longitude` | `float` | No | Longitude of the company headquarters. |
| `naics_code` | `string` | No | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | `array` | No | Known company phone numbers. |
| `postal_code` | `string` | No | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `string` | No | Estimated annual revenue range. |
| `sic_code` | `string` | No | Standard Industrial Classification (SIC) code. |
| `state` | `string` | No | State or region of the company headquarters. |
| `street_address` | `string` | No | Street address of the company headquarters. |
| `tags` | `array` | No | Descriptive tags for the company. |
| `technologies` | `array` | No | Technologies detected in use by the company. |
| `ticker` | `string` | No | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `string` | No | Twitter/X profile URL. |
| `type` | `string` | No | Whether the company is public or private. |
| `year_founded` | `string` | No | Year the company was founded. |

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

#### `create(array $reqdata, ?array $ctrl = null): mixed`

Create a new entity with the given data. Returns the created entity and throws on error.

```php
$result = $client->PostCompanyEnrichment()->create([
  "domain" => null, // string
]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): PostCompanyEnrichmentEntity`

Create a new `PostCompanyEnrichmentEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `netsim` | 0.0.1 | Network simulation |
| `test` | 0.0.1 | Test transport |


Features are activated via the `feature` option:

```php
$client = new VoxgigOpenapiSpecSDK([
  "feature" => [
    "netsim" => ["active" => true],
    "test" => ["active" => true],
  ],
]);
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

