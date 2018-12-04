if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_v0ZRPCynOfWO8v9STZ2LJGur',
    secret_key: 'sk_test_bm4Np9M383uqLjbUySXiFDQa'
  }
end

Stripe.api_key = Rails.configuration.stripe[:publishable_key]
