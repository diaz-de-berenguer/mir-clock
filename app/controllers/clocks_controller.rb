class ClocksController < ApplicationController

	def create
		local_time = Time.parse(params[:clock][:local_time])

		@clock = Clock.new({
			employee_id: params[:clock][:employee_id],
			local_time:  params[:clock][:local_time],
			in:          params[:out].nil?
		})
		respond_to do |f|
			if @clock.save
				@message = "Thanks #{@clock.employee.name}! You've successfully clocked #{@clock.in ? "in" : "out"} at #{local_time.strftime('%I:%M %p')}"
				f.html { redirect_to root_path, notice: @message }
				f.js
			else
				@message = "Something went wrong! #{@clock.errors.full_messages.to_sentence}"
				f.html { redirect_to root_path, notice: @message }
				f.js
			end
		end
	end
end
