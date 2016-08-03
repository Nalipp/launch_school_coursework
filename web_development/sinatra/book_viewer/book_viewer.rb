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

  def find_paragraph_number(text, query)
    text.split("\n\n").each_with_index.select do |paragraph, index|
      return index if paragraph.include?(query)
    end
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
  search_chapters(query) # returns this format {:number=>5, :name=>"The Five Orange Pips\n"}
  all_chapter_numbers = search_chapters(query).map { |chapter| chapter[:number] } # [1, 3, 5, 6, 7]

  all_chapter_numbers.map do |chapter_number|
    text = File.read("data/chp#{chapter_number}.txt")
    paragraph_number = find_paragraph_number(text, query)

    [chapter_number, paragraph_number]
  end
end

def return_paragraph_text(chapter_paragraph_number)
  arr_of_paragraph_text = []

  chapter_paragraph_number.each do |arr| # arr[0] == chapter_number, arr[1] == paragraph_number
    chapter = File.read("data/chp#{arr[0]}.txt")

    chapter.split("\n\n").each_with_index do |paragraph, index|
      arr_of_paragraph_text << [arr[0], paragraph]  if index == arr[1]
    end
  end
  arr_of_paragraph_text
end

get "/search" do
  @chapters = search_chapters(params[:query]) # returns this format {:number=>5, :name=>"The Five Orange Pips\n"}
  @chapter_paragraph_number = search_paragraphs(params[:query]) # [chapter_number, paragraph_number] / [[1, 186], [4, 105]]
  @all_paragraphs = return_paragraph_text(@chapter_paragraph_number)
  erb :search
end
