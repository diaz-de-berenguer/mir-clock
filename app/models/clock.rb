class Clock < ApplicationRecord
	validates_presence_of :employee, :local_time
  belongs_to :employee

  def out
  	!self.in
  end

  def local_format
  	Time.parse(self.local_time)
  end

  def as_row
  	time = self.local_format
  	row  = []
  	row << time.strftime("%x")
  	if self.in
  		row << time.strftime("%I:%M %p")
  		row << ''
  	else
  		row << ''
  		row << time.strftime("%I:%M %p")
  	end
  	return row
  end
end
