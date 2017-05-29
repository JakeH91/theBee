class ProductMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.payment_successful.subject
  #
  def payment_successful(product, user)
  	@product = product
  	@user = user

    mail to: @user.email,
    		 subject: "Order Successful"
  end
end
