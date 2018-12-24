## Usage

```ruby
require 'lnd_ruby'

stub = Lnd.get_stub('PATH_TO_TLS_CERT', 'PATH_TO_MACAROON', 'HOST_OF_NODE', 'PORT_OF_GRPC')

# example call to list invoices
stub.list_invoices(Lnrpc::ListInvoiceRequest.new)

# example call to generate invoice
```

## License and Credit

MIT License.

The `rpc.proto` file and much of the code comes directly from https://github.com/lightningnetwork/lnd/blob/master/docs/grpc/ruby.md.