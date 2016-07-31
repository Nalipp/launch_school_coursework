require "socket"

server = TCPServer.new("localhost", 3006)

def parse_request(request_line)
  http_method, path_and_parameters, http = request_line.split
  path, params = path_and_parameters.split('?')

  params = params.split('&').each_with_object({}) do |pair, hash|
    key, value = pair.split('=')
    hash[key] = value
  end
  [http_method, path, params]
end

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  http_method, path, params = parse_request(request_line)

  client.puts "HTTP/1.0 200 OK"
  client.puts "Content-Type: text/html"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts http_method
  client.puts path
  client.puts params
  client.puts "</pre>"
  client.puts "<H1>Rolls!</H1>"

  rolls = params['rolls'].to_i
  sides = params['sides'].to_i

  rolls.times do
    roll = rand(sides) + 1
    client.puts "<p>", roll, "</p>"
  end

  client.puts "</body>"
  client.puts "</html>"

  client.close
end

#example : http://localhost:3006/?rolls=12&sides=12
