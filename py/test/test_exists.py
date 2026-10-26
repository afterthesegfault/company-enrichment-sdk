# VoxgigOpenapiSpec SDK exists test

import pytest
from voxgigopenapispec_sdk import VoxgigOpenapiSpecSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = VoxgigOpenapiSpecSDK.test(None, None)
        assert testsdk is not None
