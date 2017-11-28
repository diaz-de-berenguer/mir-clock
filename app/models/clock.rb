class Clock < ApplicationRecord
	validates_presence_of :employee, :local_time
  belongs_to :employee

  def out
  	!self.in
  end
end
