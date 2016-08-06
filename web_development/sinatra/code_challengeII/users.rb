require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'yaml'

before do
  @users = YAML.load_file("data/users.yaml")
end

helpers do
  def count_interests
    @users.map { |key, value| value[:interests].count }.inject(:+)
  end
end

not_found do
  redirect "/"
end

get "/" do
  erb :home
end

get "/:user_name" do
  @name = params[:user_name]
  @user = @users[@name.to_sym]
  erb :user
end
