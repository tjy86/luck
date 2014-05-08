# Stripe.api_key = ""
# STRIPE_PUBLIC_KEY = ""
Rails.configuration.stripe = {
  :publishable_key => "pk_live_gztqxkPZkzDVwZfXZZptBYio"
  # :secret_key      => sk_test_IsYVoEHQpf62rvxb8HG1PM6a
}

# Stripe.api_key = Rails.configuration.stripe[:secret_key]
Stripe.api_key = ENV["STRIPE_SECRET"]
