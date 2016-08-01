require 'pry'
require "socket"

server = TCPServer.new("localhost", 3010)

def parse_request(request_line)
  http_method, path_and_parameters, http = request_line.split

  path, params = path_and_parameters.split('?')

  params = (params || "").split('&').each_with_object({}) do |param, hash|
    key, value = param.split('=')
    hash[key] = value
  end

  [http_method, path, params]
end

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/

  http_method, path, params = parse_request(request_line)
  number = params.values.last.to_i

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

  client.puts "<H1>Counter</H1>"
  client.puts "<p>The current number is #{number}.</p>"
  client.puts "<a href='/?count=#{number + 1}'>up</a>"
  client.puts "<a href='/?count=#{number - 1}'>down</a>"

  client.puts "</body>"
  client.puts "</html>"

  client.close
end

#example : http://localhost:3010/?count=0
