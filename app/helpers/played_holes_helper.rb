module PlayedHolesHelper

	def generate_strokes_array(num)
		@strokes_arr = []
		(num*2).times.each do |i|
			@strokes_arr.push(["#{i+1}", i+1])
		end
		return @strokes_arr
	end

	def generate_putts_array(num)
		@putts_arr = []
		num.times.each do |i|
			@putts_arr.push(["#{i+1}", i+1])
		end
		return @putts_arr
	end

end
