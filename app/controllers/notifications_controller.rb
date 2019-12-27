require 'twilio-ruby'

class NotificationsController < ApplicationController

    skip_before_action :verify_authenticity_token

    @client = Twilio::REST::Client.new(
        Rails.application.credentials.twilio_account_sid,
        Rails.application.credentials.twilio_auth_token
        )

        Twilio.configure do |config|
            config.account_sid = Rails.application.credentials.twilio_account_sid
            config.auth_token = Rails.application.credentials.twilio_auth_token
        end
        
    @message = @client.messages.create(
    from: '+14152134974',
    to: '+14153351196',
    body: 'Sending this message from my new twilio app. If you got it, please reply. - your gf',
    #media_url: 'http://linode.rabasa.com/yoda.gif'
    )
    render plain: @message.status
end
