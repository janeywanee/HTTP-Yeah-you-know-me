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
counter = 0
loop do
  counter += 1
client = tcp_server.accept

request_lines = []
while line = client.gets and !line.chomp.empty?
  request_lines << line.chomp
  binding.pry
end
response = "<pre>"
"Verb:#{request_lines[0][0..2]}"
"Path:#{request_lines[0][4]}"
"Protocol:#{request_lines[0][6..13]}"
"Host:#{request_lines[1][6..14]}"
"Port:#{request_lines[1][16..19]}"
"Origin:#{request_lines[1][6..14]}"
"Accept: #{request_lines[6]}"
"</pre>"
response = "<pre> Hello, World! (#{counter })  </pre>"
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
