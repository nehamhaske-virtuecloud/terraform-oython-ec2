from http.server import BaseHTTPRequestHandler, HTTPServer

class HelloHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"Hello, world from EC2!")

server = HTTPServer(("0.0.0.0", 8000), HelloHandler)
print("Starting server on port 8000...")
server.serve_forever()
