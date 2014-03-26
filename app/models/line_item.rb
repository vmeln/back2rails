class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def total_price
  	if !(price.nil? or quantity.nil?)
		price * quantity
	else 
		0
	end
  end
end