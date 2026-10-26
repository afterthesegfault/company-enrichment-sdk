# VoxgigOpenapiSpec Rb SDK: generated schemas. Do not edit.
#
# Generated from the model: `main.kit.optspec` and each feature's
# `config.options` for OPTSPEC; entity `fields{}.type` for ENTITYSPEC.

require 'json'

module VoxgigOpenapiSpecSchema

  OPTSPEC_DATA = '{"allow":{"method":"GET,PUT,POST,PATCH,DELETE,OPTIONS","op":"create,update,patch,load,list,remove,command,direct,graphql"},"apikey":"","auth":{"basic":false,"in":"","name":"","prefix":""},"base":"http://localhost:8000","clean":{"active":true,"hint":"0","keys":"key,secret,token,password,passwd,authorization,cookie,credential,signature","mask":"[redacted]","min":"4","values":""},"entity":{"`$CHILD`":{"`$OPEN`":true,"active":false,"alias":{}}},"extend":"`$ANY`","headers":{"`$CHILD`":"`$STRING`"},"prefix":"","secret":"","server":{"`$CHILD`":""},"suffix":"","system":{"fetch":"`$ANY`"},"test":{"active":false,"entity":{"`$OPEN`":true}},"utility":{},"feature":{"`$CHILD`":{"`$OPEN`":true,"active":false},"netsim":["`$ONE`",{"`$OPEN`":true,"active":["`$ONE`","`$BOOLEAN`","`$NIL`"],"errorTimes":["`$ONE`","`$NUMBER`","`$NIL`"],"failEvery":["`$ONE`","`$NUMBER`","`$NIL`"],"failRate":["`$ONE`","`$NUMBER`","`$NIL`"],"failStatus":["`$ONE`","`$NUMBER`","`$NIL`"],"failTimes":["`$ONE`","`$NUMBER`","`$NIL`"],"latency":["`$ONE`","`$NUMBER`","`$MAP`","`$NIL`"],"offline":["`$ONE`","`$BOOLEAN`","`$NIL`"],"rateLimitTimes":["`$ONE`","`$NUMBER`","`$NIL`"],"retryAfter":["`$ONE`","`$NUMBER`","`$NIL`"],"seed":["`$ONE`","`$NUMBER`","`$NIL`"],"sleep":["`$ONE`","`$FUNCTION`","`$NIL`"]},"`$NIL`"],"test":["`$ONE`",{"`$OPEN`":true,"active":["`$ONE`","`$BOOLEAN`","`$NIL`"],"entity":["`$ONE`","`$MAP`","`$NIL`"],"net":["`$ONE`","`$MAP`","`$NIL`"]},"`$NIL`"]}}'.freeze

  ENTITYSPEC_DATA = '{}'.freeze

  # Parsed ONCE, at load. The spec is read on every client construction and
  # never mutated, so a per-call parse would be pure waste — and sharing the
  # hash is safe for the same reason: make_options validates AGAINST it and
  # writes into the options, never into the spec.
  OPTSPEC = JSON.parse(OPTSPEC_DATA).freeze

  ENTITYSPEC = JSON.parse(ENTITYSPEC_DATA).freeze

end
