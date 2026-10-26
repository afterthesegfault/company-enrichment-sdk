import { describe, test } from 'node:test'
import { SDK } from '..'
import { runDefinitionPoint } from './definition-runner'
import { isControlSkipped } from './utility'


// Generated from the API definition, not from the model this SDK was built
// from: the route, the declared query parameters, the credential the security
// scheme names, and the definition's own response example.
const PLAN: any[] = [
  {
    "entity": "get_company_enrichment",
    "accessor": "GetCompanyEnrichment",
    "op": "list",
    "method": "GET",
    "path": "/",
    "args": [],
    "select": {
      "domain": "airbnb.com",
      "field": "company_name,industry,employee_range"
    },
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [
      "domain",
      "fields"
    ],
    "queryArgs": [
      {
        "name": "domain",
        "wire": "domain"
      },
      {
        "name": "field",
        "wire": "fields"
      }
    ],
    "auth": [
      [
        {
          "in": "query",
          "name": "api_key"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "domain": "airbnb.com",
      "company_name": "Airbnb",
      "description": "Airbnb is a company that provides a wide array of accommodations for every type of traveler. With over 7 million vacation rentals and 2 million top-rated guest favorites across more than 220 countries and regions, Airbnb offers a unique and diverse selection of stays worldwide.",
      "logo": "https://logo.abstractapi.com/cb6281618-c67a-5004-9c9b-29fc2245a4f7_-airbnb.png",
      "year_founded": "2008",
      "street_address": "888 Brannan Street",
      "city": "San Francisco",
      "state": "California",
      "country": "United States",
      "country_iso_code": "US",
      "postal_code": "94103",
      "latitude": 37.7719568,
      "longitude": -122.4054484,
      "sic_code": "87",
      "naics_code": "54",
      "industry": "Travel Services",
      "employee_count": "6907",
      "employee_range": "5K-10K",
      "annual_revenue": "9917000000",
      "revenue_range": "$1B-$10B",
      "phone_numbers": [
        "+14155104027"
      ],
      "email_addresses": [
        "support@airbnb.com"
      ],
      "type": "public",
      "ticker": "ABNB",
      "exchange": "XNAS",
      "global_ranking": "7391",
      "tags": [
        "Hospitality",
        "Travel"
      ],
      "technologies": [
        "Google Analytics",
        "Javascript",
        "Segment"
      ],
      "linkedin_url": "linkedin.com/company/airbnb",
      "facebook_url": "facebook.com/airbnb",
      "twitter_url": "twitter.com/airbnb",
      "instagram_url": "instagram.com/airbnb",
      "crunchbase_url": "crunchbase.com/organization/airbnb"
    },
    "idField": "id",
    "ownQuery": "api_key"
  },
  {
    "entity": "post_company_enrichment",
    "accessor": "PostCompanyEnrichment",
    "op": "create",
    "method": "POST",
    "path": "/",
    "args": [],
    "select": {},
    "headers": [],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "query",
          "name": "api_key"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "domain": "airbnb.com",
      "company_name": "Airbnb",
      "description": "x",
      "logo": "x",
      "year_founded": "2008",
      "street_address": "x",
      "city": "x",
      "state": "x",
      "country": "x",
      "country_iso_code": "US",
      "postal_code": "x",
      "latitude": 37.7719568,
      "longitude": -122.4054484,
      "sic_code": "87",
      "naics_code": "54",
      "industry": "Travel Services",
      "employee_count": "6907",
      "employee_range": "5K-10K",
      "annual_revenue": "9917000000",
      "revenue_range": "$1B-$10B",
      "phone_numbers": [
        "x"
      ],
      "email_addresses": [
        "x"
      ],
      "type": "public",
      "ticker": "ABNB",
      "exchange": "XNAS",
      "global_ranking": "7391",
      "tags": [
        "x"
      ],
      "technologies": [
        "x"
      ],
      "linkedin_url": "linkedin.com/company/airbnb",
      "facebook_url": "facebook.com/airbnb",
      "twitter_url": "twitter.com/airbnb",
      "instagram_url": "instagram.com/airbnb",
      "crunchbase_url": "crunchbase.com/organization/airbnb"
    },
    "idField": "id",
    "ownQuery": "api_key"
  }
]


describe('definition', () => {
  for (const point of PLAN) {
    test(point.entity + '.' + point.op + ' ' + point.method + ' ' + point.path, async (t) => {
      const control = isControlSkipped('entityOp', point.entity + '.' + point.op, 'definition')
      if (control.skip) {
        t.skip(control.reason || 'skipped via sdk-test-control.json')
        return
      }
      await runDefinitionPoint(SDK, point)
    })
  }
})
