require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @contents = File.readlines "data/toc.txt"
end

helpers do
  def in_paragraphs(text)
    text.split("\n\n").map do |line|
      "<p>#{line}</p>"
    end.join
  end
end

get "/" do
  @title = "Sherlock Homes"
  erb :home
end

get "/chapters/:number" do
  number = params[:number]

  chapter_title = @contents[number.to_i - 1]
  @title = "Chapter #{number} : #{chapter_title}"
  @chapter = File.read("data/chp#{number}.txt")
  erb :chapter
end
