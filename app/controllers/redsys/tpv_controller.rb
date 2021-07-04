module Redsys
  class TpvController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:confirmation]

    #
    # Jump form to the payment gateway
    # - amount:decimal => Amount to collect
    # - order:string => unique identifier of the order first 4 position should be numbers,
    # the rest up to 12 positions will be ASCII characters from these ranges:
    # 30 (0) - 39 (9), 65 (A) - 90 (Z), 97 (a) - 122 (z)
    # - language:string => '001' Spanish, '002' English ...
    # - url_ok:string => return url of the pos for correct payment
    # - url_ko:string => return url of the pos when an error occurs
    #
    def form
      amount = BigDecimal(params[:amount] || '0')
      order = params[:order] || '0'
      language = params[:language]
      url_ok = params[:url_ok]
      url_ko = params[:url_ko]
      merchant_url = params[:merchant_url] || redsys_notification_url if defined?(redsys_notification_url)
      merchant_name = params[:merchant_name]
      product_description = params[:product_description]
      @tpv = Redsys::Tpv.new(amount, order, language, merchant_url, url_ok, url_ko, merchant_name, product_description)
    end
    
  end
end
