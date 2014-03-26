class AddOrdersToLineItem < ActiveRecord::Migration
  def change
  	add_reference :line_items, :order
  end
end
