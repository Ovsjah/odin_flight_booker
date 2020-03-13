class PassengerMailer < ApplicationMailer
  def thank_you_email(passenger)
    @passenger = passenger
    @booking = @passenger.booking
    mail(to: @passenger.email, subject: "Thank you, #{passenger.name}, for choosing Odin Flight Booker.")
  end
end
