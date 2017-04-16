class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  # def index
  #   @trips = Trip.all
  # end

  # GET /trips/1
  # GET /trips/1.json
  def show

  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  # def edit
  # end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)
    # p @trip
    # @exist_number = Trip.find_by(phone_number: @trip.phone_number)
    # p "_____"
    # p @exist_number
    # if @exist_number
      # redirect_to action: 'new'
      # render :new
      # render action: "new"
    # else
      respond_to do |format|
        if @trip.save
          format.html { redirect_to @trip, notice: 'Your trip is registered!' }
          format.json { render :show, status: :created, location: @trip }

          @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
          @client.account.messages.create(
            from: ENV['TWILIO_NUMBER'],
            to: '+16789462782'+ @trip.phone_number,
            body: 'Welcome to MARTA.'
          )
        else
          format.html { render :new }
          format.json { render json: @trip.errors, status: :unprocessable_entity }
        end
      end
    # end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  # def update
  #   respond_to do |format|
  #     if @trip.update(trip_params)
  #       format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @trip }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @trip.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /trips/1
  # DELETE /trips/1.json
  # def destroy
  #   @trip.destroy
  #   respond_to do |format|
  #     format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      if Trip.exists?(params[:id]) == true
        @trip = Trip.find(params[:id])
      else
        @trip = Trip.new
        render action: "new"
        # @trip.save
        # @trip = Trip.find(params[:id])
      end

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:phone_number)
    end
end
