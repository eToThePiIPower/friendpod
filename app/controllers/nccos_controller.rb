require 'socket'
require 'json'

class NccosController < ApplicationController
  def setup_call
    friend = User.find_by(id: params[:id])
    Call.create(number: friend.number)
  end

  def generate_ncco
    ncco = [
      {
        "action": "connect",
        "eventUrl": ["https://friendpod.herokuapp.com"],
        "from": "12035338536",
        "endpoint": [
          { "type": "phone", "number": "#{Call.last.number}" }
        ]
      }
    ]
    render json: ncco.to_json
  end

  def send_text
    friend = User.find_by(id: params[:id])
    message = params[:message]
    message = "#{friend.name} says: #{message}"
    uri = URI.parse("https://rest.nexmo.com/sms/json")
    params = {
      'api_key' => ENV['API_KEY'],
      'api_secret' => ENV['API_SECRET'],
      'to' => friend.number,
      'from' => '12035338536',
      'text': message
    }

    Net::HTTP.post_form(uri, params)
    
    redirect_to root_path
  end
end
