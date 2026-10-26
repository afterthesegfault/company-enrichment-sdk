<?php
declare(strict_types=1);

// VoxgigOpenapiSpec SDK exists test

require_once __DIR__ . '/../voxgigopenapispec_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = VoxgigOpenapiSpecSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
