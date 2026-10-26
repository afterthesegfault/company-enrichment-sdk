-- VoxgigOpenapiSpec SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "VoxgigOpenapiSpec",
      slug = "voxgig-openapi-spec",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["netsim"] = {
        ["options"] = {
          ["active"] = false,
          ["errorTimes"] = 0,
          ["failEvery"] = 0,
          ["failRate"] = 0,
          ["failStatus"] = 503,
          ["failTimes"] = 0,
          ["latency"] = 0,
          ["offline"] = false,
          ["rateLimitTimes"] = 0,
          ["retryAfter"] = 0,
          ["seed"] = 1,
        },
        ["optspec"] = {
          ["latency"] = {
            "`$ONE`",
            "`$NUMBER`",
            "`$MAP`",
          },
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["optspec"] = {
          ["entity"] = "`$MAP`",
          ["net"] = "`$MAP`",
        },
        ["strict"] = false,
        ["transport"] = "base",
      },
    },
    options = {
      base = "https://companyenrichment.abstractapi.com/v2",
      auth = {
        prefix = "",
        ["in"] = "query",
        name = "api_key",
      },
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["get_company_enrichment"] = {},
        ["post_company_enrichment"] = {},
      },
    },
    entity = {
      ["get_company_enrichment"] = {
        ["fields"] = {
          {
            ["name"] = "annual_revenue",
            ["title"] = "Annual Revenue",
            ["type"] = "`$STRING`",
            ["short"] = "Estimated annual revenue.",
          },
          {
            ["name"] = "city",
            ["title"] = "City",
            ["type"] = "`$STRING`",
            ["short"] = "City of the company headquarters.",
          },
          {
            ["name"] = "company_name",
            ["title"] = "Company Name",
            ["type"] = "`$STRING`",
            ["short"] = "Company name.",
          },
          {
            ["name"] = "country",
            ["title"] = "Country",
            ["type"] = "`$STRING`",
            ["short"] = "Country of the company headquarters.",
          },
          {
            ["name"] = "country_iso_code",
            ["title"] = "Country Iso Code",
            ["type"] = "`$STRING`",
            ["short"] = "ISO country code of the company headquarters.",
          },
          {
            ["name"] = "crunchbase_url",
            ["title"] = "Crunchbase Url",
            ["type"] = "`$STRING`",
            ["short"] = "Crunchbase profile URL.",
          },
          {
            ["name"] = "description",
            ["title"] = "Description",
            ["type"] = "`$STRING`",
            ["short"] = "Short description of the company.",
          },
          {
            ["name"] = "domain",
            ["title"] = "Domain",
            ["type"] = "`$STRING`",
            ["short"] = "The domain that was enriched (echoes the input).",
          },
          {
            ["name"] = "email_addresses",
            ["title"] = "Email Addresses",
            ["type"] = "`$ARRAY`",
            ["short"] = "Known company email addresses.",
          },
          {
            ["name"] = "employee_count",
            ["title"] = "Employee Count",
            ["type"] = "`$STRING`",
            ["short"] = "Estimated number of employees.",
          },
          {
            ["name"] = "employee_range",
            ["title"] = "Employee Range",
            ["type"] = "`$STRING`",
            ["short"] = "Estimated employee count range.",
          },
          {
            ["name"] = "exchange",
            ["title"] = "Exchange",
            ["type"] = "`$STRING`",
            ["short"] = "Stock exchange where the company is listed.",
          },
          {
            ["name"] = "facebook_url",
            ["title"] = "Facebook Url",
            ["type"] = "`$STRING`",
            ["short"] = "Facebook profile URL.",
          },
          {
            ["name"] = "global_ranking",
            ["title"] = "Global Ranking",
            ["type"] = "`$STRING`",
            ["short"] = "Global web traffic ranking of the company.",
          },
          {
            ["name"] = "industry",
            ["title"] = "Industry",
            ["type"] = "`$STRING`",
            ["short"] = "Industry the company operates in.",
          },
          {
            ["name"] = "instagram_url",
            ["title"] = "Instagram Url",
            ["type"] = "`$STRING`",
            ["short"] = "Instagram profile URL.",
          },
          {
            ["name"] = "latitude",
            ["title"] = "Latitude",
            ["type"] = "`$NUMBER`",
            ["short"] = "Latitude of the company headquarters.",
          },
          {
            ["name"] = "linkedin_url",
            ["title"] = "Linkedin Url",
            ["type"] = "`$STRING`",
            ["short"] = "LinkedIn profile URL.",
          },
          {
            ["name"] = "logo",
            ["title"] = "Logo",
            ["type"] = "`$STRING`",
            ["short"] = "URL of the company logo.",
          },
          {
            ["name"] = "longitude",
            ["title"] = "Longitude",
            ["type"] = "`$NUMBER`",
            ["short"] = "Longitude of the company headquarters.",
          },
          {
            ["name"] = "naics_code",
            ["title"] = "Naics Code",
            ["type"] = "`$STRING`",
            ["short"] = "North American Industry Classification System (NAICS) code.",
          },
          {
            ["name"] = "phone_numbers",
            ["title"] = "Phone Numbers",
            ["type"] = "`$ARRAY`",
            ["short"] = "Known company phone numbers.",
          },
          {
            ["name"] = "postal_code",
            ["title"] = "Postal Code",
            ["type"] = "`$STRING`",
            ["short"] = "Postal or ZIP code of the company headquarters.",
          },
          {
            ["name"] = "revenue_range",
            ["title"] = "Revenue Range",
            ["type"] = "`$STRING`",
            ["short"] = "Estimated annual revenue range.",
          },
          {
            ["name"] = "sic_code",
            ["title"] = "Sic Code",
            ["type"] = "`$STRING`",
            ["short"] = "Standard Industrial Classification (SIC) code.",
          },
          {
            ["name"] = "state",
            ["title"] = "State",
            ["type"] = "`$STRING`",
            ["short"] = "State or region of the company headquarters.",
          },
          {
            ["name"] = "street_address",
            ["title"] = "Street Address",
            ["type"] = "`$STRING`",
            ["short"] = "Street address of the company headquarters.",
          },
          {
            ["name"] = "tags",
            ["title"] = "Tags",
            ["type"] = "`$ARRAY`",
            ["short"] = "Descriptive tags for the company.",
          },
          {
            ["name"] = "technologies",
            ["title"] = "Technologies",
            ["type"] = "`$ARRAY`",
            ["short"] = "Technologies detected in use by the company.",
          },
          {
            ["name"] = "ticker",
            ["title"] = "Ticker",
            ["type"] = "`$STRING`",
            ["short"] = "Stock ticker symbol for publicly traded companies.",
          },
          {
            ["name"] = "twitter_url",
            ["title"] = "Twitter Url",
            ["type"] = "`$STRING`",
            ["short"] = "Twitter/X profile URL.",
          },
          {
            ["name"] = "type",
            ["title"] = "Type",
            ["type"] = "`$STRING`",
            ["short"] = "Whether the company is public or private.",
          },
          {
            ["name"] = "year_founded",
            ["title"] = "Year Founded",
            ["type"] = "`$STRING`",
            ["short"] = "Year the company was founded.",
          },
        },
        ["name"] = "get_company_enrichment",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/",
                ["segments"] = {},
                ["parts"] = {},
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["args"] = {
                  ["query"] = {
                    {
                      ["name"] = "domain",
                      ["orig"] = "domain",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                      ["reqd"] = true,
                      ["example"] = "airbnb.com",
                      ["field"] = true,
                    },
                    {
                      ["name"] = "field",
                      ["orig"] = "fields",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                      ["example"] = "company_name,industry,employee_range",
                    },
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "domain",
                  },
                },
                ["response"] = {
                  ["kind"] = "json",
                  ["media"] = "application/json",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["post_company_enrichment"] = {
        ["fields"] = {
          {
            ["name"] = "annual_revenue",
            ["title"] = "Annual Revenue",
            ["type"] = "`$STRING`",
            ["short"] = "Estimated annual revenue.",
          },
          {
            ["name"] = "api_key",
            ["title"] = "Api Key",
            ["type"] = "`$STRING`",
            ["short"] = "Your API key.",
          },
          {
            ["name"] = "city",
            ["title"] = "City",
            ["type"] = "`$STRING`",
            ["short"] = "City of the company headquarters.",
          },
          {
            ["name"] = "company_name",
            ["title"] = "Company Name",
            ["type"] = "`$STRING`",
            ["short"] = "Company name.",
          },
          {
            ["name"] = "country",
            ["title"] = "Country",
            ["type"] = "`$STRING`",
            ["short"] = "Country of the company headquarters.",
          },
          {
            ["name"] = "country_iso_code",
            ["title"] = "Country Iso Code",
            ["type"] = "`$STRING`",
            ["short"] = "ISO country code of the company headquarters.",
          },
          {
            ["name"] = "crunchbase_url",
            ["title"] = "Crunchbase Url",
            ["type"] = "`$STRING`",
            ["short"] = "Crunchbase profile URL.",
          },
          {
            ["name"] = "description",
            ["title"] = "Description",
            ["type"] = "`$STRING`",
            ["short"] = "Short description of the company.",
          },
          {
            ["name"] = "domain",
            ["title"] = "Domain",
            ["type"] = "`$STRING`",
            ["op"] = {
              ["create"] = {
                ["req"] = true,
                ["type"] = "`$STRING`",
              },
            },
            ["short"] = "The domain that was enriched (echoes the input).",
          },
          {
            ["name"] = "email_addresses",
            ["title"] = "Email Addresses",
            ["type"] = "`$ARRAY`",
            ["short"] = "Known company email addresses.",
          },
          {
            ["name"] = "employee_count",
            ["title"] = "Employee Count",
            ["type"] = "`$STRING`",
            ["short"] = "Estimated number of employees.",
          },
          {
            ["name"] = "employee_range",
            ["title"] = "Employee Range",
            ["type"] = "`$STRING`",
            ["short"] = "Estimated employee count range.",
          },
          {
            ["name"] = "exchange",
            ["title"] = "Exchange",
            ["type"] = "`$STRING`",
            ["short"] = "Stock exchange where the company is listed.",
          },
          {
            ["name"] = "facebook_url",
            ["title"] = "Facebook Url",
            ["type"] = "`$STRING`",
            ["short"] = "Facebook profile URL.",
          },
          {
            ["name"] = "fields",
            ["title"] = "Fields",
            ["type"] = "`$STRING`",
            ["short"] = "Optional comma-separated list of top-level JSON keys to return.",
          },
          {
            ["name"] = "global_ranking",
            ["title"] = "Global Ranking",
            ["type"] = "`$STRING`",
            ["short"] = "Global web traffic ranking of the company.",
          },
          {
            ["name"] = "industry",
            ["title"] = "Industry",
            ["type"] = "`$STRING`",
            ["short"] = "Industry the company operates in.",
          },
          {
            ["name"] = "instagram_url",
            ["title"] = "Instagram Url",
            ["type"] = "`$STRING`",
            ["short"] = "Instagram profile URL.",
          },
          {
            ["name"] = "latitude",
            ["title"] = "Latitude",
            ["type"] = "`$NUMBER`",
            ["short"] = "Latitude of the company headquarters.",
          },
          {
            ["name"] = "linkedin_url",
            ["title"] = "Linkedin Url",
            ["type"] = "`$STRING`",
            ["short"] = "LinkedIn profile URL.",
          },
          {
            ["name"] = "logo",
            ["title"] = "Logo",
            ["type"] = "`$STRING`",
            ["short"] = "URL of the company logo.",
          },
          {
            ["name"] = "longitude",
            ["title"] = "Longitude",
            ["type"] = "`$NUMBER`",
            ["short"] = "Longitude of the company headquarters.",
          },
          {
            ["name"] = "naics_code",
            ["title"] = "Naics Code",
            ["type"] = "`$STRING`",
            ["short"] = "North American Industry Classification System (NAICS) code.",
          },
          {
            ["name"] = "phone_numbers",
            ["title"] = "Phone Numbers",
            ["type"] = "`$ARRAY`",
            ["short"] = "Known company phone numbers.",
          },
          {
            ["name"] = "postal_code",
            ["title"] = "Postal Code",
            ["type"] = "`$STRING`",
            ["short"] = "Postal or ZIP code of the company headquarters.",
          },
          {
            ["name"] = "revenue_range",
            ["title"] = "Revenue Range",
            ["type"] = "`$STRING`",
            ["short"] = "Estimated annual revenue range.",
          },
          {
            ["name"] = "sic_code",
            ["title"] = "Sic Code",
            ["type"] = "`$STRING`",
            ["short"] = "Standard Industrial Classification (SIC) code.",
          },
          {
            ["name"] = "state",
            ["title"] = "State",
            ["type"] = "`$STRING`",
            ["short"] = "State or region of the company headquarters.",
          },
          {
            ["name"] = "street_address",
            ["title"] = "Street Address",
            ["type"] = "`$STRING`",
            ["short"] = "Street address of the company headquarters.",
          },
          {
            ["name"] = "tags",
            ["title"] = "Tags",
            ["type"] = "`$ARRAY`",
            ["short"] = "Descriptive tags for the company.",
          },
          {
            ["name"] = "technologies",
            ["title"] = "Technologies",
            ["type"] = "`$ARRAY`",
            ["short"] = "Technologies detected in use by the company.",
          },
          {
            ["name"] = "ticker",
            ["title"] = "Ticker",
            ["type"] = "`$STRING`",
            ["short"] = "Stock ticker symbol for publicly traded companies.",
          },
          {
            ["name"] = "twitter_url",
            ["title"] = "Twitter Url",
            ["type"] = "`$STRING`",
            ["short"] = "Twitter/X profile URL.",
          },
          {
            ["name"] = "type",
            ["title"] = "Type",
            ["type"] = "`$STRING`",
            ["short"] = "Whether the company is public or private.",
          },
          {
            ["name"] = "year_founded",
            ["title"] = "Year Founded",
            ["type"] = "`$STRING`",
            ["short"] = "Year the company was founded.",
          },
        },
        ["name"] = "post_company_enrichment",
        ["op"] = {
          ["create"] = {
            ["input"] = "data",
            ["name"] = "create",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "POST",
                ["orig"] = "/",
                ["segments"] = {},
                ["parts"] = {},
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["args"] = {},
                ["select"] = {},
                ["body"] = {
                  ["alternatives"] = {
                    {
                      ["fields"] = {
                        {
                          ["name"] = "api_key",
                        },
                        {
                          ["name"] = "domain",
                        },
                        {
                          ["name"] = "fields",
                        },
                      },
                      ["kind"] = "form",
                      ["media"] = "application/x-www-form-urlencoded",
                    },
                  },
                  ["kind"] = "json",
                  ["media"] = "application/json",
                },
                ["response"] = {
                  ["kind"] = "json",
                  ["media"] = "application/json",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
