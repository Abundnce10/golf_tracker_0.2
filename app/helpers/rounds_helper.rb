module RoundsHelper
	def generate_starting_hole_array()
		@starting_arr = []
		@starting_arr.push(["Hole #1", 1])
		@starting_arr.push(["Hole #10", 10])
		(2..9).each do |i|
			@starting_arr.push(["Hole ##{i}", i])
		end
		(11..18).each do |i|
			@starting_arr.push(["Hole ##{i}", i])
		end
		return @starting_arr
	end

	def generate_hours_of_day()
		@hours_arr = []
		(5..18).each do |i|
			if i < 12
				@hours_arr.push(["#{i}am", i])
			elsif i == 12
				@hours_arr.push(["#{i}pm", i])
			else
				@hours_arr.push(["#{i-12}pm", i])
			end
		end
		return @hours_arr
	end

	def generate_score_title(score_change, par)
		if par.to_i == 4
			case score_change.to_i
			when -3
				return "Hole in One"
			when -2
				return "Eagle"
			when -1
				return "Birdie"
			when 0
				return "Par"
			when 1
				return "Bogey"
			when 2
				return "Double Bogey"
			when 3
				return "Triple Bogey"
			when 4
				return "Snowman"
			else
				return "Off the Charts"
			end
		elsif par.to_i == 3
			case score_change.to_i
			when -2
				return "Hole in One"
			when -1
				return "Birdie"
			when 0
				return "Par"
			when 1
				return "Bogey"
			when 2
				return "Double Bogey"
			when 3
				return "Triple Bogey"
			else
				return "Off the Charts"
			end
		else
			case score_change.to_i
			when -3
				return "Double Eagle"
			when -2
				return "Eagle"
			when -1
				return "Birdie"
			when 0
				return "Par"
			when 1
				return "Bogey"
			when 2
				return "Double Bogey"
			when 3
				return "Triple Bogey"
			when 4
				return "Snowman"
			when 5
				return "Time to Go Home"
			else
				return "Off the Charts"
			end
		end
	end
end
