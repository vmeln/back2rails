require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test 'Empty product should be invalid' do
    product = Product.new
    assert(product.invalid?, 'Product should be invalid')
    assert(product.errors[:title].any?, 'Title should be invalid')
    assert(product.errors[:description].any?, 'Description should be present')
    assert(product.errors[:price].any?, 'Price should be present')
  end

  test 'Product price should be positive' do
    product = Product.new(:title => 'Product', :description => 'Description', :image_url => 'some.url.gif')
    assert(product.invalid?, 'Product should be invalid due to unset price')

    product.price = -100
    assert(product.invalid?, 'Product should be invalid with negative price')
    product.price = 100
    assert(product.price, 'Now the product should be valid')
  end

  test 'Name should be unique' do
    product = Product.new(
        :title => products(:first).title,
        :description => 'Super description',
        :image_url => 'url.gif',
        :price => 20.0)

    assert !product.save

    # Can't find in translations
    assert_equal('has already been taken', product.errors[:title].join('; '))
  end
end
