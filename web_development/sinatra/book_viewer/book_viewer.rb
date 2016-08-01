require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @contents = File.readlines "data/toc.txt"
  @title = "Sherlock Homes"
  erb :home
end

get "/chapters/1" do
  @title = "Chapter 1"
  @contents = File.readlines "data/toc.txt"
  @chapter = File.read "data/chp1.txt"
  erb :chapter
end
