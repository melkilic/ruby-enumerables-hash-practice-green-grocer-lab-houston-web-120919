
def consolidate_cart(cart)
 final_hash= {}
   cart.each do |element_hash|
     element_name = element_hash.keys[0]

     if final_hash.has_key?(element_name)
       final_hash[element_name][:count] +=1
    else
       final_hash[element_name]={
        count:1,
        price: element_hash[element_name][:price],
       clearance: element_hash[element_name][:clearance]
}
   end
 end
final_hash
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    if cart.keys.include?(coupon[:item])
       if cart[coupon[:item]][:count] >= coupon[:num]
          new_name= "#{coupon[:item]} W/COUPON"
   if cart[new_name]
     cart[new_name][:count] += coupon[:num]
   else
     cart[new_name]= {
     count: coupon[:num],
     price: coupon[:cost] / coupon[:num],
     clearance: cart[coupon[:item]][:clearance]
   }
    end
    cart[coupon[:item]][:count] -= coupon[:num]
  end
end
end
cart
   end






def apply_clearance(cart)
cart.each do |item, price_hash|
  if price_hash[:clearance] == true
    price_hash[:price] = (price_hash[:price] * 0.8).round(2)
  end
end
cart
end



  def checkout(items, coupons)
    cart = consolidate_cart(cart)
    cart1 = apply_coupons(cart, coupons)
    cart2 = apply_clearance(cart1)

    total = 0

    cart2.each do |name, price_hash|
      total += price_hash[:price] * price_hash[:count]
    end

    total > 100 ? total * 0.9 : total

  end
