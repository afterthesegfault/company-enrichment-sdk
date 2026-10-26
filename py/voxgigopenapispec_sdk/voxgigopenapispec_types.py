# Typed models for the VoxgigOpenapiSpec SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class GetCompanyEnrichment(TypedDict, total=False):
    annual_revenue: str
    city: str
    company_name: str
    country: str
    country_iso_code: str
    crunchbase_url: str
    description: str
    domain: str
    email_addresses: list
    employee_count: str
    employee_range: str
    exchange: str
    facebook_url: str
    global_ranking: str
    industry: str
    instagram_url: str
    latitude: float
    linkedin_url: str
    logo: str
    longitude: float
    naics_code: str
    phone_numbers: list
    postal_code: str
    revenue_range: str
    sic_code: str
    state: str
    street_address: str
    tags: list
    technologies: list
    ticker: str
    twitter_url: str
    type: str
    year_founded: str


class GetCompanyEnrichmentListMatchRequired(TypedDict):
    domain: str


class GetCompanyEnrichmentListMatch(GetCompanyEnrichmentListMatchRequired, total=False):
    field: str


class PostCompanyEnrichment(TypedDict, total=False):
    annual_revenue: str
    api_key: str
    city: str
    company_name: str
    country: str
    country_iso_code: str
    crunchbase_url: str
    description: str
    domain: str
    email_addresses: list
    employee_count: str
    employee_range: str
    exchange: str
    facebook_url: str
    fields: str
    global_ranking: str
    industry: str
    instagram_url: str
    latitude: float
    linkedin_url: str
    logo: str
    longitude: float
    naics_code: str
    phone_numbers: list
    postal_code: str
    revenue_range: str
    sic_code: str
    state: str
    street_address: str
    tags: list
    technologies: list
    ticker: str
    twitter_url: str
    type: str
    year_founded: str


class PostCompanyEnrichmentCreateDataRequired(TypedDict):
    domain: str


class PostCompanyEnrichmentCreateData(PostCompanyEnrichmentCreateDataRequired, total=False):
    api_key: str
    fields: str
