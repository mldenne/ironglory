Need to make Guest model. However, must make shipping_address, billing_address, and order polymorphic shippable, billable, Need to make a shopping cart model that has_many cart_products.
acts as state machine

stripe store token on user or guest. stripe ruby. stripe api documentation ruby. Charges controller with actions new and create resources charges do only [:new, :create]
payola

orderings needs a total_ordering_price helper getter method,


def total_ordering_price
  product.price * quantity
end

def total_order_price
  order_price = []
    orderings.each |ordering|
    order_price << ordering.total_ordering_price
    end
  order_price + 5 for shipping + tax./
end


order needs a total_order_price

being
rescue

ca
