class ProductMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.payment_successful.subject
  #
  def payment_successful(product, email)
  	@product = product
  	@email = email

    mail to: @email,
    		 subject: "Order Successful"
  end

  def order_received(product, user)
  	@product = product
  	@user = user

  	mail to: 'jake_hill666@hotmail.co.uk',
  			 subject: "Order for #{@product.name}"
  end
end
