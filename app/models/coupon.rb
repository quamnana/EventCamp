class Coupon < ApplicationRecord
  belongs_to :ticket
  belongs_to :order_item
  belongs_to :user
  belongs_to :event
  before_create :set_code

  

  def generate_code
  	self.code = SecureRandom.alphanumeric(8)
  end



  private
  	def set_code
  		self[:code] = generate_code
  	end
end
