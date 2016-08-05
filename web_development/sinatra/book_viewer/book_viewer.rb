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

  def clean(text)
    text.to_s.gsub(/["\\\n\[\]]/, '')
  end

  def find_anchor(query, chapter_number)
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

def each_chapter(&block)
  @contents.each_with_index do |name, index|
    number = index + 1
    contents = File.read("data/chp#{number}.txt")
    yield(number, name, contents)
  end
end

def search_chapters(query)
  results = []

  return results unless query

  each_chapter do |number, name, contents|
    results << { number: number, name: name } if contents.include?(query)
  end
  results
end

def search_paragraphs(query)
  results = []
  return results unless query

  @contents.each_with_index do |name, index|
    number = index + 1
    contents = File.read("data/chp#{number}.txt")
    paragraph = contents.split("\n\n").select { |pg| pg.include?(query) }
    results << { paragraph: paragraph, number: number } if contents.include?(query)
  end
  results
end

def search_sentences(query)
  results = []
  return results unless query

  @contents.each_with_index do |name, index|
    number = index + 1
    contents = File.read("data/chp#{number}.txt")
    sentence = contents.split(/[!.?]/).select { |sentence| sentence.include?(query) }
    results << { sentence: sentence, number: number } if contents.include?(query)
  end
  results
end

get "/search" do
  query = params[:query]
  @chapters = search_chapters(query) # returns this format {:number=>5, :name=>"The Five Orange Pips\n"}
  @paragraphs = search_paragraphs(query)
  @sentences = search_sentences(query)
  erb :search
end
