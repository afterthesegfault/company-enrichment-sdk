"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const node_path_1 = __importDefault(require("node:path"));
const Fs = __importStar(require("node:fs"));
const node_test_1 = require("node:test");
const node_assert_1 = __importDefault(require("node:assert"));
const live_runner_1 = require("../../live-runner");
const live_entity_1 = require("../../live-entity");
const __1 = require("../../..");
const utility_1 = require("../../utility");
(0, utility_1.loadEnvLocal)(__dirname + '/../../../.env.local');
(0, node_test_1.describe)('PostCompanyEnrichmentEntity', async () => {
    // Per-test live pacing. Delay is read from sdk-test-control.json's
    // `test.live.delayMs`; only sleeps when VOXGIG_OPENAPI_SPEC_TEST_LIVE=TRUE.
    (0, node_test_1.afterEach)((0, utility_1.liveDelay)('VOXGIG_OPENAPI_SPEC_TEST_LIVE'));
    (0, node_test_1.test)('instance', async () => {
        const testsdk = __1.VoxgigOpenapiSpecSDK.test();
        const ent = testsdk.PostCompanyEnrichment();
        (0, node_assert_1.default)(null != ent);
    });
    (0, node_test_1.test)('validate', async (t) => {
        if (null == __1.config.feature?.validate) {
            t.skip('feature not present in this SDK: validate');
            return;
        }
        const client = __1.VoxgigOpenapiSpecSDK.test(undefined, { feature: { validate: { active: true } } });
        await node_assert_1.default.rejects(client.PostCompanyEnrichment().create({ "api_key": 1, "domain": "x" }), (err) => 'validate_failed' === err.code);
    });
    (0, node_test_1.test)('basic', async (t) => {
        const live = 'TRUE' === process.env.VOXGIG_OPENAPI_SPEC_TEST_LIVE;
        for (const op of ['create']) {
            if (!live && (0, utility_1.maybeSkipControl)(t, 'entityOp', 'post_company_enrichment.' + op, live))
                return;
        }
        const setup = basicSetup();
        if (setup.live) {
            return (0, live_entity_1.runLiveEntity)(setup, { "active": true, "alias": { "field": {} }, "fields": { "annual_revenue": { "a": true, "h": "Annual Revenue", "n": "annual_revenue", "r": false, "sh": "Estimated annual revenue.", "t": "`$STRING`", "key$": "annual_revenue", "index$": 0 }, "api_key": { "a": true, "h": "Api Key", "n": "api_key", "r": false, "sh": "Your API key.", "t": "`$STRING`", "key$": "api_key", "index$": 1 }, "city": { "a": true, "h": "City", "n": "city", "r": false, "sh": "City of the company headquarters.", "t": "`$STRING`", "key$": "city", "index$": 2 }, "company_name": { "a": true, "h": "Company Name", "n": "company_name", "r": false, "sh": "Company name.", "t": "`$STRING`", "key$": "company_name", "index$": 3 }, "country": { "a": true, "h": "Country", "n": "country", "r": false, "sh": "Country of the company headquarters.", "t": "`$STRING`", "key$": "country", "index$": 4 }, "country_iso_code": { "a": true, "h": "Country Iso Code", "n": "country_iso_code", "r": false, "sh": "ISO country code of the company headquarters.", "t": "`$STRING`", "key$": "country_iso_code", "index$": 5 }, "crunchbase_url": { "a": true, "h": "Crunchbase Url", "n": "crunchbase_url", "r": false, "sh": "Crunchbase profile URL.", "t": "`$STRING`", "key$": "crunchbase_url", "index$": 6 }, "description": { "a": true, "h": "Description", "n": "description", "r": false, "sh": "Short description of the company.", "t": "`$STRING`", "key$": "description", "index$": 7 }, "domain": { "a": true, "h": "Domain", "n": "domain", "op": { "create": { "req": true, "type": "`$STRING`" } }, "r": false, "sh": "The domain that was enriched (echoes the input).", "t": "`$STRING`", "key$": "domain", "index$": 8 }, "email_addresses": { "a": true, "h": "Email Addresses", "n": "email_addresses", "r": false, "sh": "Known company email addresses.", "t": "`$ARRAY`", "key$": "email_addresses", "index$": 9 }, "employee_count": { "a": true, "h": "Employee Count", "n": "employee_count", "r": false, "sh": "Estimated number of employees.", "t": "`$STRING`", "key$": "employee_count", "index$": 10 }, "employee_range": { "a": true, "h": "Employee Range", "n": "employee_range", "r": false, "sh": "Estimated employee count range.", "t": "`$STRING`", "key$": "employee_range", "index$": 11 }, "exchange": { "a": true, "h": "Exchange", "n": "exchange", "r": false, "sh": "Stock exchange where the company is listed.", "t": "`$STRING`", "key$": "exchange", "index$": 12 }, "facebook_url": { "a": true, "h": "Facebook Url", "n": "facebook_url", "r": false, "sh": "Facebook profile URL.", "t": "`$STRING`", "key$": "facebook_url", "index$": 13 }, "fields": { "a": true, "h": "Fields", "n": "fields", "r": false, "sh": "Optional comma-separated list of top-level JSON keys to return.", "t": "`$STRING`", "key$": "fields", "index$": 14 }, "global_ranking": { "a": true, "h": "Global Ranking", "n": "global_ranking", "r": false, "sh": "Global web traffic ranking of the company.", "t": "`$STRING`", "key$": "global_ranking", "index$": 15 }, "industry": { "a": true, "h": "Industry", "n": "industry", "r": false, "sh": "Industry the company operates in.", "t": "`$STRING`", "key$": "industry", "index$": 16 }, "instagram_url": { "a": true, "h": "Instagram Url", "n": "instagram_url", "r": false, "sh": "Instagram profile URL.", "t": "`$STRING`", "key$": "instagram_url", "index$": 17 }, "latitude": { "a": true, "h": "Latitude", "n": "latitude", "r": false, "sh": "Latitude of the company headquarters.", "t": "`$NUMBER`", "key$": "latitude", "index$": 18 }, "linkedin_url": { "a": true, "h": "Linkedin Url", "n": "linkedin_url", "r": false, "sh": "LinkedIn profile URL.", "t": "`$STRING`", "key$": "linkedin_url", "index$": 19 }, "logo": { "a": true, "h": "Logo", "n": "logo", "r": false, "sh": "URL of the company logo.", "t": "`$STRING`", "key$": "logo", "index$": 20 }, "longitude": { "a": true, "h": "Longitude", "n": "longitude", "r": false, "sh": "Longitude of the company headquarters.", "t": "`$NUMBER`", "key$": "longitude", "index$": 21 }, "naics_code": { "a": true, "h": "Naics Code", "n": "naics_code", "r": false, "sh": "North American Industry Classification System (NAICS) code.", "t": "`$STRING`", "key$": "naics_code", "index$": 22 }, "phone_numbers": { "a": true, "h": "Phone Numbers", "n": "phone_numbers", "r": false, "sh": "Known company phone numbers.", "t": "`$ARRAY`", "key$": "phone_numbers", "index$": 23 }, "postal_code": { "a": true, "h": "Postal Code", "n": "postal_code", "r": false, "sh": "Postal or ZIP code of the company headquarters.", "t": "`$STRING`", "key$": "postal_code", "index$": 24 }, "revenue_range": { "a": true, "h": "Revenue Range", "n": "revenue_range", "r": false, "sh": "Estimated annual revenue range.", "t": "`$STRING`", "key$": "revenue_range", "index$": 25 }, "sic_code": { "a": true, "h": "Sic Code", "n": "sic_code", "r": false, "sh": "Standard Industrial Classification (SIC) code.", "t": "`$STRING`", "key$": "sic_code", "index$": 26 }, "state": { "a": true, "h": "State", "n": "state", "r": false, "sh": "State or region of the company headquarters.", "t": "`$STRING`", "key$": "state", "index$": 27 }, "street_address": { "a": true, "h": "Street Address", "n": "street_address", "r": false, "sh": "Street address of the company headquarters.", "t": "`$STRING`", "key$": "street_address", "index$": 28 }, "tags": { "a": true, "h": "Tags", "n": "tags", "r": false, "sh": "Descriptive tags for the company.", "t": "`$ARRAY`", "key$": "tags", "index$": 29 }, "technologies": { "a": true, "h": "Technologies", "n": "technologies", "r": false, "sh": "Technologies detected in use by the company.", "t": "`$ARRAY`", "key$": "technologies", "index$": 30 }, "ticker": { "a": true, "h": "Ticker", "n": "ticker", "r": false, "sh": "Stock ticker symbol for publicly traded companies.", "t": "`$STRING`", "key$": "ticker", "index$": 31 }, "twitter_url": { "a": true, "h": "Twitter Url", "n": "twitter_url", "r": false, "sh": "Twitter/X profile URL.", "t": "`$STRING`", "key$": "twitter_url", "index$": 32 }, "type": { "a": true, "h": "Type", "n": "type", "r": false, "sh": "Whether the company is public or private.", "t": "`$STRING`", "key$": "type", "index$": 33 }, "year_founded": { "a": true, "h": "Year Founded", "n": "year_founded", "r": false, "sh": "Year the company was founded.", "t": "`$STRING`", "key$": "year_founded", "index$": 34 } }, "name": "post_company_enrichment", "op": { "create": { "input": "data", "name": "create", "points": [{ "a": true, "bf": ["api_key", "domain", "fields"], "co": { "id": "POST /", "source": "openapi3", "version": 2 }, "g": {}, "k": "http", "m": "POST", "o": "/", "q": {}, "r": {}, "rb": { "alternatives": [{ "fields": [{ "name": "api_key" }, { "name": "domain" }, { "name": "fields" }], "kind": "form", "media": "application/x-www-form-urlencoded" }], "kind": "json", "media": "application/json" }, "rs": { "kind": "json", "media": "application/json" }, "s": [], "t": { "req": "`reqdata`", "res": "`body`" }, "index$": 0 }], "key$": "create" } }, "relations": { "ancestors": [] }, "key$": "post_company_enrichment", "name__orig": "post_company_enrichment", "Name": "PostCompanyEnrichment", "name_": "post_company_enrichment", "name-": "post-company-enrichment", "NAME": "POST_COMPANY_ENRICHMENT", "index$": 1 }, { "active": true, "entity": "post_company_enrichment", "key$": "BasicPostCompanyEnrichmentFlow", "kind": "basic", "name": "BasicPostCompanyEnrichmentFlow", "param": {}, "step": [{ "a": true, "d": {}, "i": { "ref": "post_company_enrichment_ref01" }, "m": {}, "o": "create", "s": [], "v": [], "index$": 0 }] }, 'PostCompanyEnrichment', { "POST /": { "protocol": "http", "requestBody": { "required": true, "content": { "application/x-www-form-urlencoded": { "schema": { "type": "object", "required": ["domain"], "properties": { "domain": { "type": "string", "description": "Domain of the company to enrich.", "example": "airbnb.com", "key$": "domain" }, "fields": { "type": "string", "description": "Optional comma-separated list of top-level JSON keys to return. When omitted, all available fields are returned.", "example": "company_name,industry,employee_range", "key$": "fields" }, "api_key": { "type": "string", "description": "Your API key. Optional here if supplied as the `api_key` query parameter or an `Authorization: Bearer <key>` header.", "key$": "api_key" } }, "x-ref": "#/components/schemas/EnrichmentRequest" } }, "application/json": { "schema": { "type": "object", "required": ["domain"], "properties": { "domain": { "type": "string", "description": "Domain of the company to enrich.", "example": "airbnb.com", "key$": "domain" }, "fields": { "type": "string", "description": "Optional comma-separated list of top-level JSON keys to return. When omitted, all available fields are returned.", "example": "company_name,industry,employee_range", "key$": "fields" }, "api_key": { "type": "string", "description": "Your API key. Optional here if supplied as the `api_key` query parameter or an `Authorization: Bearer <key>` header.", "key$": "api_key" } }, "x-ref": "#/components/schemas/EnrichmentRequest", "index$": 1 } } } }, "parameters": [] } }, { strict: LIVE_STRICT, t });
        }
        const client = setup.client;
        const struct = setup.struct;
        const isempty = struct.isempty;
        const select = struct.select;
        // CREATE
        const post_company_enrichment_ref01_ent = client.PostCompanyEnrichment();
        let post_company_enrichment_ref01_data = setup.data.new.post_company_enrichment['post_company_enrichment_ref01'];
        post_company_enrichment_ref01_data = (await post_company_enrichment_ref01_ent.create(post_company_enrichment_ref01_data)).data();
        (0, node_assert_1.default)(null != post_company_enrichment_ref01_data);
    });
});
// main.kit.test.live.strict is true (the default is true): a live
// request that fails, or a live test missing an input it needs,
// fails the test.
// An account with no record for a test to read skips it either way.
const LIVE_STRICT = true;
function basicSetup(extra) {
    // TODO: fix test def options
    const options = {}; // null
    // TODO: needs test utility to resolve path
    const entityDataFile = node_path_1.default.resolve(__dirname, '../../../../.sdk/test/entity/post_company_enrichment/PostCompanyEnrichmentTestData.json');
    // TODO: file ready util needed?
    const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8');
    // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
    const entityData = JSON.parse(entityDataSource);
    options.entity = entityData.existing;
    let client = __1.VoxgigOpenapiSpecSDK.test(options, extra);
    const struct = client.utility().struct;
    const merge = struct.merge;
    const transform = struct.transform;
    let idmap = transform(['post_company_enrichment01', 'post_company_enrichment02', 'post_company_enrichment03'], {
        '`$PACK`': ['', {
                '`$KEY`': '`$COPY`',
                '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
            }]
    });
    const env = (0, utility_1.envOverride)({
        'VOXGIG_OPENAPI_SPEC_TEST_POST_COMPANY_ENRICHMENT_ENTID': idmap,
        'VOXGIG_OPENAPI_SPEC_TEST_LIVE': 'FALSE',
        'VOXGIG_OPENAPI_SPEC_TEST_EXPLAIN': 'FALSE',
        'VOXGIG_OPENAPI_SPEC_APIKEY': '',
    });
    idmap = env['VOXGIG_OPENAPI_SPEC_TEST_POST_COMPANY_ENRICHMENT_ENTID'];
    const live = 'TRUE' === env.VOXGIG_OPENAPI_SPEC_TEST_LIVE;
    const transport = (0, live_runner_1.createLiveTransport)();
    if (live) {
        const rawIds = process.env['VOXGIG_OPENAPI_SPEC_TEST_POST_COMPANY_ENRICHMENT_ENTID'];
        idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {};
        if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
            throw new Error('Live ENTID must be a JSON object');
        }
        client = new __1.VoxgigOpenapiSpecSDK(merge([
            // FIRST, so the generated fields below win: sdk-test-control.json's
            // test.client.options adds to the live client, it does not redirect it.
            (0, utility_1.liveClientOptions)(),
            {
                apikey: env.VOXGIG_OPENAPI_SPEC_APIKEY,
            },
            // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
            // last entry is undefined, and basicSetup is normally called with no
            // argument at all - so a bare 'extra' silently discarded the apikey
            // and server values above and handed the SDK undefined. Harmless
            // while there was nothing in that object; not harmless now.
            extra || {},
            { system: { fetch: transport.fetch } }
        ]));
    }
    const setup = {
        idmap,
        env,
        options,
        client,
        struct,
        data: entityData,
        explain: 'TRUE' === env.VOXGIG_OPENAPI_SPEC_TEST_EXPLAIN,
        live,
        transport,
        now: Date.now(),
    };
    return setup;
}
//# sourceMappingURL=PostCompanyEnrichmentEntity.test.js.map