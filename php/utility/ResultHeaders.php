<?php
declare(strict_types=1);

// VoxgigOpenapiSpec SDK utility: result_headers

class VoxgigOpenapiSpecResultHeaders
{
    public static function call(VoxgigOpenapiSpecContext $ctx): ?VoxgigOpenapiSpecResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
