# VoxgigOpenapiSpec SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'graphql'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

VoxgigOpenapiSpecUtility.registrar = ->(u) {
  u.clean = VoxgigOpenapiSpecUtilities::Clean
  u.clean_add = VoxgigOpenapiSpecUtilities::CleanAdd
  u.clean_explain = VoxgigOpenapiSpecUtilities::CleanExplain
  u.done = VoxgigOpenapiSpecUtilities::Done
  u.make_error = VoxgigOpenapiSpecUtilities::MakeError
  u.feature_add = VoxgigOpenapiSpecUtilities::FeatureAdd
  u.feature_hook = VoxgigOpenapiSpecUtilities::FeatureHook
  u.feature_init = VoxgigOpenapiSpecUtilities::FeatureInit
  u.fetcher = VoxgigOpenapiSpecUtilities::Fetcher
  u.make_fetch_def = VoxgigOpenapiSpecUtilities::MakeFetchDef
  u.make_context = VoxgigOpenapiSpecUtilities::MakeContext
  u.make_options = VoxgigOpenapiSpecUtilities::MakeOptions
  u.make_request = VoxgigOpenapiSpecUtilities::MakeRequest
  u.make_response = VoxgigOpenapiSpecUtilities::MakeResponse
  u.make_result = VoxgigOpenapiSpecUtilities::MakeResult
  u.make_point = VoxgigOpenapiSpecUtilities::MakePoint
  u.make_spec = VoxgigOpenapiSpecUtilities::MakeSpec
  u.make_url = VoxgigOpenapiSpecUtilities::MakeUrl
  u.param = VoxgigOpenapiSpecUtilities::Param
  u.prepare_auth = VoxgigOpenapiSpecUtilities::PrepareAuth
  u.prepare_body = VoxgigOpenapiSpecUtilities::PrepareBody
  u.prepare_headers = VoxgigOpenapiSpecUtilities::PrepareHeaders
  u.prepare_method = VoxgigOpenapiSpecUtilities::PrepareMethod
  u.prepare_params = VoxgigOpenapiSpecUtilities::PrepareParams
  u.prepare_path = VoxgigOpenapiSpecUtilities::PreparePath
  u.prepare_query = VoxgigOpenapiSpecUtilities::PrepareQuery
  u.graphql_body = VoxgigOpenapiSpecUtilities::GraphqlBody
  u.graphql_errors = VoxgigOpenapiSpecUtilities::GraphqlErrors
  u.result_basic = VoxgigOpenapiSpecUtilities::ResultBasic
  u.result_body = VoxgigOpenapiSpecUtilities::ResultBody
  u.result_headers = VoxgigOpenapiSpecUtilities::ResultHeaders
  u.transform_request = VoxgigOpenapiSpecUtilities::TransformRequest
  u.transform_response = VoxgigOpenapiSpecUtilities::TransformResponse
}
