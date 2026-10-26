<?php
declare(strict_types=1);

// PostCompanyEnrichment entity test

require_once __DIR__ . '/../voxgigopenapispec_sdk.php';
require_once __DIR__ . '/Runner.php';

use PHPUnit\Framework\TestCase;
use Voxgig\Struct\Struct as Vs;

class PostCompanyEnrichmentEntityTest extends TestCase
{
    // main.kit.test.live.strict is true (the default is true): a live
    // request that fails, or a live test missing an input it needs,
    // fails the test.
    // An account with no record for a test to read skips it either way.
    private const LIVE_STRICT = true;

    public function test_create_instance(): void
    {
        $testsdk = VoxgigOpenapiSpecSDK::test(null, null);
        $ent = $testsdk->PostCompanyEnrichment(null);
        $this->assertNotNull($ent);
    }

    public function test_validate(): void
    {
        $cfg = VoxgigOpenapiSpecConfig::shared_config();
        if (!isset($cfg["feature"]["validate"])) {
            $this->markTestSkipped('feature not present in this SDK: validate');
        }
        $client = VoxgigOpenapiSpecSDK::test(null, ["feature" => ["validate" => ["active" => true]]]);
        $err = null;
        try {
            $client->PostCompanyEnrichment(null)->create(["api_key" => 1, "domain" => 'x'], null);
        } catch (\Throwable $e) {
            $err = $e;
        }
        $this->assertSame('validate_failed', $err->sdk_code ?? null);
    }

    public function test_basic_flow(): void
    {
        $setup = post_company_enrichment_basic_setup(null);
        // Per-op sdk-test-control.json skip.
        $_live = !empty($setup["live"]);
        foreach (["create"] as $_op) {
            [$_shouldSkip, $_reason] = Runner::is_control_skipped("entityOp", "post_company_enrichment." . $_op, $_live ? "live" : "unit");
            if ($_shouldSkip) {
                $this->markTestSkipped($_reason ?? "skipped via sdk-test-control.json");
                return;
            }
        }
        $client = $setup["client"];

        // CREATE
        $post_company_enrichment_ref01_ent = $client->PostCompanyEnrichment(null);
        $post_company_enrichment_ref01_data = Helpers::to_map(Vs::getprop(
            Vs::getpath($setup["data"], "new.post_company_enrichment"), "post_company_enrichment_ref01"));

        $post_company_enrichment_ref01_data_result = $post_company_enrichment_ref01_ent->create($post_company_enrichment_ref01_data, null);
        $post_company_enrichment_ref01_data = Helpers::to_map(is_object($post_company_enrichment_ref01_data_result) && method_exists($post_company_enrichment_ref01_data_result, 'data_get') ? $post_company_enrichment_ref01_data_result->data_get() : $post_company_enrichment_ref01_data_result);
        $this->assertNotNull($post_company_enrichment_ref01_data);

    }
}

function post_company_enrichment_basic_setup($extra)
{
    Runner::load_env_local();

    $entity_data_file = __DIR__ . '/../../.sdk/test/entity/post_company_enrichment/PostCompanyEnrichmentTestData.json';
    $entity_data_source = file_get_contents($entity_data_file);
    $entity_data = json_decode($entity_data_source, true);

    $options = [];
    $options["entity"] = $entity_data["existing"];

    $client = VoxgigOpenapiSpecSDK::test($options, $extra);

    // Generate idmap.
    $idmap = [];
    foreach (["post_company_enrichment01", "post_company_enrichment02", "post_company_enrichment03"] as $k) {
        $idmap[$k] = strtoupper($k);
    }

    // Whether *_ENTID supplied the idmap, read before env_override consumes
    // it: without it, the ids a live flow binds are the fixture's synthetic ones.
    $entid_env_raw = getenv("VOXGIG_OPENAPI_SPEC_TEST_POST_COMPANY_ENRICHMENT_ENTID");
    $idmap_overridden = $entid_env_raw !== false && str_starts_with(trim($entid_env_raw), "{");

    $env = Runner::env_override([
        "VOXGIG_OPENAPI_SPEC_TEST_POST_COMPANY_ENRICHMENT_ENTID" => $idmap,
        "VOXGIG_OPENAPI_SPEC_TEST_LIVE" => "FALSE",
        "VOXGIG_OPENAPI_SPEC_TEST_EXPLAIN" => "FALSE",
        "VOXGIG_OPENAPI_SPEC_APIKEY" => "",
    ]);

    $idmap_resolved = Helpers::to_map(
        $env["VOXGIG_OPENAPI_SPEC_TEST_POST_COMPANY_ENRICHMENT_ENTID"]);
    if ($idmap_resolved === null) {
        $idmap_resolved = Helpers::to_map($idmap);
    }

    if ($env["VOXGIG_OPENAPI_SPEC_TEST_LIVE"] === "TRUE") {
        $merged_opts = Vs::merge([
            // FIRST, so the generated fields below win: sdk-test-control.json's
            // test.client.options adds to the live client, it does not redirect it.
            Runner::live_client_options(),
            [
                "apikey" => $env["VOXGIG_OPENAPI_SPEC_APIKEY"],
            ],
            // ismap, not a plain "?? []" default: an empty PHP array is a
            // LIST, and a non-map later entry REPLACES the accumulated map in
            // merge - so the no-extras call discarded live_client_options()
            // and the apikey/server map above it.
            Vs::ismap($extra) ? $extra : new \stdClass(),
        ]);
        // "?? []" because merge legitimately answers with a stdClass when every
        // contributing entry is an EMPTY map - an SDK with no apikey and no
        // server variables generates an empty middle entry, so that is the
        // common case, not the edge one. to_map returns null for a non-array by
        // design, and the constructor takes a non-nullable array, so without the
        // fallback every such SDK died on "must be of type array, null given"
        // the moment live mode was switched on. Offline mode never reaches this
        // branch, which is why the offline suite stayed green.
        $client = new VoxgigOpenapiSpecSDK(Helpers::to_map($merged_opts) ?? []);
    }

    $live = $env["VOXGIG_OPENAPI_SPEC_TEST_LIVE"] === "TRUE";
    return [
        "client" => $client,
        "data" => $entity_data,
        "idmap" => $idmap_resolved,
        "env" => $env,
        "explain" => $env["VOXGIG_OPENAPI_SPEC_TEST_EXPLAIN"] === "TRUE",
        "live" => $live,
        "synthetic_only" => $live && !$idmap_overridden,
        "now" => (int)(microtime(true) * 1000),
    ];
}
