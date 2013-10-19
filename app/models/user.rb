class User < ActiveRecord::Base
  def recipient_setup(token)
    Stripe.api_key = "sk_test_mkGsLqEW6SLnZa487HYfJVLf"

    # Get the bank account details submitted by the form
    token = params[:stripeToken]

    # Create a Recipient
    recipient = Stripe::Recipient.create(
      :name => "John Doe",
      :type => "individual",
      :email => "payee@example.com",
      :bank_account => token
    )
  end
end
