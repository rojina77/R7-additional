class Order < ApplicationRecord
  belongs_to :customer

  validates :product_name, :product_count, :customer, presence: true
  validate :valid_customer_id

  private

  def valid_customer_id
    errors.add(:customer_id, 'must be a valid customer') unless Customer.exists?(customer_id)
  end
end
