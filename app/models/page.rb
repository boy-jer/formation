class Page < ActiveRecord::Base

  validates_presence_of :src
  validates_presence_of :amount

  def stripe_code(token)
    Stripe.api_key = "sk_test_wKMyFKM3ZqTWF59dLX2AB6D1" # kyles test key

    # # Get the credit card details submitted by the form
    # token = params[:stripeToken]


    begin
      charge = Stripe::Charge.create(
        :amount => self.amount.to_i * 100, # amount in cents, again
        :currency => "usd",
        :card => token,
        :description =>  " hi kyle" #{}"<%= self.user.first_name + ' ' page.user.last_name"
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



def preloader_css
  css = <<MYCSS
  <style>
  /* Preloader */

  #preloader .bokeh {
  font-size: 100px;
  width: 1em;
  height: 1em;
  position: relative;
  margin: 100px auto;
  border-radius: 50%;
  border: .01em solid rgba(150,150,150,0.1);
  list-style: none;
}

#preloader .bokeh li {
position: absolute;
width: .2em;
height: .2em;
border-radius: 50%;
}

#preloader .bokeh li:nth-child(1) {
left: 50%;
top: 0;
margin: 0 0 0 -.1em;
background: #00C176;
-webkit-transform-origin: 50% 250%;
-moz-transform-origin: 50% 250%;
-ms-transform-origin: 50% 250%;
-o-transform-origin: 50% 250%;
transform-origin: 50% 250%;
-webkit-animation:
rota 1.13s linear infinite,
opa 3.67s ease-in-out infinite alternate;
-moz-animation:
rota 1.13s linear infinite,
opa 3.67s ease-in-out infinite alternate;
-ms-animation:
rota 1.13s linear infinite,
opa 3.67s ease-in-out infinite alternate;
-o-animation:
rota 1.13s linear infinite,
opa 3.67s ease-in-out infinite alternate;
animation:
rota 1.13s linear infinite,
opa 3.67s ease-in-out infinite alternate;
}

#preloader .bokeh li:nth-child(2) {
top: 50%;
right: 0;
margin: -.1em 0 0 0;
background: #FF003C;
-webkit-transform-origin: -150% 50%;
-moz-transform-origin: -150% 50%;
-ms-transform-origin: -150% 50%;
-o-transform-origin: -150% 50%;
transform-origin: -150% 50%;
-webkit-animation:
rota 1.86s linear infinite,
opa 4.29s ease-in-out infinite alternate;
-moz-animation:
rota 1.86s linear infinite,
opa 4.29s ease-in-out infinite alternate;
-ms-animation:
rota 1.86s linear infinite,
opa 4.29s ease-in-out infinite alternate;
-o-animation:
rota 1.86s linear infinite,
opa 4.29s ease-in-out infinite alternate;
animation:
rota 1.86s linear infinite,
opa 4.29s ease-in-out infinite alternate;
}

#preloader .bokeh li:nth-child(3) {
left: 50%;
bottom: 0;
margin: 0 0 0 -.1em;
background: #FABE28;
-webkit-transform-origin: 50% -150%;
-moz-transform-origin: 50% -150%;
-ms-transform-origin: 50% -150%;
-o-transform-origin: 50% -150%;
transform-origin: 50% -150%;
-webkit-animation:
rota 1.45s linear infinite,
opa 5.12s ease-in-out infinite alternate;
-moz-animation:
rota 1.45s linear infinite,
opa 5.12s ease-in-out infinite alternate;
-ms-animation:
rota 1.45s linear infinite,
opa 5.12s ease-in-out infinite alternate;
-o-animation:
rota 1.45s linear infinite,
opa 5.12s ease-in-out infinite alternate;
animation:
rota 1.45s linear infinite,
opa 5.12s ease-in-out infinite alternate;
}

#preloader .bokeh li:nth-child(4) {
top: 50%;
left 0;
margin: -.1em 0 0 0;
background: #88C100;
-webkit-transform-origin: 250% 50%;
-moz-transform-origin: 250% 50%;
-ms-transform-origin: 250% 50%;
-o-transform-origin: 250% 50%;
transform-origin: 250% 50%;
-webkit-animation:
rota 1.72s linear infinite,
opa 5.25s ease-in-out infinite alternate;
-moz-animation:
rota 1.72s linear infinite,
opa 5.25s ease-in-out infinite alternate;
-ms-animation:
rota 1.72s linear infinite,
opa 5.25s ease-in-out infinite alternate;
-o-animation:
rota 1.72s linear infinite,
opa 5.25s ease-in-out infinite alternate;
animation:
rota 1.72s linear infinite,
opa 5.25s ease-in-out infinite alternate;
}

@-webkit-keyframes rota {
  to { -webkit-transform: rotate(360deg); }
}

@-moz-keyframes rota {
  to { -moz-transform: rotate(360deg); }
}

@-ms-keyframes rota {
  to { -ms-transform: rotate(360deg); }
}

@-o-keyframes rota {
  to { -o-transform: rotate(360deg); }
}

@keyframes rota {
  to { transform: rotate(360deg); }
}

@-webkit-keyframes opa {
  12.0% { opacity: 0.80; }
  19.5% { opacity: 0.88; }
  37.2% { opacity: 0.64; }
  40.5% { opacity: 0.52; }
  52.7% { opacity: 0.69; }
  60.2% { opacity: 0.60; }
  66.6% { opacity: 0.52; }
  70.0% { opacity: 0.63; }
  79.9% { opacity: 0.60; }
  84.2% { opacity: 0.75; }
  91.0% { opacity: 0.87; }
}

@-moz-keyframes opa {
  12.0% { opacity: 0.80; }
  19.5% { opacity: 0.88; }
  37.2% { opacity: 0.64; }
  40.5% { opacity: 0.52; }
  52.7% { opacity: 0.69; }
  60.2% { opacity: 0.60; }
  66.6% { opacity: 0.52; }
  70.0% { opacity: 0.63; }
  79.9% { opacity: 0.60; }
  84.2% { opacity: 0.75; }
  91.0% { opacity: 0.87; }
}

@-ms-keyframes opa {
  12.0% { opacity: 0.80; }
  19.5% { opacity: 0.88; }
  37.2% { opacity: 0.64; }
  40.5% { opacity: 0.52; }
  52.7% { opacity: 0.69; }
  60.2% { opacity: 0.60; }
  66.6% { opacity: 0.52; }
  70.0% { opacity: 0.63; }
  79.9% { opacity: 0.60; }
  84.2% { opacity: 0.75; }
  91.0% { opacity: 0.87; }
}

@-o-keyframes opa {
  12.0% { opacity: 0.80; }
  19.5% { opacity: 0.88; }
  37.2% { opacity: 0.64; }
  40.5% { opacity: 0.52; }
  52.7% { opacity: 0.69; }
  60.2% { opacity: 0.60; }
  66.6% { opacity: 0.52; }
  70.0% { opacity: 0.63; }
  79.9% { opacity: 0.60; }
  84.2% { opacity: 0.75; }
  91.0% { opacity: 0.87; }
}

@keyframes opa {
  12.0% { opacity: 0.80; }
  19.5% { opacity: 0.88; }
  37.2% { opacity: 0.64; }
  40.5% { opacity: 0.52; }
  52.7% { opacity: 0.69; }
  60.2% { opacity: 0.60; }
  66.6% { opacity: 0.52; }
  70.0% { opacity: 0.63; }
  79.9% { opacity: 0.60; }
  84.2% { opacity: 0.75; }
  91.0% { opacity: 0.87; }
}

.ie7 .bokeh,
.ie8 .bokeh,
.ie9 .bokeh {
  display: none;
}

@keyframes rotateOut {
  0% {
    transform-origin: center center;
    transform: rotate(0);
    opacity: 1;
  }

  100% {
    transform: translateY(30px);
    transform: translateX(-100px);
    transform-origin: center center;
    transform: rotate(-30deg);
    opacity: 0;
  }
}

.rotateOut {
  -webkit-animation-name: rotateOut;
  -moz-animation-name: rotateOut;
  -o-animation-name: rotateOut;
  animation-name: rotateOut;
  animation-duration: 2s;
}
</style>
MYCSS
end

def add_css(signupinfo)


  doc = Nokogiri::HTML(open(signupinfo.src))



  doc.css("link").each { |l| l['href'] = "https://docs.google.com#{l['href']}" if l['href'] =~ /^\// }
  doc.css("script").each { |l| l['src'] = "https://docs.google.com#{l['src']}" if l['src'] =~ /^\// }
  # doc.css("style").each do |node|
  #   hold = node.children[0].content
  #   hold.gsub!(/url\('\/\/.*=/, "url('/image/")
    #   node.children[0].content = hold
    #   # node.children[0].content = node.children[0].content.insert(insert_num + 5 , "https:") if insert_num
    # end
    # insert_num = doc.at("style").inner_text.index("url('//")
      # doc.at("style").children = doc.at("style").children.insert(insert_num + 5 , "https:") if insert_num
      # puts " hi kyle"
      # puts doc.at("style").inner_text


      # binding.pry
      stripe_pop_up_code = <<STRIPE

      #{preloader_css}
      <script>
      var overlayLoader = function() {
       var docHeight = $(document).height()

       
       $("body").append("<div id='overlay'><section id='preloader'><ul class='bokeh'><li></li><li></li><li></li><li></li></ul></section></div>");

       $("#overlay")
          .height(docHeight)
          .css({
             'opacity' : 0.8,
             'position': 'absolute',
             'top': 0,
             'left': 0,
             'background-color': 'black',
             'width': '100%',
             'z-index': 5000
          });

    }
      </script>

      <script src="https://checkout.stripe.com/v2/checkout.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>

      <script type="text/javascript">
      $('input#ss-submit').click(function(){

        var submitToRails = function() {
          $.post("http://localhost:3000/pages/1",
            $("form#ss-form").serialize(),
            function() {
              setTimeout(function() {
                $("overlay").hide();
                HTMLFormElement.prototype.submit.call($('form#ss-form')[0]);
              }, 3000);
            });
};

var token = function(res){
  var $input = $('<input type=hidden name=stripeToken />').val(res.id);
  $('form#ss-form').append($input);
  // $('form#ss-form').trigger("submit");
  overlayLoader();
  submitToRails();
  };

  StripeCheckout.open({
    key:         'pk_test_2okzzyyNxcLgaLc31XowCIVG', // kyles test key

    address:     true,
    amount:      #{signupinfo.amount.to_i*100},
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
head = doc.css("head").first.to_html
body = doc.css("body").first.to_html
body = body.gsub!(/<\/body>/, stripe_pop_up_code)
# binding.pry

return [head, body]

end
end
