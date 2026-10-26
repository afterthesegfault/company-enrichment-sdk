package voxgigopenapispecsdk

import (
	"github.com/voxgig-sdk/voxgig-openapi-spec-sdk/go/core"
	"github.com/voxgig-sdk/voxgig-openapi-spec-sdk/go/entity"
	"github.com/voxgig-sdk/voxgig-openapi-spec-sdk/go/feature"
	_ "github.com/voxgig-sdk/voxgig-openapi-spec-sdk/go/utility"
)

// Type aliases preserve external API.
type VoxgigOpenapiSpecSDK = core.VoxgigOpenapiSpecSDK
type Context = core.Context
type Utility = core.Utility
type Feature = core.Feature
type Entity = core.Entity
type VoxgigOpenapiSpecEntity = core.VoxgigOpenapiSpecEntity
type StreamItem = core.StreamItem
type FetcherFunc = core.FetcherFunc
type Spec = core.Spec
type Result = core.Result
type Response = core.Response
type Operation = core.Operation
type Control = core.Control
type VoxgigOpenapiSpecError = core.VoxgigOpenapiSpecError

// BaseFeature from feature package.
type BaseFeature = feature.BaseFeature

func init() {
	core.NewBaseFeatureFunc = func() core.Feature {
		return feature.NewBaseFeature()
	}
	core.NewNetsimFeatureFunc = func() core.Feature {
		return feature.NewNetsimFeature()
	}
	core.NewTestFeatureFunc = func() core.Feature {
		return feature.NewTestFeature()
	}
	core.NewGetCompanyEnrichmentEntityFunc = func(client *core.VoxgigOpenapiSpecSDK, entopts map[string]any) core.VoxgigOpenapiSpecEntity {
		return entity.NewGetCompanyEnrichmentEntity(client, entopts)
	}
	core.NewPostCompanyEnrichmentEntityFunc = func(client *core.VoxgigOpenapiSpecSDK, entopts map[string]any) core.VoxgigOpenapiSpecEntity {
		return entity.NewPostCompanyEnrichmentEntity(client, entopts)
	}
}

// Constructor re-exports.
var NewVoxgigOpenapiSpecSDK = core.NewVoxgigOpenapiSpecSDK
var TestSDK = core.TestSDK
var NewContext = core.NewContext
var NewSpec = core.NewSpec
var NewResult = core.NewResult
var NewResponse = core.NewResponse
var NewOperation = core.NewOperation
var MakeConfig = core.MakeConfig
var SharedConfig = core.SharedConfig

// No-arg convenience constructors. Go has no default-argument syntax,
// so these aliases let callers write `sdk.New()` / `sdk.Test()`
// instead of `sdk.NewVoxgigOpenapiSpecSDK(nil)` / `sdk.TestSDK(nil, nil)`
// for the common no-options case.
func New() *VoxgigOpenapiSpecSDK  { return NewVoxgigOpenapiSpecSDK(nil) }
func Test() *VoxgigOpenapiSpecSDK { return TestSDK(nil, nil) }
var NewBaseFeature = feature.NewBaseFeature
var NewNetsimFeature = feature.NewNetsimFeature
var NewTestFeature = feature.NewTestFeature
