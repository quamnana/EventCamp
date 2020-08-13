class RecieptsPolicy < ApplicationPolicy
	def show?
		(user.present? && user == order.user) || user.try(:admin)
	end



	private
		def order
			record
		end
	
end