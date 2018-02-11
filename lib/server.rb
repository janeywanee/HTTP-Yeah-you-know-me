# require 'socket'
# class server
#
#   def initialize
#     @tcp_server = TCPServer.new(9292)
#     @client = tcp_server.accept
#   end
#
#   end
require 'pry'
require 'socket'
tcp_server = TCPServer.new(9292)
counter = -1
loop do
  counter += 1
client = tcp_server.accept
binding.pry

request_lines = []
while line = client.gets and !line.chomp.empty?
  request_lines << line.chomp
end

response = "<pre> Hello, World! (#{counter })  </pre>"
binding.pry
output = "<html><head></head><body>#{response}</body></html>"
headers = ["http/1.1 200 ok",
          "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
          "server: ruby",
          "content-type: text/html; charset=iso-8859-1",
          "content-length: #{output.length}\r\n\r\n"].join("\r\n")
client.puts headers
client.puts output
client.puts counter


client.close
end
