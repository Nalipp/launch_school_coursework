require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @list = Dir.glob('public/*').map { |pet| File.basename(pet) }.sort
  @list.reverse! if params[:sort] == "desc"
  erb :list
end
