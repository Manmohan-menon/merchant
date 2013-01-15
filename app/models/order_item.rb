class OrderItem < ActiveRecord::Base
  attr_accessible :product_id, :order_id, :quantity

  validates :order_id,  :presence => true
  validates :product_id, :presence => true
  
  belongs_to :order
  belongs_to :product
  
  def subtotal
	  quantity * product.price 
	  #number_to_currency(item.quantity * item.product.price)
  end
end
