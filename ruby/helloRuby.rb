require 'socket'

if ARGV.length < 2
    abort "Usage: helloRuby <host IP> <host port>"
end

hostname = ARGV[0]

port = ARGV[1]

soc = TCPSocket.new hostname, port

message = "Hello in Ruby\n"
puts "Sending: " + message
soc.puts message

line = soc.gets
puts "Received:" + line
soc.close
