namespace :data do


	desc "sample time data"
	task :sample_time, [:env] => [:environment] do
		puts "\n\nStarting #{Time.now}"
		start_time  = Time.now
		err         = []

		e = Employee.last
		create_time = Time.now

		100.times do |c|
			data = e.time.build({
				# String of local time. eg: "Tue Nov 28 2017 11:36:20 GMT-0600 (CST)"
				local_time: create_time.strftime("%a %b %d %Y %H:%M:%S GMT-0600 (CST)"),
				in:         (c % 2 == 0),           # alternate between true and false
				created_at: create_time,
			})

			if data.save
				print "."
			else
				err << "Error: #{data.errors.full_messages}"
			end

			create_time -= (rand * 2 + 0.2).hours
		end

		puts "\n\nDuration: #{Time.now - start_time} seconds"
		puts "\n\nErrors:"
		puts err.join("\n")
		puts "\n\n"
	end
end
