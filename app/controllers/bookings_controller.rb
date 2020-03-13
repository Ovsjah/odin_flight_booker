class BookingsController < ApplicationController
  def new
    @flight = Flight.find params[:booking][:flight_id]
    @booking = Booking.new
    params[:booking][:seats].to_i.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(booking_params[:flight_id])
    @booking = @flight.bookings.build booking_params

    if @booking.save
      @booking.passengers.each { |passenger| PassengerMailer.thank_you_email(passenger).deliver_later }
      redirect_to @booking, flash: { success: "Gongrats you booked a trip!" }
    else
      flash.now[:danger] = "Something went wrong, sorry."
      render :new
    end
  end

  def show
    @booking = Booking.includes(:passengers).find(params[:id])
  end

  private

    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
end
