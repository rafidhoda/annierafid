class ChargesController < ApplicationController
  require 'net/http'
  require 'json'

  def new
  end

  def create
    url = 'http://api.fixer.io/latest?base=USD'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    exchange = JSON.parse(response)
    @nok = exchange['rates']['NOK'].to_f
    @rub = exchange['rates']['RUB'].to_f
    @gbp = exchange['rates']['GBP'].to_f

    @gift = Gift.find(params['gift'])
    # Amount in cents
    @orig_amount = @gift.amount

    def convert_amount(orig_amount, currency)
      if currency == 'nok'
        ((@orig_amount / @nok) * 100).floor
      elsif currency == 'rub'
        ((@orig_amount / @rub) * 100).floor
      elsif currency == 'gbp'
        ((@orig_amount / @gbp) * 100).floor
      else
        (@orig_amount * 100).floor
      end
    end

    @amount = convert_amount(@orig_amount, @gift.currency)

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Gift for Annie & Rafid',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
