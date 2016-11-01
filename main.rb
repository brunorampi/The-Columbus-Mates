require 'sinatra'
require 'pry'
require_relative 'db_config'
require_relative 'models/trip'
require_relative 'models/user'
require_relative 'models/trip_type'

get '/' do
  @trips = Trip.all
  erb :index
end

get '/trips/new' do

  @trip_types = TripType.all
  erb :trips_new
end

get '/trips/:id' do
  @trip = Trip.find(params[:id])
  erb :trips_show
end

post '/trips' do
  trip = Trip.new
  trip.destination = params[:destination]
  trip.image_url = params[:icone_image]
  trip.second_image_url = params [:cover_image]
  trip.start_date = params[:start_date]
  trip.duration = params[:duration]
  trip.trip_type_id = params[:trip_type_id]
  trip.host_id = params[:user_id]
  trip.min_mate_number = params[:min_mate_number]
  trip.max_mate_number = params[:max_mate_number]

  if trip.save
    redirect to '/'
  else
    erb :trips_new
  end
end
