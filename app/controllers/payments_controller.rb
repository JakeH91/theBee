class PaymentsController < ApplicationController
	# POST /payments
  # POST /payments.json
	def create
		@product = Product.find(params[:product_id])
		@user = current_user
		token = params[:stripeToken]
    @email = params[:stripeEmail]
  	# Create the charge on Stripe's servers - this will charge the user's card
  	begin
    	charge = Stripe::Charge.create(
      	amount: (@product.price * 100).to_i, # amount in cents, again
      	currency: "usd",
      	source: token,
      	description: params[:stripeEmail]
    	)

    if charge.paid
    	Order.create(product_id: @product.id, user_id: @user.id, total: @product.price)
    end

  	rescue Stripe::CardError => e
    	# The card has been declined
    	body = e.json_body
    	err = body[:error]
    	flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  	end
    ProductMailer.payment_successful(@product, @email).deliver_now
    ProductMailer.order_received(@product, @user).deliver_now
  	render "payments/create"
	end
end
