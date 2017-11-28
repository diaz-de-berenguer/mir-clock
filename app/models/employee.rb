class Employee < ApplicationRecord

	def self.active
		self.where.not(removed: true)
	end

	def self.removed
		self.where(removed: true)
	end
end
