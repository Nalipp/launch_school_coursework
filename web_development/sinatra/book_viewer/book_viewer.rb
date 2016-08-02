require 'pry'

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

  def search_chapter(text, params)
    text.include?(params)
  end
end

not_found do
  redirect "/"
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

def search_chapters(query)
  return nil if query.nil?

  results = []
  @contents.each_with_index do |chapter, index|
    number = index + 1
    if File.read("data/chp#{number}.txt").include?(query)
      results << [chapter.slice(0..-2)]
    end
  end
  results
end

get "/search" do
  @results = search_chapters(params[:query])
  erb :search
end