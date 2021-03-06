# From: https://github.com/lightningnetwork/lnd/blob/master/docs/grpc/ruby.md
class MacaroonInterceptor < GRPC::ClientInterceptor
  attr_reader :macaroon

  def initialize(macaroon)
    @macaroon = macaroon
    super
  end

  def request_response(request:, call:, method:, metadata:)
    metadata['macaroon'] = macaroon
    yield
  end

  def server_streamer(request:, call:, method:, metadata:)
    metadata['macaroon'] = macaroon
    yield
  end
end