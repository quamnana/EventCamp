class Coupon < ApplicationRecord
  belongs_to :ticket
  before_save :set_code

  validates :code, presence: true

  def generate_code
  	self.code = SecureRandom.hex
  end



  private
  	def set_code
  		self[:code] = generate_code
  	end
end
