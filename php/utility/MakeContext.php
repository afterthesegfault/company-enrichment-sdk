<?php
declare(strict_types=1);

// VoxgigOpenapiSpec SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class VoxgigOpenapiSpecMakeContext
{
    public static function call(array $ctxmap, ?VoxgigOpenapiSpecContext $basectx): VoxgigOpenapiSpecContext
    {
        return new VoxgigOpenapiSpecContext($ctxmap, $basectx);
    }
}
