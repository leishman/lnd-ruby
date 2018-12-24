# Most code from https://github.com/lightningnetwork/lnd/blob/master/docs/grpc/ruby.md
require 'grpc'
require_relative '../gen/rpc_services_pb'
require 'macaroon_interceptor'

class Lnd
  # Default host:port should be '127.0.0.1:10009'
  def self.get_stub(tls_cert_path:, macaroon_path:, host:, port:)
    macaroon_binary = File.read(File.expand_path(macaroon_path))
    macaroon = macaroon_binary.each_byte.map { |b| b.to_s(16).rjust(2,'0') }.join
    ENV['GRPC_SSL_CIPHER_SUITES'] = "HIGH+ECDSA"

    certificate = File.read(File.expand_path(tls_cert_path))
    credentials = GRPC::Core::ChannelCredentials.new(certificate)
    @stub = Lnrpc::Lightning::Stub.new("#{host}:#{port}",
                                       credentials,
                                       interceptors: [MacaroonInterceptor.new(macaroon)])
  end
end