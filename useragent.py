from http.server import BaseHTTPRequestHandler, HTTPServer
import socket

class RequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        user_agent = self.headers.get('User-Agent')
        message = "Welcome to 2022! Your User-Agent is: {}".format(user_agent)
        self.wfile.write(message.encode())

def run(server_class=HTTPServer, handler_class=RequestHandler, port=8080):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)
    host_name = socket.gethostname()
    print(f"Starting server on {host_name} at port {port}")
    httpd.serve_forever()

if __name__ == "__main__":
    run()
