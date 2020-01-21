require 'socket'                 # Get sockets from stdlib

if ARGV.length < 1
	abort "Usage: ruby hellosrvRuby.rb <port number>"
end

server = TCPServer.open(ARGV[0])
loop {                           # Servers run forever
        client = server.accept        # Wait for a client to connect
	sock_domain, remote_port, remote_hostname, remote_ip = client.peeraddr
        data = client.gets
	puts "Connection from " + remote_ip
        puts data
        client.puts "Goodbye " + data.split.last + " from Ruby"
        client.close                  # Disconnect from the client
}
