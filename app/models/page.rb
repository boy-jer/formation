class Page < ActiveRecord::Base

  validates_presence_of :src
  validates_presence_of :amount

  def stripe_code(signupinfo)
    Stripe.api_key = "sk_test_wKMyFKM3ZqTWF59dLX2AB6D1" # kyles test key

    # # Get the credit card details submitted by the form
    token = params[:stripeToken]
  #  debugger

    begin
      charge = Stripe::Charge.create(
        :amount => signupinfo.amount * 100, # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => "change later"
      )

      # # Create a Customer
      # customer = Stripe::Customer.create(
      #   :card => token,
      #   :description => person.name + " applepicking.herokuapp.com",
      #   :email => person.email
      # )

      # person.stripe_customer_id = customer.id

      rescue Stripe::CardError => e
        # The card has been declined
        puts "Error: #{e.inspect}"
    end

end

def iframe_to_src(iframe)
  form_link = /src="(.+?)"/.match(iframe)[0][5...-1]
  doc = Nokogiri::HTML(open(form_link))
  # title = doc.css("h1").first.children.first.text
  form_link
end

end

def add_css(signupinfo)


  doc = Nokogiri::HTML(open(signupinfo.src))
  doc.css("link").each { |l| l['href'] = "https://docs.google.com#{l['href']}" if l['href'] =~ /^\// }
  doc.css("script").each { |l| l['src'] = "https://docs.google.com#{l['src']}" if l['src'] =~ /^\// }
  doc.css("style").each do |node|
    hold = node.children[0].content
    hold.gsub!(/url\('\/\/.*=/, "url('/image/")
    node.children[0].content = hold
    # node.children[0].content = node.children[0].content.insert(insert_num + 5 , "https:") if insert_num
  end
  # insert_num = doc.at("style").inner_text.index("url('//")
  # doc.at("style").children = doc.at("style").children.insert(insert_num + 5 , "https:") if insert_num
  # puts " hi kyle"
  # puts doc.at("style").inner_text

  # binding.pry
  stripe_pop_up_code = <<STRIPE

  <script src="https://checkout.stripe.com/v2/checkout.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>

  <script type="text/javascript">
    $('input#ss-submit').click(function(){

      var token = function(res){
        var $input = $('<input type=hidden name=stripeToken />').val(res.id);
        $('form#ss-form').append($input).submit();
        //window.location = "/new_page?token=" + res
      };

      StripeCheckout.open({
        key:         'pk_test_2okzzyyNxcLgaLc31XowCIVG', // kyles test key

        address:     true,
        amount:      #{signupinfo.amount*100},
        currency:    'usd',
        name:        "change later",
        description: "Powered by Stripe",
        panelLabel:  'Checkout',
        token:       token
      });

      return false;
    });
  </script>
  </body>
STRIPE

  a = doc.to_html
  a = a.gsub!(/<\/body>/, stripe_pop_up_code)
  # binding.pry

  a

end
