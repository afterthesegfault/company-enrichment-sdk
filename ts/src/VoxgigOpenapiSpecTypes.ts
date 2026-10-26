// Typed models for the VoxgigOpenapiSpec SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface GetCompanyEnrichment {
  annual_revenue?: string
  city?: string
  company_name?: string
  country?: string
  country_iso_code?: string
  crunchbase_url?: string
  description?: string
  domain?: string
  email_addresses?: any[]
  employee_count?: string
  employee_range?: string
  exchange?: string
  facebook_url?: string
  global_ranking?: string
  industry?: string
  instagram_url?: string
  latitude?: number
  linkedin_url?: string
  logo?: string
  longitude?: number
  naics_code?: string
  phone_numbers?: any[]
  postal_code?: string
  revenue_range?: string
  sic_code?: string
  state?: string
  street_address?: string
  tags?: any[]
  technologies?: any[]
  ticker?: string
  twitter_url?: string
  type?: string
  year_founded?: string
}

export interface GetCompanyEnrichmentListMatch {
  domain: string
  field?: string
}

export interface PostCompanyEnrichment {
  annual_revenue?: string
  api_key?: string
  city?: string
  company_name?: string
  country?: string
  country_iso_code?: string
  crunchbase_url?: string
  description?: string
  domain?: string
  email_addresses?: any[]
  employee_count?: string
  employee_range?: string
  exchange?: string
  facebook_url?: string
  fields?: string
  global_ranking?: string
  industry?: string
  instagram_url?: string
  latitude?: number
  linkedin_url?: string
  logo?: string
  longitude?: number
  naics_code?: string
  phone_numbers?: any[]
  postal_code?: string
  revenue_range?: string
  sic_code?: string
  state?: string
  street_address?: string
  tags?: any[]
  technologies?: any[]
  ticker?: string
  twitter_url?: string
  type?: string
  year_founded?: string
}

export interface PostCompanyEnrichmentCreateData {
  api_key?: string
  domain: string
  fields?: string
}

