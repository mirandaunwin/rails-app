class PaymentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    begin
      charge = Stripe::Charge.create({
        amount: @product.price*100,
        currency: "eur",
        source: token,
        description: params[:stripeEmail],
        receipt_email: @user.email
      })
      if charge.paid
        Order.create({
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price
        })
        flash[:notice] = "Payment successful. Thank you for your order."
      end
    rescue Stripe::CardError => e
      #The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "There was an error processing your payment: #{err[:message]}"
    end
    redirect_to product_path(@product)
  end
end
