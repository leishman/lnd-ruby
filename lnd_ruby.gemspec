Gem::Specification.new do |s|
  s.name        = 'lnd_ruby'
  s.version     = '0.0.1'
  s.date        = '2018-12-21'
  s.summary     = "LND gRPC Gem"
  s.description = "Simple LND RPC interface libarary"
  s.authors     = ["Alexander Leishman"]
  s.email       = 'leishman3@gmail.com'
  s.files       = Dir["{gen,lib,vendor}/**/*"]
  s.license       = 'MIT'

  s.add_dependency("grpc", "~> 1.17.1")
end