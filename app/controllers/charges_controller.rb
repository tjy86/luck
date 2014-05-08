class ChargesController < ApplicationController
  def index
binding.pry
  end
  def new
  end
  def amt
    @amt = params[:payAmount].to_f
  end
  def create
    @amount = params[:amount].to_i * 100

    customer = Stripe::Customer.create(
      :email => params[:email],
      :card  => params[:token]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Payment to Luck Management',
      :currency    => 'usd'
    )
  rescue Stripe::CardError => e
    flash[:error] = e.message
    flash.keep(:error)
    render js: "window.location = '#{charges_path}'"
  end
end
