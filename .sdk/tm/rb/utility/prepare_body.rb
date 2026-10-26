# VoxgigOpenapiSpec SDK utility: prepare_body
require_relative 'media'
module VoxgigOpenapiSpecUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return VoxgigOpenapiSpecUtilities.raw_body(ctx.reqdata) if VoxgigOpenapiSpecUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end
