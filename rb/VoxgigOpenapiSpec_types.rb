# frozen_string_literal: true

# Typed models for the VoxgigOpenapiSpec SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# GetCompanyEnrichment entity data model.
#
# @!attribute [rw] annual_revenue
#   @return [String, nil]
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] company_name
#   @return [String, nil]
#
# @!attribute [rw] country
#   @return [String, nil]
#
# @!attribute [rw] country_iso_code
#   @return [String, nil]
#
# @!attribute [rw] crunchbase_url
#   @return [String, nil]
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] domain
#   @return [String, nil]
#
# @!attribute [rw] email_addresses
#   @return [Array, nil]
#
# @!attribute [rw] employee_count
#   @return [String, nil]
#
# @!attribute [rw] employee_range
#   @return [String, nil]
#
# @!attribute [rw] exchange
#   @return [String, nil]
#
# @!attribute [rw] facebook_url
#   @return [String, nil]
#
# @!attribute [rw] global_ranking
#   @return [String, nil]
#
# @!attribute [rw] industry
#   @return [String, nil]
#
# @!attribute [rw] instagram_url
#   @return [String, nil]
#
# @!attribute [rw] latitude
#   @return [Float, nil]
#
# @!attribute [rw] linkedin_url
#   @return [String, nil]
#
# @!attribute [rw] logo
#   @return [String, nil]
#
# @!attribute [rw] longitude
#   @return [Float, nil]
#
# @!attribute [rw] naics_code
#   @return [String, nil]
#
# @!attribute [rw] phone_numbers
#   @return [Array, nil]
#
# @!attribute [rw] postal_code
#   @return [String, nil]
#
# @!attribute [rw] revenue_range
#   @return [String, nil]
#
# @!attribute [rw] sic_code
#   @return [String, nil]
#
# @!attribute [rw] state
#   @return [String, nil]
#
# @!attribute [rw] street_address
#   @return [String, nil]
#
# @!attribute [rw] tags
#   @return [Array, nil]
#
# @!attribute [rw] technologies
#   @return [Array, nil]
#
# @!attribute [rw] ticker
#   @return [String, nil]
#
# @!attribute [rw] twitter_url
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] year_founded
#   @return [String, nil]
GetCompanyEnrichment = Struct.new(
  :annual_revenue,
  :city,
  :company_name,
  :country,
  :country_iso_code,
  :crunchbase_url,
  :description,
  :domain,
  :email_addresses,
  :employee_count,
  :employee_range,
  :exchange,
  :facebook_url,
  :global_ranking,
  :industry,
  :instagram_url,
  :latitude,
  :linkedin_url,
  :logo,
  :longitude,
  :naics_code,
  :phone_numbers,
  :postal_code,
  :revenue_range,
  :sic_code,
  :state,
  :street_address,
  :tags,
  :technologies,
  :ticker,
  :twitter_url,
  :type,
  :year_founded,
  keyword_init: true
)

# Request payload for GetCompanyEnrichment#list.
#
# @!attribute [rw] domain
#   @return [String]
#
# @!attribute [rw] field
#   @return [String, nil]
GetCompanyEnrichmentListMatch = Struct.new(
  :domain,
  :field,
  keyword_init: true
)

# PostCompanyEnrichment entity data model.
#
# @!attribute [rw] annual_revenue
#   @return [String, nil]
#
# @!attribute [rw] api_key
#   @return [String, nil]
#
# @!attribute [rw] city
#   @return [String, nil]
#
# @!attribute [rw] company_name
#   @return [String, nil]
#
# @!attribute [rw] country
#   @return [String, nil]
#
# @!attribute [rw] country_iso_code
#   @return [String, nil]
#
# @!attribute [rw] crunchbase_url
#   @return [String, nil]
#
# @!attribute [rw] description
#   @return [String, nil]
#
# @!attribute [rw] domain
#   @return [String, nil]
#
# @!attribute [rw] email_addresses
#   @return [Array, nil]
#
# @!attribute [rw] employee_count
#   @return [String, nil]
#
# @!attribute [rw] employee_range
#   @return [String, nil]
#
# @!attribute [rw] exchange
#   @return [String, nil]
#
# @!attribute [rw] facebook_url
#   @return [String, nil]
#
# @!attribute [rw] fields
#   @return [String, nil]
#
# @!attribute [rw] global_ranking
#   @return [String, nil]
#
# @!attribute [rw] industry
#   @return [String, nil]
#
# @!attribute [rw] instagram_url
#   @return [String, nil]
#
# @!attribute [rw] latitude
#   @return [Float, nil]
#
# @!attribute [rw] linkedin_url
#   @return [String, nil]
#
# @!attribute [rw] logo
#   @return [String, nil]
#
# @!attribute [rw] longitude
#   @return [Float, nil]
#
# @!attribute [rw] naics_code
#   @return [String, nil]
#
# @!attribute [rw] phone_numbers
#   @return [Array, nil]
#
# @!attribute [rw] postal_code
#   @return [String, nil]
#
# @!attribute [rw] revenue_range
#   @return [String, nil]
#
# @!attribute [rw] sic_code
#   @return [String, nil]
#
# @!attribute [rw] state
#   @return [String, nil]
#
# @!attribute [rw] street_address
#   @return [String, nil]
#
# @!attribute [rw] tags
#   @return [Array, nil]
#
# @!attribute [rw] technologies
#   @return [Array, nil]
#
# @!attribute [rw] ticker
#   @return [String, nil]
#
# @!attribute [rw] twitter_url
#   @return [String, nil]
#
# @!attribute [rw] type
#   @return [String, nil]
#
# @!attribute [rw] year_founded
#   @return [String, nil]
PostCompanyEnrichment = Struct.new(
  :annual_revenue,
  :api_key,
  :city,
  :company_name,
  :country,
  :country_iso_code,
  :crunchbase_url,
  :description,
  :domain,
  :email_addresses,
  :employee_count,
  :employee_range,
  :exchange,
  :facebook_url,
  :fields,
  :global_ranking,
  :industry,
  :instagram_url,
  :latitude,
  :linkedin_url,
  :logo,
  :longitude,
  :naics_code,
  :phone_numbers,
  :postal_code,
  :revenue_range,
  :sic_code,
  :state,
  :street_address,
  :tags,
  :technologies,
  :ticker,
  :twitter_url,
  :type,
  :year_founded,
  keyword_init: true
)

# Request payload for PostCompanyEnrichment#create.
#
# @!attribute [rw] api_key
#   @return [String, nil]
#
# @!attribute [rw] domain
#   @return [String]
#
# @!attribute [rw] fields
#   @return [String, nil]
PostCompanyEnrichmentCreateData = Struct.new(
  :api_key,
  :domain,
  :fields,
  keyword_init: true
)

