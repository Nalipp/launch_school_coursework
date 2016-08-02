require "pry"
require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @city_names = Dir.glob("public/images/*").join.split('public/images/').join.split('.jpg')
  @city_names.reverse! if params[:sort] == 'reverse_order'
  erb :index
end

get "/cape_town" do
  @city_name = "Cape Town"
  @image_path = "images/cape_town.jpg"
  erb :city_data
end

get "/gold_coast" do
  @city_name = "Gold Coast"
  @image_path = "images/gold_coast.jpg"
  erb :city_data
end

get "/salzburg" do
  @city_name = "Salzburg"
  @image_path = "images/salzburg.jpg"
  erb :city_data
end

get "/san_francisco" do
  @city_name = "San Francisco"
  @image_path = "images/san_francisco.jpg"
  erb :city_data
end

get "/vailparaso" do
  @city_name = "Vailparaso"
  @image_path = "images/vailparaso.jpg"
  erb :city_data
end
