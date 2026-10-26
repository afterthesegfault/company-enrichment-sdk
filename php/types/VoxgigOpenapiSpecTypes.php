<?php
declare(strict_types=1);

// Typed models for the VoxgigOpenapiSpec SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
//
// These are documentation-grade value objects (PHP 8 typed properties),
// registered on the composer classmap autoload. The SDK boundary exchanges
// assoc-arrays; these classes name the shapes for tooling and typed callers.

/** GetCompanyEnrichment entity data model. */
class GetCompanyEnrichment
{
    public ?string $annual_revenue = null;
    public ?string $city = null;
    public ?string $company_name = null;
    public ?string $country = null;
    public ?string $country_iso_code = null;
    public ?string $crunchbase_url = null;
    public ?string $description = null;
    public ?string $domain = null;
    public ?array $email_addresses = null;
    public ?string $employee_count = null;
    public ?string $employee_range = null;
    public ?string $exchange = null;
    public ?string $facebook_url = null;
    public ?string $global_ranking = null;
    public ?string $industry = null;
    public ?string $instagram_url = null;
    public ?float $latitude = null;
    public ?string $linkedin_url = null;
    public ?string $logo = null;
    public ?float $longitude = null;
    public ?string $naics_code = null;
    public ?array $phone_numbers = null;
    public ?string $postal_code = null;
    public ?string $revenue_range = null;
    public ?string $sic_code = null;
    public ?string $state = null;
    public ?string $street_address = null;
    public ?array $tags = null;
    public ?array $technologies = null;
    public ?string $ticker = null;
    public ?string $twitter_url = null;
    public ?string $type = null;
    public ?string $year_founded = null;
}

/** Request payload for GetCompanyEnrichment#list. */
class GetCompanyEnrichmentListMatch
{
    public string $domain;
    public ?string $field = null;
}

/** PostCompanyEnrichment entity data model. */
class PostCompanyEnrichment
{
    public ?string $annual_revenue = null;
    public ?string $api_key = null;
    public ?string $city = null;
    public ?string $company_name = null;
    public ?string $country = null;
    public ?string $country_iso_code = null;
    public ?string $crunchbase_url = null;
    public ?string $description = null;
    public ?string $domain = null;
    public ?array $email_addresses = null;
    public ?string $employee_count = null;
    public ?string $employee_range = null;
    public ?string $exchange = null;
    public ?string $facebook_url = null;
    public ?string $fields = null;
    public ?string $global_ranking = null;
    public ?string $industry = null;
    public ?string $instagram_url = null;
    public ?float $latitude = null;
    public ?string $linkedin_url = null;
    public ?string $logo = null;
    public ?float $longitude = null;
    public ?string $naics_code = null;
    public ?array $phone_numbers = null;
    public ?string $postal_code = null;
    public ?string $revenue_range = null;
    public ?string $sic_code = null;
    public ?string $state = null;
    public ?string $street_address = null;
    public ?array $tags = null;
    public ?array $technologies = null;
    public ?string $ticker = null;
    public ?string $twitter_url = null;
    public ?string $type = null;
    public ?string $year_founded = null;
}

/** Request payload for PostCompanyEnrichment#create. */
class PostCompanyEnrichmentCreateData
{
    public ?string $api_key = null;
    public string $domain;
    public ?string $fields = null;
}

