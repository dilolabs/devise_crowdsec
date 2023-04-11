require 'faraday'
require 'json'

module DeviseCrowdsec
  class CrowdsecNotifier
    def self.send_alert(alert_data)
      return unless Devise.crowdsec_api_key && Devise.crowdsec_api_url

      connection = Faraday.new(url: Devise.crowdsec_api_url) do |config|
        config.headers['Content-Type'] = 'application/json'
        config.headers['X-Api-Key'] = Devise.crowdsec_api_key
        config.request :json
        config.response :json
      end

      response = connection.post do |req|
        req.body = alert_data.to_json
      end

      if response.success?
        puts 'Alert sent successfully!'
      else
        puts "Error when sending the alert: #{response.body}"
      end
    end
  end
end
