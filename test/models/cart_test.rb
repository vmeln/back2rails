require 'test_helper'

class CartTest < ActiveSupport::TestCase
	fixtures :carts, :products

	test 'Should add only one item per product' do
		cart = Cart.new
		cart.save

		product = products(:first)

		assert(!cart.nil?, 'Cart should be created')

		cart.add_product(product.id)
		cart.save!

		assert_equal(1, cart.line_items.count, 'There should be one line item')

		another_line_item = cart.add_product(product.id)

		another_line_item.save

		assert_equal(2, cart.line_items.first.quantity, 'There should be two line items after replenishment with same product')
		assert_equal(1, cart.line_items.count, 'There should be only one actual line item')
	end
end
