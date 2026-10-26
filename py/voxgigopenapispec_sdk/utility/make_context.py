# VoxgigOpenapiSpec SDK utility: make_context

from voxgigopenapispec_sdk.core.context import VoxgigOpenapiSpecContext


def make_context_util(ctxmap, basectx):
    return VoxgigOpenapiSpecContext(ctxmap, basectx)
