class ChargesController < ApplicationController
  def new
  end

  def create
    @gift = Gift.find(params['gift'])
    # Amount in cents
    @amount = @gift.amount

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
