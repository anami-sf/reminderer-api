require 'twilio-ruby'

class NotificationsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def notify

        twiml = Twilio::TwiML::MessagingResponse.new do |r|
            r.message body: 'The Robots are coming! Head for the hills!'
        end

        render :xml => twiml.to_xml
    end
  
end
