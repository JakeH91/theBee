# Preview all emails at http://localhost:3000/rails/mailers/product_mailer
class ProductMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/product_mailer/payment_successful
  def payment_successful
  	product = Product.first
  	user = User.first
    ProductMailer.payment_successful(product, user)
  end

end
