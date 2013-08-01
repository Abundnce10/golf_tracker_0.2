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
end
