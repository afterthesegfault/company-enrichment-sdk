package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewNetsimFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewGetCompanyEnrichmentEntityFunc func(client *VoxgigOpenapiSpecSDK, entopts map[string]any) VoxgigOpenapiSpecEntity

var NewPostCompanyEnrichmentEntityFunc func(client *VoxgigOpenapiSpecSDK, entopts map[string]any) VoxgigOpenapiSpecEntity

