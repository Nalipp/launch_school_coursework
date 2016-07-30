require "socket"
require "Time"

server = TCPServer.new("localhost", 3006)
def dice(sides)
  rand(sides) + 1
end

def dice_rolls(num, sides)
  return_arr = []
  num.times do
    return_arr << dice(sides)
  end
  return_arr
end

loop do
  client = server.accept

  request_line = client.gets
  client.puts request_line

  params = Hash.new
  request_line.split[1].gsub(/[^a-z=0-9&]/, '').split('&').each do |request|
    params["#{request.split('=')[0]}"] = "#{request.split('=')[1]}"
  end
  
  rolls = params["rolls"].to_i
  sides = params["sides"].to_i
  client.puts dice_rolls(rolls, sides)

  client.close
end
