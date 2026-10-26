package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "VoxgigOpenapiSpec",
			"slug": "voxgig-openapi-spec",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"netsim": map[string]any{
				"options": map[string]any{
					"active": false,
					"errorTimes": 0,
					"failEvery": 0,
					"failRate": 0,
					"failStatus": 503,
					"failTimes": 0,
					"latency": 0,
					"offline": false,
					"rateLimitTimes": 0,
					"retryAfter": 0,
					"seed": 1,
				},
				"optspec": map[string]any{
					"latency": []any{
						"`$ONE`",
						"`$NUMBER`",
						"`$MAP`",
					},
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"optspec": map[string]any{
					"entity": "`$MAP`",
					"net": "`$MAP`",
				},
				"strict": false,
				"transport": "base",
			},
		},
		"options": map[string]any{
			"base": "https://companyenrichment.abstractapi.com/v2",
			"auth": map[string]any{
				"prefix": "",
				"in": "query",
				"name": "api_key",
			},
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"get_company_enrichment": map[string]any{},
				"post_company_enrichment": map[string]any{},
			},
		},
		"entity": map[string]any{
			"get_company_enrichment": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "annual_revenue",
						"title": "Annual Revenue",
						"type": "`$STRING`",
						"short": "Estimated annual revenue.",
					},
					map[string]any{
						"name": "city",
						"title": "City",
						"type": "`$STRING`",
						"short": "City of the company headquarters.",
					},
					map[string]any{
						"name": "company_name",
						"title": "Company Name",
						"type": "`$STRING`",
						"short": "Company name.",
					},
					map[string]any{
						"name": "country",
						"title": "Country",
						"type": "`$STRING`",
						"short": "Country of the company headquarters.",
					},
					map[string]any{
						"name": "country_iso_code",
						"title": "Country Iso Code",
						"type": "`$STRING`",
						"short": "ISO country code of the company headquarters.",
					},
					map[string]any{
						"name": "crunchbase_url",
						"title": "Crunchbase Url",
						"type": "`$STRING`",
						"short": "Crunchbase profile URL.",
					},
					map[string]any{
						"name": "description",
						"title": "Description",
						"type": "`$STRING`",
						"short": "Short description of the company.",
					},
					map[string]any{
						"name": "domain",
						"title": "Domain",
						"type": "`$STRING`",
						"short": "The domain that was enriched (echoes the input).",
					},
					map[string]any{
						"name": "email_addresses",
						"title": "Email Addresses",
						"type": "`$ARRAY`",
						"short": "Known company email addresses.",
					},
					map[string]any{
						"name": "employee_count",
						"title": "Employee Count",
						"type": "`$STRING`",
						"short": "Estimated number of employees.",
					},
					map[string]any{
						"name": "employee_range",
						"title": "Employee Range",
						"type": "`$STRING`",
						"short": "Estimated employee count range.",
					},
					map[string]any{
						"name": "exchange",
						"title": "Exchange",
						"type": "`$STRING`",
						"short": "Stock exchange where the company is listed.",
					},
					map[string]any{
						"name": "facebook_url",
						"title": "Facebook Url",
						"type": "`$STRING`",
						"short": "Facebook profile URL.",
					},
					map[string]any{
						"name": "global_ranking",
						"title": "Global Ranking",
						"type": "`$STRING`",
						"short": "Global web traffic ranking of the company.",
					},
					map[string]any{
						"name": "industry",
						"title": "Industry",
						"type": "`$STRING`",
						"short": "Industry the company operates in.",
					},
					map[string]any{
						"name": "instagram_url",
						"title": "Instagram Url",
						"type": "`$STRING`",
						"short": "Instagram profile URL.",
					},
					map[string]any{
						"name": "latitude",
						"title": "Latitude",
						"type": "`$NUMBER`",
						"short": "Latitude of the company headquarters.",
					},
					map[string]any{
						"name": "linkedin_url",
						"title": "Linkedin Url",
						"type": "`$STRING`",
						"short": "LinkedIn profile URL.",
					},
					map[string]any{
						"name": "logo",
						"title": "Logo",
						"type": "`$STRING`",
						"short": "URL of the company logo.",
					},
					map[string]any{
						"name": "longitude",
						"title": "Longitude",
						"type": "`$NUMBER`",
						"short": "Longitude of the company headquarters.",
					},
					map[string]any{
						"name": "naics_code",
						"title": "Naics Code",
						"type": "`$STRING`",
						"short": "North American Industry Classification System (NAICS) code.",
					},
					map[string]any{
						"name": "phone_numbers",
						"title": "Phone Numbers",
						"type": "`$ARRAY`",
						"short": "Known company phone numbers.",
					},
					map[string]any{
						"name": "postal_code",
						"title": "Postal Code",
						"type": "`$STRING`",
						"short": "Postal or ZIP code of the company headquarters.",
					},
					map[string]any{
						"name": "revenue_range",
						"title": "Revenue Range",
						"type": "`$STRING`",
						"short": "Estimated annual revenue range.",
					},
					map[string]any{
						"name": "sic_code",
						"title": "Sic Code",
						"type": "`$STRING`",
						"short": "Standard Industrial Classification (SIC) code.",
					},
					map[string]any{
						"name": "state",
						"title": "State",
						"type": "`$STRING`",
						"short": "State or region of the company headquarters.",
					},
					map[string]any{
						"name": "street_address",
						"title": "Street Address",
						"type": "`$STRING`",
						"short": "Street address of the company headquarters.",
					},
					map[string]any{
						"name": "tags",
						"title": "Tags",
						"type": "`$ARRAY`",
						"short": "Descriptive tags for the company.",
					},
					map[string]any{
						"name": "technologies",
						"title": "Technologies",
						"type": "`$ARRAY`",
						"short": "Technologies detected in use by the company.",
					},
					map[string]any{
						"name": "ticker",
						"title": "Ticker",
						"type": "`$STRING`",
						"short": "Stock ticker symbol for publicly traded companies.",
					},
					map[string]any{
						"name": "twitter_url",
						"title": "Twitter Url",
						"type": "`$STRING`",
						"short": "Twitter/X profile URL.",
					},
					map[string]any{
						"name": "type",
						"title": "Type",
						"type": "`$STRING`",
						"short": "Whether the company is public or private.",
					},
					map[string]any{
						"name": "year_founded",
						"title": "Year Founded",
						"type": "`$STRING`",
						"short": "Year the company was founded.",
					},
				},
				"name": "get_company_enrichment",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "GET",
								"orig": "/",
								"segments": []any{},
								"parts": []any{},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"name": "domain",
											"orig": "domain",
											"type": "`$STRING`",
											"kind": "query",
											"reqd": true,
											"example": "airbnb.com",
											"field": true,
										},
										map[string]any{
											"name": "field",
											"orig": "fields",
											"type": "`$STRING`",
											"kind": "query",
											"example": "company_name,industry,employee_range",
										},
									},
								},
								"select": map[string]any{
									"exist": []any{
										"domain",
									},
								},
								"response": map[string]any{
									"kind": "json",
									"media": "application/json",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"post_company_enrichment": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "annual_revenue",
						"title": "Annual Revenue",
						"type": "`$STRING`",
						"short": "Estimated annual revenue.",
					},
					map[string]any{
						"name": "api_key",
						"title": "Api Key",
						"type": "`$STRING`",
						"short": "Your API key.",
					},
					map[string]any{
						"name": "city",
						"title": "City",
						"type": "`$STRING`",
						"short": "City of the company headquarters.",
					},
					map[string]any{
						"name": "company_name",
						"title": "Company Name",
						"type": "`$STRING`",
						"short": "Company name.",
					},
					map[string]any{
						"name": "country",
						"title": "Country",
						"type": "`$STRING`",
						"short": "Country of the company headquarters.",
					},
					map[string]any{
						"name": "country_iso_code",
						"title": "Country Iso Code",
						"type": "`$STRING`",
						"short": "ISO country code of the company headquarters.",
					},
					map[string]any{
						"name": "crunchbase_url",
						"title": "Crunchbase Url",
						"type": "`$STRING`",
						"short": "Crunchbase profile URL.",
					},
					map[string]any{
						"name": "description",
						"title": "Description",
						"type": "`$STRING`",
						"short": "Short description of the company.",
					},
					map[string]any{
						"name": "domain",
						"title": "Domain",
						"type": "`$STRING`",
						"op": map[string]any{
							"create": map[string]any{
								"req": true,
								"type": "`$STRING`",
							},
						},
						"short": "The domain that was enriched (echoes the input).",
					},
					map[string]any{
						"name": "email_addresses",
						"title": "Email Addresses",
						"type": "`$ARRAY`",
						"short": "Known company email addresses.",
					},
					map[string]any{
						"name": "employee_count",
						"title": "Employee Count",
						"type": "`$STRING`",
						"short": "Estimated number of employees.",
					},
					map[string]any{
						"name": "employee_range",
						"title": "Employee Range",
						"type": "`$STRING`",
						"short": "Estimated employee count range.",
					},
					map[string]any{
						"name": "exchange",
						"title": "Exchange",
						"type": "`$STRING`",
						"short": "Stock exchange where the company is listed.",
					},
					map[string]any{
						"name": "facebook_url",
						"title": "Facebook Url",
						"type": "`$STRING`",
						"short": "Facebook profile URL.",
					},
					map[string]any{
						"name": "fields",
						"title": "Fields",
						"type": "`$STRING`",
						"short": "Optional comma-separated list of top-level JSON keys to return.",
					},
					map[string]any{
						"name": "global_ranking",
						"title": "Global Ranking",
						"type": "`$STRING`",
						"short": "Global web traffic ranking of the company.",
					},
					map[string]any{
						"name": "industry",
						"title": "Industry",
						"type": "`$STRING`",
						"short": "Industry the company operates in.",
					},
					map[string]any{
						"name": "instagram_url",
						"title": "Instagram Url",
						"type": "`$STRING`",
						"short": "Instagram profile URL.",
					},
					map[string]any{
						"name": "latitude",
						"title": "Latitude",
						"type": "`$NUMBER`",
						"short": "Latitude of the company headquarters.",
					},
					map[string]any{
						"name": "linkedin_url",
						"title": "Linkedin Url",
						"type": "`$STRING`",
						"short": "LinkedIn profile URL.",
					},
					map[string]any{
						"name": "logo",
						"title": "Logo",
						"type": "`$STRING`",
						"short": "URL of the company logo.",
					},
					map[string]any{
						"name": "longitude",
						"title": "Longitude",
						"type": "`$NUMBER`",
						"short": "Longitude of the company headquarters.",
					},
					map[string]any{
						"name": "naics_code",
						"title": "Naics Code",
						"type": "`$STRING`",
						"short": "North American Industry Classification System (NAICS) code.",
					},
					map[string]any{
						"name": "phone_numbers",
						"title": "Phone Numbers",
						"type": "`$ARRAY`",
						"short": "Known company phone numbers.",
					},
					map[string]any{
						"name": "postal_code",
						"title": "Postal Code",
						"type": "`$STRING`",
						"short": "Postal or ZIP code of the company headquarters.",
					},
					map[string]any{
						"name": "revenue_range",
						"title": "Revenue Range",
						"type": "`$STRING`",
						"short": "Estimated annual revenue range.",
					},
					map[string]any{
						"name": "sic_code",
						"title": "Sic Code",
						"type": "`$STRING`",
						"short": "Standard Industrial Classification (SIC) code.",
					},
					map[string]any{
						"name": "state",
						"title": "State",
						"type": "`$STRING`",
						"short": "State or region of the company headquarters.",
					},
					map[string]any{
						"name": "street_address",
						"title": "Street Address",
						"type": "`$STRING`",
						"short": "Street address of the company headquarters.",
					},
					map[string]any{
						"name": "tags",
						"title": "Tags",
						"type": "`$ARRAY`",
						"short": "Descriptive tags for the company.",
					},
					map[string]any{
						"name": "technologies",
						"title": "Technologies",
						"type": "`$ARRAY`",
						"short": "Technologies detected in use by the company.",
					},
					map[string]any{
						"name": "ticker",
						"title": "Ticker",
						"type": "`$STRING`",
						"short": "Stock ticker symbol for publicly traded companies.",
					},
					map[string]any{
						"name": "twitter_url",
						"title": "Twitter Url",
						"type": "`$STRING`",
						"short": "Twitter/X profile URL.",
					},
					map[string]any{
						"name": "type",
						"title": "Type",
						"type": "`$STRING`",
						"short": "Whether the company is public or private.",
					},
					map[string]any{
						"name": "year_founded",
						"title": "Year Founded",
						"type": "`$STRING`",
						"short": "Year the company was founded.",
					},
				},
				"name": "post_company_enrichment",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"kind": "http",
								"method": "POST",
								"orig": "/",
								"segments": []any{},
								"parts": []any{},
								"rename": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"args": map[string]any{},
								"select": map[string]any{},
								"body": map[string]any{
									"alternatives": []any{
										map[string]any{
											"fields": []any{
												map[string]any{
													"name": "api_key",
												},
												map[string]any{
													"name": "domain",
												},
												map[string]any{
													"name": "fields",
												},
											},
											"kind": "form",
											"media": "application/x-www-form-urlencoded",
										},
									},
									"kind": "json",
									"media": "application/json",
								},
								"response": map[string]any{
									"kind": "json",
									"media": "application/json",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

// The plugin definitions the model selected per feature, as []any so a
// feature package can consume them without core naming its types. Empty
// when no active feature declares active plugin groups for this target.
var featurePlugins = map[string][]any{
}

// FeaturePlugins is the definitions list for one feature's chain.
func FeaturePlugins(name string) []any {
	return featurePlugins[name]
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "netsim":
		if NewNetsimFeatureFunc != nil {
			return NewNetsimFeatureFunc()
		}
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
