# VoxgigOpenapiSpec Python SDK Reference

Complete API reference for the VoxgigOpenapiSpec Python SDK.


## VoxgigOpenapiSpecSDK

### Constructor

```python
from voxgigopenapispec_sdk import VoxgigOpenapiSpecSDK

client = VoxgigOpenapiSpecSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["apikey"]` | `str` | API key for authentication. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `VoxgigOpenapiSpecSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = VoxgigOpenapiSpecSDK.test()
```


### Instance Methods

#### `GetCompanyEnrichment(data=None)`

Create a new `GetCompanyEnrichmentEntity` instance. Pass `None` for no initial data.

#### `PostCompanyEnrichment(data=None)`

Create a new `PostCompanyEnrichmentEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## GetCompanyEnrichmentEntity

```python
get_company_enrichment = client.GetCompanyEnrichment()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annual_revenue` | `str` | No | Estimated annual revenue. |
| `city` | `str` | No | City of the company headquarters. |
| `company_name` | `str` | No | Company name. |
| `country` | `str` | No | Country of the company headquarters. |
| `country_iso_code` | `str` | No | ISO country code of the company headquarters. |
| `crunchbase_url` | `str` | No | Crunchbase profile URL. |
| `description` | `str` | No | Short description of the company. |
| `domain` | `str` | No | The domain that was enriched (echoes the input). |
| `email_addresses` | `list` | No | Known company email addresses. |
| `employee_count` | `str` | No | Estimated number of employees. |
| `employee_range` | `str` | No | Estimated employee count range. |
| `exchange` | `str` | No | Stock exchange where the company is listed. |
| `facebook_url` | `str` | No | Facebook profile URL. |
| `global_ranking` | `str` | No | Global web traffic ranking of the company. |
| `industry` | `str` | No | Industry the company operates in. |
| `instagram_url` | `str` | No | Instagram profile URL. |
| `latitude` | `float` | No | Latitude of the company headquarters. |
| `linkedin_url` | `str` | No | LinkedIn profile URL. |
| `logo` | `str` | No | URL of the company logo. |
| `longitude` | `float` | No | Longitude of the company headquarters. |
| `naics_code` | `str` | No | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | `list` | No | Known company phone numbers. |
| `postal_code` | `str` | No | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `str` | No | Estimated annual revenue range. |
| `sic_code` | `str` | No | Standard Industrial Classification (SIC) code. |
| `state` | `str` | No | State or region of the company headquarters. |
| `street_address` | `str` | No | Street address of the company headquarters. |
| `tags` | `list` | No | Descriptive tags for the company. |
| `technologies` | `list` | No | Technologies detected in use by the company. |
| `ticker` | `str` | No | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `str` | No | Twitter/X profile URL. |
| `type` | `str` | No | Whether the company is public or private. |
| `year_founded` | `str` | No | Year the company was founded. |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list[GetCompanyEnrichmentEntity]`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list of entities, one per record, and raises on error.

```python
results = client.GetCompanyEnrichment().list({"domain": "example"})
for get_company_enrichment in results:
    print(get_company_enrichment.data_get())
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `GetCompanyEnrichmentEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## PostCompanyEnrichmentEntity

```python
post_company_enrichment = client.PostCompanyEnrichment()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `annual_revenue` | `str` | No | Estimated annual revenue. |
| `api_key` | `str` | No | Your API key. |
| `city` | `str` | No | City of the company headquarters. |
| `company_name` | `str` | No | Company name. |
| `country` | `str` | No | Country of the company headquarters. |
| `country_iso_code` | `str` | No | ISO country code of the company headquarters. |
| `crunchbase_url` | `str` | No | Crunchbase profile URL. |
| `description` | `str` | No | Short description of the company. |
| `domain` | `str` | No | The domain that was enriched (echoes the input). |
| `email_addresses` | `list` | No | Known company email addresses. |
| `employee_count` | `str` | No | Estimated number of employees. |
| `employee_range` | `str` | No | Estimated employee count range. |
| `exchange` | `str` | No | Stock exchange where the company is listed. |
| `facebook_url` | `str` | No | Facebook profile URL. |
| `fields` | `str` | No | Optional comma-separated list of top-level JSON keys to return. |
| `global_ranking` | `str` | No | Global web traffic ranking of the company. |
| `industry` | `str` | No | Industry the company operates in. |
| `instagram_url` | `str` | No | Instagram profile URL. |
| `latitude` | `float` | No | Latitude of the company headquarters. |
| `linkedin_url` | `str` | No | LinkedIn profile URL. |
| `logo` | `str` | No | URL of the company logo. |
| `longitude` | `float` | No | Longitude of the company headquarters. |
| `naics_code` | `str` | No | North American Industry Classification System (NAICS) code. |
| `phone_numbers` | `list` | No | Known company phone numbers. |
| `postal_code` | `str` | No | Postal or ZIP code of the company headquarters. |
| `revenue_range` | `str` | No | Estimated annual revenue range. |
| `sic_code` | `str` | No | Standard Industrial Classification (SIC) code. |
| `state` | `str` | No | State or region of the company headquarters. |
| `street_address` | `str` | No | Street address of the company headquarters. |
| `tags` | `list` | No | Descriptive tags for the company. |
| `technologies` | `list` | No | Technologies detected in use by the company. |
| `ticker` | `str` | No | Stock ticker symbol for publicly traded companies. |
| `twitter_url` | `str` | No | Twitter/X profile URL. |
| `type` | `str` | No | Whether the company is public or private. |
| `year_founded` | `str` | No | Year the company was founded. |

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

#### `create(reqdata, ctrl=None) -> PostCompanyEnrichmentEntity`

Create a new entity with the given data. Returns the created entity and raises on error.

```python
result = client.PostCompanyEnrichment().create({
    "domain": "example_domain",  # str
})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PostCompanyEnrichmentEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `netsim` | 0.0.1 | Network simulation |
| `test` | 0.0.1 | Test transport |


Features are activated via the `feature` option:

```python
client = VoxgigOpenapiSpecSDK({
    "feature": {
        "netsim": {"active": True},
        "test": {"active": True},
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

