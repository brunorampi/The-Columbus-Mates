require 'sinatra'
require 'pry'
# require 'sinatra/reloader'
require_relative 'db_config'
require_relative 'models/users_trip'
require_relative 'models/user'
require_relative 'models/trip'
require_relative 'models/trip_type'
require_relative 'models/comment'

enable :sessions



helpers do
  def logged_in?
    !!current_user
  end
  def current_user
    User.find_by(id: session[:user_id])
  end

end

get '/' do
  @trips = Trip.all
  erb :index
end

get '/trips/new' do
  redirect to '/session/new' unless logged_in?
  @trip_types = TripType.all
  erb :trips_new
end

get '/users/new' do
  erb :users_new
end

get '/congrats' do
  erb :congrats
end

get '/users/personal' do
  erb :users_personal
end

get '/trips/:id' do
  @trip = Trip.find(params[:id])
  erb :trips_show
end

get '/search' do
    @trip = Trip.where(["destination ILIKE ?", "%#{params[:destination]}%"])




    erb :search
  end

get '/users/profile/:id' do
  @user = User.find(params[:id])
  erb :users_profile
  # @comments = Comment.where(user_id: @user.id)

end

get '/new_search' do


  erb :new_search
end




post '/trips' do
  trip = Trip.new
  trip.destination = params[:destination]
  trip.image_url = params[:icone_image]
  trip.second_image_url = params[:cover_image]
  trip.start_date = params[:start_date]
  trip.duration = params[:duration]
  trip.trip_type_id = params[:trip_type_id]
  trip.user_id = current_user.id
  trip.min_mate_number = params[:min_mate_number]
  trip.max_mate_number = params[:max_mate_number]




  if trip.save
    redirect to '/'
  else
    erb :trips_new
  end
end


post '/users' do
  user = User.new
  user.name = params[:name]
  user.surname = params[:surname]
  user.age = params[:age]
  user.nationality = params[:nationality]
  user.email = params[:email]
  user.password = params[:password]
  user.username = params[:username]

  if user.save
    redirect to '/congrats'
  else
    erb :users_new
  end
end



get '/session/new' do
  erb :session_new
end

post '/session' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
  redirect to '/'
  else
    erb :session_new
  end
end

post '/interest' do

  @trip = Trip.find(params[:trip_id])
  if @trip.users.count < @trip.max_mate_number
    @trip.users << current_user
    @trip.save
  else
    redirect to '/new_search'
  end

  erb :trips_show
end

post '/comments' do
  comment = Comment.new
  comment.body = params[:body]
  comment.user_id = params[:user_id]
  comment.save
  redirect to "/users/profile/#{params[:user_id]}"


end





delete '/session' do
  #remove the session
  session[:user_id] = nil
  redirect to '/'
end
