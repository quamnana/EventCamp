class OrderItem < ApplicationRecord
  belongs_to :ticket
  belongs_to :order

  validates :quantity, presence: true

  has_many :coupons
  before_save :set_unit_price
  before_save :set_total



  	def unit_price
  		if persisted?
  			self[:unit_price]
  		else
  			ticket.price
  		end
  	end


  	def total
		unit_price * quantity
  	end







  	private
  		def set_unit_price
  			self[:unit_price] = unit_price
  		end

  		def set_total
  			self[:total] = total * quantity
  		end
end
