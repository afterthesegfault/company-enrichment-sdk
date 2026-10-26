# VoxgigOpenapiSpec SDK exists test

require "minitest/autorun"
require_relative "../VoxgigOpenapiSpec_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = VoxgigOpenapiSpecSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
