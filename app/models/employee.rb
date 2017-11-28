class Employee < ApplicationRecord
	has_many :clocks

	def self.active
		self.where.not(removed: true)
	end

	def self.removed
		self.where(removed: true)
	end

	def time
		self.clocks
	end

	def time_as_csv
		CSV.generate(col_sep: "\t") do |csv|
			csv << ['Date', 'Time In', 'Time Out', 'UTC Time']
			self.time.order(:created_at).each do |t|
				csv << t.as_row + [ t.created_at.to_s ]
			end
		end
	end
end
