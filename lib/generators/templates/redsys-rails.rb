# config/initializers/redsys-rails.rb
# 
# The following values ​​are provided by your financial institution.
# It is recommended to save the key for the signature in secrets.yml.
#
# => url: URL TPV
# => sha_256_key: HMAC SHA256 signature key
# => merchant_code: Commercial Code
# => merchant_terminal: Terminal code
# => merchant_transaction_type: Transaction Type
# => merchant_currency: currency (978: euro, 840: dollars, 826: pounds, 392: yen)
# => signature_version: HMAC SHA256 signature version
#

if Rails.env == 'production'
  Rails.configuration.redsys_rails = {
    url: '',
    sha_256_key: '',
    merchant_code: '',
    merchant_terminal: '',
    merchant_transaction_type: '',
    merchant_currency: '978',
    signature_version: 'HMAC_SHA256_V1'
  }
else
  Rails.configuration.redsys_rails = {
    url: '',
    sha_256_key: '',
    merchant_code: '',
    merchant_terminal: '',
    merchant_transaction_type: '',
    merchant_currency: '978',
    signature_version: 'HMAC_SHA256_V1'
  }
end