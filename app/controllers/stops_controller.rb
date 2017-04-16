class StopsController < ApplicationController
  def show
    @trip = Trip.find(params[:trip_id])

    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    @client.account.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: '+16789462782'+ @trip.phone_number,
      body: 'Here is your final destination.' + ' https://goo.gl/maps/CKMxSZwhoQG2'
      # media_url: "https://goo.gl/maps/CKMxSZwhoQG2"
    )
  end
end
