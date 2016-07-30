require "socket"
require "Time"

server = TCPServer.new("localhost", 3006)

def parse_request(request_line)
  http_method, path_and_parameters, http = request_line.split
  path, params = path_and_parameters.split('$')

  params = params.split('&').each_with_object({}) do |pair, hash|
    key, value = pair.split('=')
    hash[key] = value
  end
  [http_method, path, params]
end

loop do
  client = server.accept

  request_line = client.gets
  client.puts request_line

  http_method, path, params = parse_request(request_line)

  client.puts http_method
  client.puts path
  client.puts params

  rolls = params['rolls'].to_i
  sides = params['sides'].to_i

  rolls.times do
    roll = rand(sides) + 1
    client.puts roll
  end

  client.close
end
