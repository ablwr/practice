
# The cart starts as an array of individual items. 
# Translate it into a hash that includes the counts for each item with the consolidate_cart method.


def consolidate_cart(cart: []) # refactor with inject
  consolidated_cart = {}
  # iterate through cart, finding total amount of unique items
  # add to consolidated cart
  cart.each do |item|
    # {"AVOCADO"=>{:price=>3.0, :clearance=>true}}
    item.each do |name, details|
      if consolidated_cart[name]
        consolidated_cart[name][:count] += 1
      else
        consolidated_cart[name] = details.merge(:count => 1)
      end
    end
  end
  return consolidated_cart
end


def checkout(cart:, coupons: [])
  total = 0
  final_cart = consolidate_cart(cart: cart)
  final_cart.each do |item, attributes|
    total += final_price_for_item(item, attributes, coupons)
  end
  total_cost(total)
end

# Check item price, check if on clearance, if it is, do math stuff

def final_price_for_item(item, attributes, coupons)
  price = 0
  # Do we have coupon?
  if coupon = coupon_for_item(item, attributes, coupons)
    price += coupon[:cost]
    attributes[:count] -= coupon[:num]
  end

  price += (attributes[:count] * attributes[:price])

  if attributes[:clearance]
    price *= 0.8
  end

  price
end

def coupon_for_item(item, attributes, coupons)
  # {:item => "AVOCADO", :num => 2, :cost => 5.00}
  coupon = coupons.detect{|c| c[:item] == item}
  if coupon && coupon[:num] <= attributes[:count]
    coupon
  end
end

def total_cost(total)
  (if total >= 100
    total * 0.9
  else
    total
  end).round(1)
end


  # let(:items) do
  #   [
  #     {"AVOCADO" => {:price => 3.00, :clearance => true}},
  #     {"KALE" => {:price => 3.00, :clearance => false}},
  #     {"BLACK_BEANS" => {:price => 2.50, :clearance => false}},
  #     {"ALMONDS" => {:price => 9.00, :clearance => false}},
  #     {"TEMPEH" => {:price => 3.00, :clearance => true}},
  #     {"CHEESE" => {:price => 6.50, :clearance => false}},
  #     {"BEER" => {:price => 13.00, :clearance => false}},
  #     {"PEANUTBUTTER" => {:price => 3.00, :clearance => true}},
  #     {"BEETS" => {:price => 2.50, :clearance => false}}
  #   ]