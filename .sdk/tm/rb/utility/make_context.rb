# VoxgigOpenapiSpec SDK utility: make_context
require_relative '../core/context'
module VoxgigOpenapiSpecUtilities
  MakeContext = ->(ctxmap, basectx) {
    VoxgigOpenapiSpecContext.new(ctxmap, basectx)
  }
end
