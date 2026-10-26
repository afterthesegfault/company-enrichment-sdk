# VoxgigOpenapiSpec Golang SDK



The Golang SDK for the VoxgigOpenapiSpec API — an entity-oriented client using standard Go conventions. No generics required; data flows as `map[string]any`.

It exposes the API as capitalised, semantic **Entities** — e.g. `client.GetCompanyEnrichment(nil)` — each with the same small set of operations (`List`, `Create`) instead of raw URL paths and query strings. You call meaning, not endpoints, which keeps the cognitive load low.

> Also generated from this model: `go-cli`, `go-mcp`, `lua`, `php`, `py`, `rb`, `ts` — see
> the [top-level README](../README.md).


## Install
```bash
go get github.com/voxgig-sdk/voxgig-openapi-spec-sdk/go@latest
```

The Go module proxy resolves the version from the `go/vX.Y.Z` GitHub
release tag — see [Tags](https://github.com/voxgig-sdk/voxgig-openapi-spec-sdk/tags) for the available versions.

To vendor from a local checkout instead, clone this repo alongside your
project and add a `replace` directive pointing at the checked-out
`go/` directory:

```bash
go mod edit -replace github.com/voxgig-sdk/voxgig-openapi-spec-sdk/go=../voxgig-openapi-spec-sdk/go
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record. The client sends the API key as the `api_key` query parameter.

### Quickstart

A complete program: create a client, then call the entity operations.
Each operation returns `(value, error)` — the value is the entity, and for
`List` a `[]any` of entities, one per record (there is no `{ok, data}`
wrapper), so check `err` and read a record through the entity's
`Data()`.

```go
package main

import (
    "fmt"
    "os"
    sdk "github.com/voxgig-sdk/voxgig-openapi-spec-sdk/go"
)

func main() {
    client := sdk.NewVoxgigOpenapiSpecSDK(map[string]any{
        "apikey": os.Getenv("VOXGIG_OPENAPI_SPEC_APIKEY"),
    })

    // List getCompanyEnrichment records — the value is a []any of entities, one per record.
    getCompanyEnrichments, err := client.GetCompanyEnrichment(nil).List(map[string]any{"domain": "example"}, nil)
    if err != nil {
        panic(err)
    }
    for _, item := range getCompanyEnrichments.([]any) {
        fmt.Println(item.(sdk.Entity).Data())
    }
}
```


## Error handling

Every entity operation returns `(value, error)`. Check `err` before
using the value — there is no exception to catch:

```go
getcompanyenrichments, err := client.GetCompanyEnrichment(nil).List(map[string]any{"domain": "example"}, nil)
if err != nil {
    // handle err
    return
}
_ = getcompanyenrichments
```

`Direct` follows the same `(value, error)` convention:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example_id"},
})
if err != nil {
    // handle err
}
_ = result
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

if result["ok"] == true {
    fmt.Println(result["status"]) // 200
    fmt.Println(result["data"])   // response body
}
```

### Prepare a request without sending it

```go
fetchdef, err := client.Prepare(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "DELETE",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

fmt.Println(fetchdef["url"])
fmt.Println(fetchdef["method"])
fmt.Println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```go
client := sdk.Test()

getCompanyEnrichments, err := client.GetCompanyEnrichment(nil).List(
    map[string]any{"domain": "example"}, nil,
)
if err != nil {
    panic(err)
}
// A []any of entities, one per mock record.
for _, item := range getCompanyEnrichments.([]any) {
    fmt.Println(item.(sdk.Entity).Data())
}
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```go
mockFetch := func(url string, init map[string]any) (map[string]any, error) {
    return map[string]any{
        "status":     200,
        "statusText": "OK",
        "headers":    map[string]any{},
        "json": (func() any)(func() any {
            return map[string]any{"id": "mock01"}
        }),
    }, nil
}

client := sdk.NewVoxgigOpenapiSpecSDK(map[string]any{
    "base": "http://localhost:8080",
    "system": map[string]any{
        "fetch": (func(string, map[string]any) (map[string]any, error))(mockFetch),
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
cd go && go test ./test/...
```


## Reference

### NewVoxgigOpenapiSpecSDK

```go
func NewVoxgigOpenapiSpecSDK(options map[string]any) *VoxgigOpenapiSpecSDK
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `"apikey"` | `string` | API key for authentication. |
| `"base"` | `string` | Base URL of the API server. |
| `"prefix"` | `string` | URL path prefix prepended to all requests. |
| `"suffix"` | `string` | URL path suffix appended to all requests. |
| `"feature"` | `map[string]any` | Feature activation flags. |
| `"extend"` | `[]any` | Additional Feature instances to load. |
| `"system"` | `map[string]any` | System overrides (e.g. custom `"fetch"` function). |

### TestSDK

```go
func TestSDK(testopts map[string]any, sdkopts map[string]any) *VoxgigOpenapiSpecSDK
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### VoxgigOpenapiSpecSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() map[string]any` | Deep copy of current SDK options. |
| `GetUtility` | `() *Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs map[string]any) (map[string]any, error)` | Build an HTTP request definition without sending. |
| `Direct` | `(fetchargs map[string]any) (map[string]any, error)` | Build and send an HTTP request. |
| `GetCompanyEnrichment` | `(data map[string]any) VoxgigOpenapiSpecEntity` | Create a GetCompanyEnrichment entity instance. |
| `PostCompanyEnrichment` | `(data map[string]any) VoxgigOpenapiSpecEntity` | Create a PostCompanyEnrichment entity instance. |

### Entity interface (VoxgigOpenapiSpecEntity)

All entities implement the `VoxgigOpenapiSpecEntity` interface.

| Method | Signature | Description |
| --- | --- | --- |
| `List` | `(reqmatch, ctrl map[string]any) (any, error)` | List entities matching the criteria, one per record. |
| `Create` | `(reqdata, ctrl map[string]any) (any, error)` | Create a new entity, and return it. |
| `Data` | `(args ...any) any` | Get or set entity data. |
| `Match` | `(args ...any) any` | Get or set entity match criteria. |
| `Make` | `() Entity` | Create a new instance with the same options. |
| `GetName` | `() string` | Return the entity name. |

### Result shape

Entity operations return `(value, error)`. The `value` is the entity
itself — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `Create` | the entity, whose `Data()` reads its record (`map[string]any`) |
| `List` | a `[]any` of entities, one per record |

Check `err` first, then use the value directly (or the typed
`...Typed` variants, which return the entity's model struct and a typed
slice):

    getCompanyEnrichment, err := client.GetCompanyEnrichment(nil).List(map[string]any{"domain": "example"}, nil)
    if err != nil { /* handle */ }
    // getCompanyEnrichment is a []any of entities, one per record

Only `Direct()` returns a response envelope — a `map[string]any` with
`"ok"`, `"status"`, `"headers"`, and `"data"` keys.

### Entities

#### GetCompanyEnrichment

| Field | Description |
| --- | --- |
| `"annual_revenue"` | Estimated annual revenue. |
| `"city"` | City of the company headquarters. |
| `"company_name"` | Company name. |
| `"country"` | Country of the company headquarters. |
| `"country_iso_code"` | ISO country code of the company headquarters. |
| `"crunchbase_url"` | Crunchbase profile URL. |
| `"description"` | Short description of the company. |
| `"domain"` | The domain that was enriched (echoes the input). |
| `"email_addresses"` | Known company email addresses. |
| `"employee_count"` | Estimated number of employees. |
| `"employee_range"` | Estimated employee count range. |
| `"exchange"` | Stock exchange where the company is listed. |
| `"facebook_url"` | Facebook profile URL. |
| `"global_ranking"` | Global web traffic ranking of the company. |
| `"industry"` | Industry the company operates in. |
| `"instagram_url"` | Instagram profile URL. |
| `"latitude"` | Latitude of the company headquarters. |
| `"linkedin_url"` | LinkedIn profile URL. |
| `"logo"` | URL of the company logo. |
| `"longitude"` | Longitude of the company headquarters. |
| `"naics_code"` | North American Industry Classification System (NAICS) code. |
| `"phone_numbers"` | Known company phone numbers. |
| `"postal_code"` | Postal or ZIP code of the company headquarters. |
| `"revenue_range"` | Estimated annual revenue range. |
| `"sic_code"` | Standard Industrial Classification (SIC) code. |
| `"state"` | State or region of the company headquarters. |
| `"street_address"` | Street address of the company headquarters. |
| `"tags"` | Descriptive tags for the company. |
| `"technologies"` | Technologies detected in use by the company. |
| `"ticker"` | Stock ticker symbol for publicly traded companies. |
| `"twitter_url"` | Twitter/X profile URL. |
| `"type"` | Whether the company is public or private. |
| `"year_founded"` | Year the company was founded. |

Operations: List.

API path: `/`

#### PostCompanyEnrichment

| Field | Description |
| --- | --- |
| `"annual_revenue"` | Estimated annual revenue. |
| `"api_key"` | Your API key. |
| `"city"` | City of the company headquarters. |
| `"company_name"` | Company name. |
| `"country"` | Country of the company headquarters. |
| `"country_iso_code"` | ISO country code of the company headquarters. |
| `"crunchbase_url"` | Crunchbase profile URL. |
| `"description"` | Short description of the company. |
| `"domain"` | The domain that was enriched (echoes the input). |
| `"email_addresses"` | Known company email addresses. |
| `"employee_count"` | Estimated number of employees. |
| `"employee_range"` | Estimated employee count range. |
| `"exchange"` | Stock exchange where the company is listed. |
| `"facebook_url"` | Facebook profile URL. |
| `"fields"` | Optional comma-separated list of top-level JSON keys to return. |
| `"global_ranking"` | Global web traffic ranking of the company. |
| `"industry"` | Industry the company operates in. |
| `"instagram_url"` | Instagram profile URL. |
| `"latitude"` | Latitude of the company headquarters. |
| `"linkedin_url"` | LinkedIn profile URL. |
| `"logo"` | URL of the company logo. |
| `"longitude"` | Longitude of the company headquarters. |
| `"naics_code"` | North American Industry Classification System (NAICS) code. |
| `"phone_numbers"` | Known company phone numbers. |
| `"postal_code"` | Postal or ZIP code of the company headquarters. |
| `"revenue_range"` | Estimated annual revenue range. |
| `"sic_code"` | Standard Industrial Classification (SIC) code. |
| `"state"` | State or region of the company headquarters. |
| `"street_address"` | Street address of the company headquarters. |
| `"tags"` | Descriptive tags for the company. |
| `"technologies"` | Technologies detected in use by the company. |
| `"ticker"` | Stock ticker symbol for publicly traded companies. |
| `"twitter_url"` | Twitter/X profile URL. |
| `"type"` | Whether the company is public or private. |
| `"year_founded"` | Year the company was founded. |

Operations: Create.

API path: `/`



## Entities


### GetCompanyEnrichment

Create an instance: `getCompanyEnrichment := client.GetCompanyEnrichment(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |

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
| `email_addresses` | `[]any` | Known company email addresses. |
| `employee_count` | `string` | Estimated number of employees. |
| `employee_range` | `string` | Estimated employee count range. |
| `exchange` | `string` | Stock exchange where the company is listed. |
| `facebook_url` | `string` | Facebook profile URL. |
| `global_ranking` | `string` | Global web traffic ranking of the company. |
| `industry` | `string` | Industry the company operates in. |
| `instagram_url` | `string` | Instagram profile URL. |
| `latitude` | `float64` | Latitude of the company headquarters. |
| `linkedin_url` | `string` | LinkedIn profile URL. |
| `logo` | `string` | URL of the company logo. |
| `longitude` | `float64` | Longitude of the company headquarters. |
| `naics_code` | `string` | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | `[]any` | Known company phone numbers. |
| `postal_code` | `string` | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `string` | Estimated annual revenue range. |
| `sic_code` | `string` | Standard Industrial Classification (SIC) code. |
| `state` | `string` | State or region of the company headquarters. |
| `street_address` | `string` | Street address of the company headquarters. |
| `tags` | `[]any` | Descriptive tags for the company. |
| `technologies` | `[]any` | Technologies detected in use by the company. |
| `ticker` | `string` | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `string` | Twitter/X profile URL. |
| `type` | `string` | Whether the company is public or private. |
| `year_founded` | `string` | Year the company was founded. |

#### Example: List

```go
getCompanyEnrichments, err := client.GetCompanyEnrichment(nil).List(map[string]any{"domain": "example"}, nil)
if err != nil {
    panic(err)
}
// A []any of entities, one per record.
for _, item := range getCompanyEnrichments.([]any) {
    fmt.Println(item.(sdk.Entity).Data())
}
```


### PostCompanyEnrichment

Create an instance: `postCompanyEnrichment := client.PostCompanyEnrichment(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Create(data, ctrl)` | Create a new entity with the given data. |

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
| `email_addresses` | `[]any` | Known company email addresses. |
| `employee_count` | `string` | Estimated number of employees. |
| `employee_range` | `string` | Estimated employee count range. |
| `exchange` | `string` | Stock exchange where the company is listed. |
| `facebook_url` | `string` | Facebook profile URL. |
| `fields` | `string` | Optional comma-separated list of top-level JSON keys to return. |
| `global_ranking` | `string` | Global web traffic ranking of the company. |
| `industry` | `string` | Industry the company operates in. |
| `instagram_url` | `string` | Instagram profile URL. |
| `latitude` | `float64` | Latitude of the company headquarters. |
| `linkedin_url` | `string` | LinkedIn profile URL. |
| `logo` | `string` | URL of the company logo. |
| `longitude` | `float64` | Longitude of the company headquarters. |
| `naics_code` | `string` | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | `[]any` | Known company phone numbers. |
| `postal_code` | `string` | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `string` | Estimated annual revenue range. |
| `sic_code` | `string` | Standard Industrial Classification (SIC) code. |
| `state` | `string` | State or region of the company headquarters. |
| `street_address` | `string` | Street address of the company headquarters. |
| `tags` | `[]any` | Descriptive tags for the company. |
| `technologies` | `[]any` | Technologies detected in use by the company. |
| `ticker` | `string` | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `string` | Twitter/X profile URL. |
| `type` | `string` | Whether the company is public or private. |
| `year_founded` | `string` | Year the company was founded. |

#### Example: Create

```go
result, err := client.PostCompanyEnrichment(nil).Create(map[string]any{
    "domain": "example_domain",
}, nil)
if err != nil {
    panic(err)
}
fmt.Println(result.(sdk.Entity).Data()) // the created entity's record
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

Features are the extension mechanism. A feature implements the
`Feature` interface and provides hooks — functions keyed by pipeline
stage names.

The SDK ships with built-in features:

- **NetsimFeature**: Network simulation
- **TestFeature**: Test transport

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as maps

The Go SDK uses `map[string]any` throughout rather than typed structs.
This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

An operation returns the entity, and its `Data()` returns the record. Use
`core.ToMapAny()` to safely cast that record, or data nested in it, to
`map[string]any`: it returns `nil` for anything else, an entity included.

### Package structure

```
github.com/voxgig-sdk/voxgig-openapi-spec-sdk/go/
├── voxgig-openapi-spec.go        # Root package — type aliases and constructors
├── core/               # SDK core — client, types, pipeline
├── entity/             # Entity implementations
├── feature/            # Built-in features (Base, Test, Log)
├── utility/            # Utility functions and struct library
└── test/               # Test suites
```

The root package (`github.com/voxgig-sdk/voxgig-openapi-spec-sdk/go`) re-exports everything needed
for normal use. Import sub-packages only when you need specific types
like `core.ToMapAny`.

### Entity state

Entity instances are stateful. After a successful `List`, the entity
stores the returned data and match criteria internally.

```go
getcompanyenrichment := client.GetCompanyEnrichment(nil)
getcompanyenrichment.List(map[string]any{"domain": "example"}, nil)

// getcompanyenrichment.Data() now returns the getcompanyenrichment data from the last list
// getcompanyenrichment.Match() returns the last match criteria
```

Call `Make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`Direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `Prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
