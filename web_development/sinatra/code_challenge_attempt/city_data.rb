require "pry"
require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @city_names = Dir.glob("public/images/*").join.split('public/images/').join.split('.jpg')
  @city_names.reverse! if params[:sort] == 'reverse_order'
  erb :index
end

get "/:name" do
  @city_name = params[:name].gsub("_", " ").capitalize
  @image_path = "images/#{params[:name]}.jpg"
  erb :city_data
end
