class Order < ApplicationRecord
  belongs_to :Customer
  has_many :OrderDetail

  def get_order_details
    self.OrderDetail
  end
end
