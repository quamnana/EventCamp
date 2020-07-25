class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, class_name: "User"
  has_many :order_items, dependent: :destroy
  has_many :coupons, dependent: :destroy

  before_save :set_ticket_sku
  
  	
 

  def ticket_sku
  	self.sku = SecureRandom.hex
  end



  private
  	def set_ticket_sku
  		self[:sku] = ticket_sku
  	end
end
