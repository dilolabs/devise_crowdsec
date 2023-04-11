module DeviseCrowdsec
  class FailureApp < Devise::FailureApp
    def respond
      if warden_message == :invalid
        store_failed_attempt
        send_crowdsec_alert if exceeded_threshold?
      end
      super
    end

    private

    def store_failed_attempt
      attempts = session[:failed_attempts] || 0
      session[:failed_attempts] = attempts + 1
    end

    def exceeded_threshold?
      threshold = Devise.crowdsec_threshold || 5
      session[:failed_attempts] >= threshold
    end

    def send_crowdsec_alert
      ip_address = request.remote_ip
      alert_data = {
        type: 'failed-login',
        message: "Multiple failed login attempts from IP: #{ip_address}",
        source: {
          value: ip_address,
          type: 'Ip',
        },
      }

      CrowdsecNotifier.send_alert(alert_data)
    end
  end
end
