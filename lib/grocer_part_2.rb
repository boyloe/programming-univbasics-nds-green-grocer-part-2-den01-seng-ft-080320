require_relative './part_1_solution.rb'
require "pry"

def apply_coupons(cart, coupons)
  coupon_cart = [] #coupon cart is an array of hashe!!!
  coupon_cart.push(:item => "avocado")
  binding.pry
  cart.each do |food|
    coupons.each do |coupon|      
      if food[:item] == coupon[:item] && food[:count] >= coupon[:num]
        food[:count] =  food[:count] - coupon[:num]
        
        if coupon_cart[:item] = "#{food[:item]} W/COUPON"
          coupon_cart[:count] += 1
        else
          coupon_cart[:item] = {:price => coupon[:cost], :clearance => food[:clearance], :count => 1}
        end
      end
    end
    result[food] = info
  end
  result
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
  cart = consolidate_cart(items)
  cons_cart = apply_coupons(cart, coupons)
  final_cart = apply_clearance(cons_cart)  
  total = 0  
  final_cart.each do |name, price_hash|
    total += price_hash[:price] * price_hash[:count]
  end  
  total > 100 ? total * 0.9 : total  
end