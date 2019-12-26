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
            body: 'Sending this message from my new twilio app. If you got it, please reply. - your gf',
            #media_url: 'http://linode.rabasa.com/yoda.gif'
        )
        
        #puts message.sid
        render plain: message.status
    end
  
end
