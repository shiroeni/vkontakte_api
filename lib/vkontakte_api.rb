# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'oj' unless defined?(JRUBY_VERSION)
require 'faraday_middleware/multi_json'
require 'oauth2'
require 'yaml'
require 'ostruct'

require 'vkontakte_api/version'
require 'vkontakte_api/error'
require 'vkontakte_api/execute_error'
require 'vkontakte_api/configuration'
require 'vkontakte_api/authorization'
require 'vkontakte_api/uploading'
require 'vkontakte_api/utils'
require 'vkontakte_api/api'
require 'vkontakte_api/resolver'
require 'vkontakte_api/resolvable'
require 'vkontakte_api/client'
require 'vkontakte_api/namespace'
require 'vkontakte_api/method'
require 'vkontakte_api/result'
require 'vkontakte_api/logger'
require 'vkontakte_api/extensions'

# Main module.
module VkontakteApi
  extend VkontakteApi::Configuration
  extend VkontakteApi::Authorization
  extend VkontakteApi::Uploading
  
  class << self
    # Option for using JSON with `object_class: OpenStruct`
    # instead Oj with plain Hash. Oj with Hash used by default.
    #
    # @return [Boolean] use_openstruct
    attr_accessor :use_openstruct

    # Creates a short alias `VK` for `VkontakteApi` module.
    def register_alias
      Object.const_set(:VK, VkontakteApi)
    end

    # Removes the `VK` alias.
    def unregister_alias
      Object.send(:remove_const, :VK) if defined?(VK)
    end
  end
end
