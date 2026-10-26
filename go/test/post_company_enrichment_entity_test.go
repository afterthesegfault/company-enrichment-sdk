package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/voxgig-openapi-spec-sdk/go"
	"github.com/voxgig-sdk/voxgig-openapi-spec-sdk/go/core"

	vs "github.com/voxgig-sdk/voxgig-openapi-spec-sdk/go/utility/struct"
)

// main.kit.test.live.strict is true (the default is true): a live
// request that fails, or a live test missing an input it needs,
// fails the test.
// An account with no record for a test to read skips it either way.
const post_company_enrichmentEntityLiveStrict = true


func TestPostCompanyEnrichmentEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.PostCompanyEnrichment(nil)
		if ent == nil {
			t.Fatal("expected non-nil PostCompanyEnrichmentEntity")
		}
	})

	t.Run("validate", func(t *testing.T) {
		if !fhHasFeature("validate") {
			t.Skip("feature not present in this SDK: validate")
		}
		client := sdk.TestSDK(nil, map[string]any{
			"feature": map[string]any{"validate": map[string]any{"active": true}},
		})
		_, err := client.PostCompanyEnrichment(nil).Create(map[string]any{"api_key": 1, "domain": "x"}, nil)
		if sdkerr, ok := err.(*core.VoxgigOpenapiSpecError); !ok || "validate_failed" != sdkerr.Code {
			t.Fatalf("expected validate_failed, got %v", err)
		}
	})

	t.Run("basic", func(tt *testing.T) {
		var t testing.TB = tt
		setup := post_company_enrichmentBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "post_company_enrichment." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		client := setup.client
		_ = client

		// CREATE
		postCompanyEnrichmentRef01Ent := client.PostCompanyEnrichment(nil)
		postCompanyEnrichmentRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath(setup.data, []any{"new", "post_company_enrichment"}), "post_company_enrichment_ref01"))

		postCompanyEnrichmentRef01DataResult, err := postCompanyEnrichmentRef01Ent.Create(postCompanyEnrichmentRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		postCompanyEnrichmentRef01Data = core.ToMapAny(entityData(postCompanyEnrichmentRef01DataResult))
		if postCompanyEnrichmentRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}

	})
}

func post_company_enrichmentBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "post_company_enrichment", "PostCompanyEnrichmentTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read post_company_enrichment test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse post_company_enrichment test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap, _ := vs.Transform(
		[]any{"post_company_enrichment01", "post_company_enrichment02", "post_company_enrichment03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Whether *_ENTID supplied the idmap, read before envOverride consumes it:
	// without it, the ids a live flow binds are the fixture's synthetic ones.
	entidEnvRaw := os.Getenv("VOXGIG_OPENAPI_SPEC_TEST_POST_COMPANY_ENRICHMENT_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"VOXGIG_OPENAPI_SPEC_TEST_POST_COMPANY_ENRICHMENT_ENTID": idmap,
		"VOXGIG_OPENAPI_SPEC_TEST_LIVE":      "FALSE",
		"VOXGIG_OPENAPI_SPEC_TEST_EXPLAIN":   "FALSE",
		"VOXGIG_OPENAPI_SPEC_APIKEY":         "",
	})

	idmapResolved := core.ToMapAny(env["VOXGIG_OPENAPI_SPEC_TEST_POST_COMPANY_ENRICHMENT_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["VOXGIG_OPENAPI_SPEC_TEST_LIVE"] == "TRUE" {
		// An empty map, not a nil one: Merge returns nil when its last entry
		// is nil, and BasicSetup is normally called with no extras - so a
		// bare nil silently discarded the apikey and server values below.
		extraOpts := extra
		if extraOpts == nil {
			extraOpts = map[string]any{}
		}

		mergedOpts := vs.Merge([]any{
			// liveClientOptions() FIRST, so the generated fields below win:
			// sdk-test-control.json's test.client.options adds to the live
			// client, it does not redirect it.
			liveClientOptions(),
			map[string]any{
				"apikey": env["VOXGIG_OPENAPI_SPEC_APIKEY"],
			},
			extraOpts,
		})
		client = sdk.NewVoxgigOpenapiSpecSDK(core.ToMapAny(mergedOpts))
	}

	live := env["VOXGIG_OPENAPI_SPEC_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["VOXGIG_OPENAPI_SPEC_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}
