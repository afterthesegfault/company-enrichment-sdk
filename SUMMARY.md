# Abstract Company Enrichment API

Enrich a company domain with firmographic data, company name, description, logo, address and coordinates, industry classification (SIC/NAICS), employee and revenue ranges, contact details, social profiles, financial identifiers, tags, and detected technologies, in a single request. Authenticate with your API key as the `api_key` query parameter, or as an `Authorization: Bearer &lt;key&gt;` header. GET and POST (form-encoded or JSON) are both supported.

## Start here

This guide introduces the API, the client libraries, and the companion tools in this repository. Start with the API capabilities, choose a client for your application, and use the linked reference when you need exact request and response details.

The selected API surface contains 2 entities and 2 HTTP routes. There are 6 SDK targets and 2 companion tools.

An entity groups related API operations. An operation can have several routes with different inputs or authentication requirements. The SDK exposes the entity and its operations using the conventions of the selected language.

## What the API provides

### GetCompanyEnrichment

Results: Enrichment details for the requested company.

SDK operations: `list`.

Key fields to recognise:

- `annual_revenue`: Estimated annual revenue. Null when unknown.
- `city`: City of the company headquarters. Null when unknown.
- `company_name`: Company name. Null when unknown.
- `country`: Country of the company headquarters. Null when unknown.
- `country_iso_code`: ISO country code of the company headquarters. Null when unknown.

### PostCompanyEnrichment

Results: Enrichment details for the requested company.

SDK operations: `create`.

Key fields to recognise:

- `annual_revenue`: Estimated annual revenue. Null when unknown.
- `api_key`: Your API key.
- `city`: City of the company headquarters. Null when unknown.
- `company_name`: Company name. Null when unknown.
- `country`: Country of the company headquarters. Null when unknown.

### Route map

Use this map to locate a capability. Consult the entity reference before supplying request data; routes for the same operation can require different fields.

| Entity | SDK operation | HTTP route | Authentication |
| --- | --- | --- | --- |
| GetCompanyEnrichment | `list` | `GET /` | Required |
| PostCompanyEnrichment | `create` | `POST /` | Required |

## Connect to the API

- API server: `https://companyenrichment.abstractapi.com/v2`

The default credential is sent in the `api_key` query.

Your unique Company Enrichment API key.

Send your API key as a Bearer token; omit `api_key` from the query string.

Check authentication for the route you plan to call. A route that declares no authentication can be used without credentials; this does not change the requirements of other routes. Keep credentials in environment variables or a configured secret provider, and keep them out of source control and logs.

## Make a first request

1. Choose the API server and an operation that matches your task.
2. Check the operation’s required input and authentication. Use values valid for your account and environment.
3. Send one request and inspect the returned data before adding retries, concurrency, or a larger batch.

For an SDK call, install or build the chosen client, create a client instance with its documented configuration, and call the required entity operation. Language references describe the argument shape, asynchronous behaviour, and returned values.

## Choose an SDK

Choose the language already used by your application or service. The clients represent the same API model, while package setup, naming, and return types follow each language. Check the selected client’s reference and tests before integrating it into an existing application.

| Client | Repository directory | Distribution |
| --- | --- | --- |
| Golang | `go/` | Build from source |
| Lua | `lua/` | Build from source |
| PHP | `php/` | Build from source |
| Python | `py/` | Build from source |
| Ruby | `rb/` | Build from source |
| TypeScript | `ts/` | Build from source |

Build-from-source entries are not marked as published in the project model. Follow the build instructions in that target’s README, then consume the resulting package using your language’s local dependency mechanism. Published entries give the installation command recorded for that client.

## Companion tools

These targets provide another way to use the API. Their available commands or tools can cover a smaller set of operations than the client libraries.

### Go CLI

Use the command-line interface for shell-based tasks and scripts.

Repository directory: `go-cli/`. Not published. Build from the go-cli directory.


### Go MCP server

Use the MCP server to expose supported API operations to an MCP client.

Repository directory: `go-mcp/`. Not published. Build from the go-mcp directory.

- `voxgig-openapi-spec_list`: List records for an entity. Supported entities: `get_company_enrichment`.
- `voxgig-openapi-spec_load`: Load one record for an entity. No active entity supports this operation.

## Operational features

Features supply behaviour around API calls, such as request handling, diagnostics, or local testing. Inclusion in this project does not mean a feature is enabled at runtime. Check the selected SDK’s supported features and configuration defaults, then enable the behaviour your application needs.

- `netsim`: Network behaviour simulation for offline testing (latency, failures, outages)
- `test`: In-memory mock transport for testing without a live server

Start with the default client configuration. Add request limits and diagnostics as needed, test error paths, and review retry behaviour before using operations that change data. A retry can repeat an operation unless the API provides a suitable guarantee.

## Continue with the documentation

- Follow the first-call guide for the setup sequence.
- Read the authentication guide before using protected routes.
- Use the API reference for request schemas, response formats, and status codes.
- Check the chosen SDK or companion tool reference for its configuration and supported operations.

