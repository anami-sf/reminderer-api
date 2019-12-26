require 'twilio-ruby'

class TwilioController < ApplicationController
    skip_before_action :verify_authenticity_token

    def voice
      response = Twilio::TwiML::VoiceResponse.new do |r|
        r.say message: "Hello! This is anami!, thanks for calling", voice: "alice"
        # r.Sms "Well done building your first Twilio on Rails 5 app!"
        # r.play loop: 2, url: "http://linode.rabasa.com/cantina.mp3"
      end
      render :xml => response.to_xml
    end


end
