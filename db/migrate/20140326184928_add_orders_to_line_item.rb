class AddOrdersToLineItem < ActiveRecord::Migration
  def change
  	add_reference :orders, :line_item
  end
end
