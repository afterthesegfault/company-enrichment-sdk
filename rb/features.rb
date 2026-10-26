# VoxgigOpenapiSpec SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/netsim_feature'
require_relative 'feature/test_feature'


module VoxgigOpenapiSpecFeatures
  def self.make_feature(name)
    case name
    when "base"
      VoxgigOpenapiSpecBaseFeature.new
    when "netsim"
      VoxgigOpenapiSpecNetsimFeature.new
    when "test"
      VoxgigOpenapiSpecTestFeature.new
    else
      VoxgigOpenapiSpecBaseFeature.new
    end
  end
end
