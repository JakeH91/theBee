if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_51UAhyBMjPkcqZYAsv7cAeGT',
    secret_key: 'sk_test_e2H30JYCiEBwmi2TIk4CmJK7'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]