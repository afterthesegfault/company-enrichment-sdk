# VoxgigOpenapiSpec PHP SDK



The PHP SDK for the VoxgigOpenapiSpec API — an entity-oriented client using PHP conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `$client->GetCompanyEnrichment()` — with named operations (`list`/`create`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Packagist. Install it from the
GitHub release tag (`php/vX.Y.Z`, see [Tags](https://github.com/voxgig-sdk/voxgig-openapi-spec-sdk/tags)), or
from a clone as a Composer path repository:

```bash
git clone https://github.com/voxgig-sdk/voxgig-openapi-spec-sdk
composer config repositories.voxgig-openapi-spec-sdk path ./voxgig-openapi-spec-sdk/php
composer require voxgig-sdk/voxgig-openapi-spec-sdk:@dev
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record. The client sends the API key as the `api_key` query parameter.

### 1. Create a client

```php
<?php
require_once 'voxgigopenapispec_sdk.php';

$client = new VoxgigOpenapiSpecSDK([
    "apikey" => getenv("VOXGIG_OPENAPI_SPEC_APIKEY"),
]);
```

### 2. List getcompanyenrichment records

```php
try {
    // list() returns entity instances; data_get() reads each record.
    $getcompanyenrichments = $client->GetCompanyEnrichment()->list(["domain" => "example"]);
    foreach ($getcompanyenrichments as $record) {
        $item = $record->data_get();
        echo $item["annual_revenue"] . "\n";
    }
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```


## Error handling

Entity operations throw a `\Throwable` on failure, so wrap them in
`try` / `catch`:

```php
try {
    $getcompanyenrichments = $client->GetCompanyEnrichment()->list(["domain" => "example"]);
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```

`direct()` does **not** throw — it returns the result array. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```php
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example_id"],
]);

if (! $result["ok"]) {
    $err = $result["err"] ?? null;
    echo "request failed: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```php
// direct() is the raw-HTTP escape hatch: it returns a result array
// (it does not throw). Branch on $result["ok"].
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);

if ($result["ok"]) {
    echo $result["status"];  // 200
    print_r($result["data"]);  // response body
} else {
    // On an HTTP error status there is no err (only a transport failure sets
    // it), so fall back to the status code.
    $err = $result["err"] ?? null;
    echo "Error: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```

### Prepare a request without sending it

```php
// prepare() throws on error and returns the fetch definition.
$fetchdef = $client->prepare([
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => ["id" => "example"],
]);

echo $fetchdef["url"];
echo $fetchdef["method"];
print_r($fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required:

```php
$client = VoxgigOpenapiSpecSDK::test();

// list() returns entity instances (throws on error);
// call data_get() for the mock record.
$getcompanyenrichment = $client->GetCompanyEnrichment()->list(["domain" => "example"]);
print_r(array_map(fn($item) => $item->data_get(), $getcompanyenrichment));
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```php
$mock_fetch = function ($url, $init) {
    return [
        [
            "status" => 200,
            "statusText" => "OK",
            "headers" => [],
            "json" => function () { return ["id" => "mock01"]; },
        ],
        null,
    ];
};

$client = new VoxgigOpenapiSpecSDK([
    "base" => "http://localhost:8080",
    "system" => [
        "fetch" => $mock_fetch,
    ],
]);
```

### Run live tests

Create a `.env.local` file at the project root:

```
VOXGIG_OPENAPI_SPEC_TEST_LIVE=TRUE
VOXGIG_OPENAPI_SPEC_APIKEY=<your-key>
```

Then run:

```bash
cd php && ./vendor/bin/phpunit test/
```


## Reference

### VoxgigOpenapiSpecSDK

```php
require_once 'voxgigopenapispec_sdk.php';
$client = new VoxgigOpenapiSpecSDK($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `array` | Feature activation flags. |
| `extend` | `array` | Additional Feature instances to load. |
| `system` | `array` | System overrides (e.g. custom `fetch` callable). |

### test

```php
$client = VoxgigOpenapiSpecSDK::test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### VoxgigOpenapiSpecSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `(): array` | Deep copy of current SDK options. |
| `get_utility` | `(): Utility` | Copy of the SDK utility object. |
| `prepare` | `(array $fetchargs): array` | Build an HTTP request definition without sending. |
| `direct` | `(array $fetchargs): array` | Build and send an HTTP request. |
| `GetCompanyEnrichment` | `($data): GetCompanyEnrichmentEntity` | Create a GetCompanyEnrichment entity instance. |
| `PostCompanyEnrichment` | `($data): PostCompanyEnrichmentEntity` | Create a PostCompanyEnrichment entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `list` | `(?array $reqmatch = null, $ctrl): mixed` | List entities matching the criteria (call with no argument to list all), one per record. |
| `create` | `($reqdata, $ctrl): mixed` | Create a new entity, and return it. |
| `data_get` | `(): array` | Get entity data. |
| `data_set` | `($data): void` | Set entity data. |
| `match_get` | `(): array` | Get entity match criteria. |
| `match_set` | `($match): void` | Set entity match criteria. |
| `make` | `(): Entity` | Create a new instance with the same options. |
| `get_name` | `(): string` | Return the entity name. |

### Result shape

Entity operations return the entity, and `list` an `array` of entities, one
per record; an entity's `data_get()` reads its record (an `array`). They
throw on error, so wrap calls in `try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `array`
you branch on via `$result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `array` | Response headers. |
| `data` | `mixed` | Parsed JSON response body. |

On error, `ok` is `false` and `$err` contains the error value.

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

Create an instance: `$get_company_enrichment = $client->GetCompanyEnrichment();`

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
| `email_addresses` | `array` | Known company email addresses. |
| `employee_count` | `string` | Estimated number of employees. |
| `employee_range` | `string` | Estimated employee count range. |
| `exchange` | `string` | Stock exchange where the company is listed. |
| `facebook_url` | `string` | Facebook profile URL. |
| `global_ranking` | `string` | Global web traffic ranking of the company. |
| `industry` | `string` | Industry the company operates in. |
| `instagram_url` | `string` | Instagram profile URL. |
| `latitude` | `float` | Latitude of the company headquarters. |
| `linkedin_url` | `string` | LinkedIn profile URL. |
| `logo` | `string` | URL of the company logo. |
| `longitude` | `float` | Longitude of the company headquarters. |
| `naics_code` | `string` | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | `array` | Known company phone numbers. |
| `postal_code` | `string` | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `string` | Estimated annual revenue range. |
| `sic_code` | `string` | Standard Industrial Classification (SIC) code. |
| `state` | `string` | State or region of the company headquarters. |
| `street_address` | `string` | Street address of the company headquarters. |
| `tags` | `array` | Descriptive tags for the company. |
| `technologies` | `array` | Technologies detected in use by the company. |
| `ticker` | `string` | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `string` | Twitter/X profile URL. |
| `type` | `string` | Whether the company is public or private. |
| `year_founded` | `string` | Year the company was founded. |

#### Example: List

```php
// list() returns an array of GetCompanyEnrichment entities, one per record (throws on error).
$get_company_enrichments = $client->GetCompanyEnrichment()->list(["domain" => "example"]);
```


### PostCompanyEnrichment

Create an instance: `$post_company_enrichment = $client->PostCompanyEnrichment();`

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
| `email_addresses` | `array` | Known company email addresses. |
| `employee_count` | `string` | Estimated number of employees. |
| `employee_range` | `string` | Estimated employee count range. |
| `exchange` | `string` | Stock exchange where the company is listed. |
| `facebook_url` | `string` | Facebook profile URL. |
| `fields` | `string` | Optional comma-separated list of top-level JSON keys to return. |
| `global_ranking` | `string` | Global web traffic ranking of the company. |
| `industry` | `string` | Industry the company operates in. |
| `instagram_url` | `string` | Instagram profile URL. |
| `latitude` | `float` | Latitude of the company headquarters. |
| `linkedin_url` | `string` | LinkedIn profile URL. |
| `logo` | `string` | URL of the company logo. |
| `longitude` | `float` | Longitude of the company headquarters. |
| `naics_code` | `string` | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | `array` | Known company phone numbers. |
| `postal_code` | `string` | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `string` | Estimated annual revenue range. |
| `sic_code` | `string` | Standard Industrial Classification (SIC) code. |
| `state` | `string` | State or region of the company headquarters. |
| `street_address` | `string` | Street address of the company headquarters. |
| `tags` | `array` | Descriptive tags for the company. |
| `technologies` | `array` | Technologies detected in use by the company. |
| `ticker` | `string` | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `string` | Twitter/X profile URL. |
| `type` | `string` | Whether the company is public or private. |
| `year_founded` | `string` | Year the company was founded. |

#### Example: Create

```php
$post_company_enrichment = $client->PostCompanyEnrichment()->create([
    "domain" => null, // string
]);
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

Features are the extension mechanism. A feature is a PHP class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **NetsimFeature**: Network simulation
- **TestFeature**: Test transport

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as arrays

The PHP SDK uses plain PHP associative arrays throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers::to_map()` to safely validate that a value is an array.

### Directory structure

```
php/
├── voxgigopenapispec_sdk.php          -- Main SDK class
├── config.php                     -- Configuration
├── schema.php                     -- Generated option + entity specs
├── features.php                   -- Feature factory
├── core/                          -- Core types and context
├── entity/                        -- Entity implementations
├── feature/                       -- Built-in features (Base, Test, Log)
├── utility/                       -- Utility functions and struct library
└── test/                          -- Test suites
```

The main class (`voxgigopenapispec_sdk.php`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```php
$getcompanyenrichment = $client->GetCompanyEnrichment();
$getcompanyenrichment->list(["domain" => "example"]);

// $getcompanyenrichment->data_get() now returns the getcompanyenrichment data from the last list
// $getcompanyenrichment->match_get() returns the last match criteria
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
