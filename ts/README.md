# VoxgigOpenapiSpec TypeScript SDK



The TypeScript SDK for the VoxgigOpenapiSpec API — a type-safe, entity-oriented client with full async/await support.

The API is exposed as capitalised, semantic **Entities** — e.g.
`client.GetCompanyEnrichment()` — each with a small set of operations (`list`, `create`)
instead of raw URL paths and query parameters. This keeps the surface
predictable and low-friction for both humans and AI agents.

> Also generated from this model: `go`, `go-cli`, `go-mcp`, `lua`, `php`, `py`, `rb` — see
> the [top-level README](../README.md).


## Install
This package is not yet published to npm. Install it from the GitHub
release tag (`ts/vX.Y.Z`, see [Tags](https://github.com/voxgig-sdk/voxgig-openapi-spec-sdk/tags)), or from a
clone, which carries the compiled `dist/`:

```bash
git clone https://github.com/voxgig-sdk/voxgig-openapi-spec-sdk
npm install ./voxgig-openapi-spec-sdk/ts
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record. The client sends the API key as the `api_key` query parameter.

### 1. Create a client

```ts
import { VoxgigOpenapiSpecSDK } from '@voxgig-sdk/voxgig-openapi-spec-sdk'

const client = new VoxgigOpenapiSpecSDK({
  apikey: process.env.VOXGIG_OPENAPI_SPEC_APIKEY,
})
```

### 2. List getcompanyenrichment records

`list()` resolves to an array of GetCompanyEnrichment ENTITIES — every operation
resolves to entities, not raw records. Iterate them directly, and call
`.data()` on one for the record it holds:

```ts
const getcompanyenrichments = await client.GetCompanyEnrichment().list({ domain: "example" })

for (const getcompanyenrichment of getcompanyenrichments) {
  console.log(getcompanyenrichment.data())
}
```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const getcompanyenrichments = await client.GetCompanyEnrichment().list({ domain: "example" })
  console.log(getcompanyenrichments.map((item) => item.data()))
} catch (err) {
  console.error('list failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
result envelope. Branch on `ok`; on failure `status` holds the HTTP status
(for error responses) and `err` holds the error:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (!result.ok) {
  console.error('request failed:', result.status, result.err)
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})

if (result.ok) {
  console.log(result.status)  // 200
  console.log(result.data)    // response body
}
```

### Prepare a request without sending it

```ts
const fetchdef = await client.prepare({
  path: '/api/resource/{id}',
  method: 'DELETE',
  params: { id: 'example' },
})

// Inspect before sending
console.log(fetchdef.url)
console.log(fetchdef.method)
console.log(fetchdef.headers)
```

### Use test mode

Create a mock client for unit testing — no server required:

```ts
const client = VoxgigOpenapiSpecSDK.test()

const getcompanyenrichments = await client.GetCompanyEnrichment().list({ domain: 'example_domain' })
// getcompanyenrichments is an array of GetCompanyEnrichment entities, one per mock record
console.log(getcompanyenrichments.map((getcompanyenrichment) => getcompanyenrichment.data()))
```

You can also use the instance method:

```ts
const client = new VoxgigOpenapiSpecSDK({ apikey: '...' })
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```ts
const entity = client.GetCompanyEnrichment()

// First call runs the operation and stores its result
await entity.list({ domain: 'example_domain' })

// Subsequent calls reuse the stored state
const data = entity.data()
console.log(data)
```

### Add custom middleware

Pass features via the `extend` option:

```ts
const logger = {
  hooks: {
    PreRequest: (ctx: any) => {
      console.log('Requesting:', ctx.spec.method, ctx.spec.path)
    },
    PreResponse: (ctx: any) => {
      console.log('Status:', ctx.out.request?.status)
    },
  },
}

const client = new VoxgigOpenapiSpecSDK({
  apikey: '...',
  extend: [logger],
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
cd ts && npm test
```

Live entity tests continue independent operations after errors and attempt
supported cleanup. Their final result reports failures and missing prerequisites
after the remaining work completes. The model and test inputs determine which
API operations the generated scenarios cover.


## Reference

### VoxgigOpenapiSpecSDK

#### Constructor

```ts
new VoxgigOpenapiSpecSDK(options?: {
  apikey?: string
  base?: string
  prefix?: string
  suffix?: string
  feature?: Record<string, { active: boolean }>
  extend?: Feature[]
})
```

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `object` | Feature activation flags (e.g. `{ test: { active: true } }`). |
| `extend` | `Feature[]` | Additional feature instances to load. |

#### Methods

| Method | Returns | Description |
| --- | --- | --- |
| `options()` | `object` | Deep copy of current SDK options. |
| `utility()` | `Utility` | Deep copy of the SDK utility object. |
| `prepare(fetchargs?)` | `Promise<FetchDef>` | Build an HTTP request definition without sending it. |
| `direct(fetchargs?)` | `Promise<DirectResult>` | Build and send an HTTP request. |
| `GetCompanyEnrichment(data?)` | `GetCompanyEnrichmentEntity` | Create a GetCompanyEnrichment entity instance. |
| `PostCompanyEnrichment(data?)` | `PostCompanyEnrichmentEntity` | Create a PostCompanyEnrichment entity instance. |
| `tester(testopts?, sdkopts?)` | `VoxgigOpenapiSpecSDK` | Create a test-mode client instance. |

#### Static methods

| Method | Returns | Description |
| --- | --- | --- |
| `VoxgigOpenapiSpecSDK.test(testopts?, sdkopts?)` | `VoxgigOpenapiSpecSDK` | Create a test-mode client. |

### Entity interface

All entities share the same interface.

#### Methods

| Method | Signature | Description |
| --- | --- | --- |
| `list` | `list(reqmatch?, ctrl?): Promise<Entity[]>` | List entities matching the criteria, one per record. |
| `create` | `create(reqdata?, ctrl?): Promise<Entity>` | Create a new entity, and return it. |
| `data` | `data(data?: Partial<Entity>): Entity` | Get or set entity data. |
| `match` | `match(match?: Partial<Entity>): Partial<Entity>` | Get or set entity match criteria. |
| `make` | `make(): Entity` | Create a new instance with the same options. |
| `client` | `client(): VoxgigOpenapiSpecSDK` | Return the parent SDK client. |
| `entopts` | `entopts(): object` | Return a copy of the entity options. |

#### Return values

Entity operations resolve to the entity itself — there is no result
envelope, and an entity's `data()` reads its record:

- `create` resolves to a single entity object.
- `list` resolves to an **array** of entity objects (iterate it directly;
  there is no `.data` and no `.ok`).

On a failed request these methods **throw**, so wrap calls in
`try`/`catch` to handle errors. Only `direct()` returns the result
envelope described below.

### DirectResult shape

The `direct()` method returns:

```ts
{
  ok: boolean
  status: number
  headers: object
  data: any
}
```

On error, `ok` is `false` and an `err` property contains the error.

### FetchDef shape

The `prepare()` method returns:

```ts
{
  url: string
  method: string
  headers: Record<string, string>
  body?: any
}
```

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

Operations: list.

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

Operations: create.

API path: `/`



## Entities


### GetCompanyEnrichment

Create an instance: `const get_company_enrichment = client.GetCompanyEnrichment()`

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
| `email_addresses` | `any[]` | Known company email addresses. |
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
| `phone_numbers` | `any[]` | Known company phone numbers. |
| `postal_code` | `string` | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `string` | Estimated annual revenue range. |
| `sic_code` | `string` | Standard Industrial Classification (SIC) code. |
| `state` | `string` | State or region of the company headquarters. |
| `street_address` | `string` | Street address of the company headquarters. |
| `tags` | `any[]` | Descriptive tags for the company. |
| `technologies` | `any[]` | Technologies detected in use by the company. |
| `ticker` | `string` | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `string` | Twitter/X profile URL. |
| `type` | `string` | Whether the company is public or private. |
| `year_founded` | `string` | Year the company was founded. |

#### Example: List

```ts
const get_company_enrichments = await client.GetCompanyEnrichment().list({ domain: "example" })
```


### PostCompanyEnrichment

Create an instance: `const post_company_enrichment = client.PostCompanyEnrichment()`

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
| `email_addresses` | `any[]` | Known company email addresses. |
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
| `phone_numbers` | `any[]` | Known company phone numbers. |
| `postal_code` | `string` | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `string` | Estimated annual revenue range. |
| `sic_code` | `string` | Standard Industrial Classification (SIC) code. |
| `state` | `string` | State or region of the company headquarters. |
| `street_address` | `string` | Street address of the company headquarters. |
| `tags` | `any[]` | Descriptive tags for the company. |
| `technologies` | `any[]` | Technologies detected in use by the company. |
| `ticker` | `string` | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `string` | Twitter/X profile URL. |
| `type` | `string` | Whether the company is public or private. |
| `year_founded` | `string` | Year the company was founded. |

#### Example: Create

```ts
const post_company_enrichment = await client.PostCompanyEnrichment().create({
  domain: 'example_domain',
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

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **NetsimFeature**: Network simulation
- **TestFeature**: Test transport

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Module structure

```
voxgig-openapi-spec/
├── src/
│   ├── VoxgigOpenapiSpecSDK.ts        # Main SDK class
│   ├── entity/             # Entity implementations
│   ├── feature/            # Built-in features (Base, Test, Log)
│   └── utility/            # Utility functions
├── test/                   # Test suites
└── dist/                   # Compiled output
```

Import the SDK from the package root:

```ts
import { VoxgigOpenapiSpecSDK } from '@voxgig-sdk/voxgig-openapi-spec-sdk'
```

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const getcompanyenrichment = client.GetCompanyEnrichment()
await getcompanyenrichment.list({ domain: "example" })

// getcompanyenrichment.data() now returns the getcompanyenrichment data from the last `list`
// getcompanyenrichment.match() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
