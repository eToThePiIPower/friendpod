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
end
