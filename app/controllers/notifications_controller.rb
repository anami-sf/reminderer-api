require 'twilio-ruby'

class NotificationsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def notify
        @client = Twilio::REST::Client.new(
            Remindererapi::Application.credentials.twilio_account_sid,
            Remindererapi::Application.credentials.twilio_auth_token
        )
        message = @client.messages.create(
            from: '+14152134974', 
            to: '+14153351196', 
            body: 'Learning to send SMS you are.'
        )
        
        #puts message.sid
        render plain: message.status
    end
  
end
