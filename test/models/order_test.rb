# test/models/order_test.rb
require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'should save valid order' do
    order = Order.new(product_name: 'Example Product', product_count: 5, customer: customers(:one))
    assert order.save
  end

  test 'should not save order without product_name' do
    order = Order.new(product_count: 5, customer: customers(:one))
    assert_not order.save
  end

  test 'should not save order without product_count' do
    order = Order.new(product_name: 'Example Product', customer: customers(:one))
    assert_not order.save
  end

  test 'should not save order without customer' do
    order = Order.new(product_name: 'Example Product', product_count: 5)
    assert_not order.save
  end

  test 'should not save order with invalid customer_id' do
    order = Order.new(product_name: 'Example Product', product_count: 5, customer_id: 999)
    assert_not order.save
  end
end
