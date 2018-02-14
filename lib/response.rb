

response = "<pre>
Verb:#{request_lines[0].split(" ")[0]}
Path:#{request_lines[0].split(" ")[1]}
Protocol:#{request_lines[0].split(" ")[2]}
Host:#{request_lines[1].split(" ")[1].split(":")[0]}
Port:#{request_lines[1].split(" ")[1].split(":")[1]}
Origin:#{request_lines[1].split(" ")[1].split(":")[0]}
Accept: #{request_lines[6]}
</pre>"

response = Response.new.body(request_lines)


class Response

  attr_reader :verb,
              :path,
              :protocol,
              :host,
              :port,
              :origin, :accept

  def initialize(request)
   @verb = request_lines[0].split(" ")[0]
   @path = request_lines[0].split(" ")[1]
   @protocol = request_lines[0].split(" ")[2]
   @host = request_lines[1].split(" ")[1].split(":")[0]
   @port = request_lines[1].split(" ")[1].split(":")[1]
   @origin = request_lines[1].split(" ")[1].split(":")[0]
   @accept = request_lines[6]

  end

  def hello_world
    response = "<pre> Hello, World! (#{counter })  </pre>"
  end


def root

end

  def body
    if path == 'hello'
      hello_world
    else

  end

end

response = "<pre> Hello, World! (#{counter })  </pre>"
