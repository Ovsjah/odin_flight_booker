class FlightsController < ApplicationController
  def index
    @departure = Airport.joins(:departures)
    @arrival = Airport.joins(:arrivals)
    @flights = Flight.upcoming
    if params[:search]
      @departure_id = params[:flight][:departure_id]
      @arrival_id = params[:flight][:arrival_id]
      @seats = params[:flight][:seats]
      @date =
        DateTime.new(
          params[:flight]["date(1i)"].to_i,
          params[:flight]["date(2i)"].to_i,
          params[:flight]["date(3i)"].to_i,
          params[:flight]["date(4i)"].to_i,
          params[:flight]["date(5i)"].to_i
        )
      @flights = @flights.search(@departure_id, @arrival_id, @seats, @date)
    end
  end
end
