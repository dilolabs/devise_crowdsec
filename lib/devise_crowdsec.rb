# frozen_string_literal: true

require "devise"
require_relative "devise_crowdsec/crowdsec_notifier"
require_relative "devise_crowdsec/failure_app"
require_relative "devise_crowdsec/version"

module Devise
  # CrowdSec API URL configuration
  mattr_accessor :crowdsec_api_url
  @@crowdsec_api_url = nil

  # CrowdSec API key configuration
  mattr_accessor :crowdsec_api_key
  @@crowdsec_api_key = nil

  # CrowdSec threshold configuration
  mattr_accessor :crowdsec_threshold
  @@crowdsec_threshold = 5
end

module DeviseCrowdsec
  class Error < StandardError; end
end
