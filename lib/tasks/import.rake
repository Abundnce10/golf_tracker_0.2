namespace :import do

	def convert_time(t1, t2=Time.new)
		t = t2 - t1
		mm, ss = t.divmod(60)
		if mm > 60
			hh, mm = mm.divmod(60)
		elsif mm > 0
			return "%d minutes, %d seconds" % [mm, ss]
		else
			return "%d seconds" % [ss]
		end

		if hh > 24
			dd, hh = hh.divmod(24)
			return "%d days, %d hours, %d minutes, %d seconds" % [dd, hh, mm, ss]
		else
			return "%d hours, %d minutes, %d seconds" % [hh, mm, ss]
		end
	end



	desc "imports course data into database"


	task :courses => :environment do

		t1 = Time.new
		puts t1
		File.open("./import_logs.txt", 'a') {|f| f.write(Time.new.to_s + "\tStarted\n") }

		# Tracker variables
	    @current_state = ''
		@current_state_course_count = 0
		@state_courses = 0
		@total_courses = 0
	    @past_state = ''
		@past_state_course_count = 0
		@past_state_finish_time = 0
		@counter = 0


		# Loop thru all 28 files
		(1..33).each do |x|

			fname = "courses_hash_#{x}.txt"
			f = File.open("./data/"+fname, "r")

			@courses_hash = Marshal.load f.read

			@courses_hash.each do |c|

				# Course Details
				cds = c[1]

				# New Course
				@total_courses += 1
				@state_courses += 1

				#### TRY SAVING COURSE
				#### ELSE STORE COURSE_ID
				begin


				    #  Save Course Type
				    @course_type = CourseType.find_by_course_type(cds[:course_specifics][:class])
				    if @course_type.nil?
				        @course_type = CourseType.create({course_type: cds[:course_specifics][:class]})
				    end


				    # ADDRESS OBJECT
				    address = cds[:address]

				    # City Zip State
				    @state = State.find_by_name(address[:state])
				    @city = City.find_by_name(address[:city])
				    @zipcode = Zipcode.find_by_zipcode(address[:zipcode])

				   
				    # C/Z/S functions			
				    if @current_state != address[:state]
				    	# store
				    	@past_state = @current_state.dup
				    	@past_state_course_count = @state_courses

				    	# reset, initialize
				    	@state_courses = 0
				    	@current_state = address[:state]

				    	# log to CLI
				    	puts "Finished #{@past_state} in #{convert_time(@past_state_finish_time)}: #{@past_state_course_count} courses. Total: #{@total_courses}"
				    	@past_state_finish_time = Time.new
				    end

				    # Does City or Zipcode already exist?
				    if @city.nil?
				        @city = City.create({name: address[:city]})
				    end
				    
				    if @zipcode.nil?
				        @zipcode = Zipcode.create({zipcode: address[:zipcode]})
				    end


				    # Save Address
				    @address = Address.create({city_id: @city.id, state_id: @state.id, zipcode_id: @zipcode.id, 
				                                street: address[:street], latitude: address[:latitude], longitude: address[:longitude]})


				    # Save Seasonality
				    @season = Season.find_by_seasonality(cds[:course_specifics][:season])
				    if @season.nil?
				        @season = Season.create({seasonality: cds[:course_specifics][:season]})
				    end


				    # Save Fees
				    fees = cds[:fees]
				    @fees = Fee.create({weekday_18: fees[:weekday_18].to_f, weekday_9: fees[:weekday_9].to_f, weekend_18: fees[:weekend_18].to_f, weekend_9: fees[:weekend_9].to_f, twilight: fees[:twilight].to_f})


				    # Number of Holes
				    holes = cds[:course_specifics][:number_of_holes].split(" ")[0].to_i

				    # Save Course
				    @course = Course.create({address_id: @address.id, 
				    						 course_type_id: @course_type.id, 
				    						 season_id: @season.id, 
				    						 fee_id: @fees.id, 
				    						 name: cds[:name], 
				    						 website: cds[:website], 
				    						 phone_number: cds[:phone],
				    						 number_of_holes: holes,
				    						 city_id: @city.id,
				    						 state_id: @state.id,
				    						 zipcode_id: @zipcode.id})


				    # Slope and Ratings
				    ratings = cds[:rating]
				    slopes = cds[:slope]

				    # Save Men Slopes and Ratings
				    gender_men = Gender.find_by_gender_type("Male")
				    # Pro
				    if !ratings[:pro][:men].empty? or !slopes[:pro][:men].empty?
				    	tee = Tee.find_by_tee_type("Pro")
				        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_men.id, course_id: @course.id, slope: slopes[:pro][:men].to_i, rating: ratings[:pro][:men].to_f})
				    end

				    # Adv
				    if !ratings[:adv][:men].empty? or !slopes[:adv][:men].empty?
				    	tee = Tee.find_by_tee_type("Adv")
				        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_men.id, course_id: @course.id, slope: slopes[:adv][:men].to_i, rating: ratings[:adv][:men].to_f})
				    end

				    # Men's
				    if !ratings[:men][:men].empty? or !slopes[:men][:men].empty?
				        tee = Tee.find_by_tee_type("Men's")
				        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_men.id, course_id: @course.id, slope: slopes[:men][:men].to_i, rating: ratings[:men][:men].to_f})
				    end

				    # Snr
				    if !ratings[:snr][:men].empty? or !slopes[:snr][:men].empty?
				        tee = Tee.find_by_tee_type("Senior")
				        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_men.id, course_id: @course.id, slope: slopes[:snr][:men].to_i, rating: ratings[:snr][:men].to_f})
				    end

				    # Women's
				    if !ratings[:wmn][:men].empty? or !slopes[:wmn][:men].empty?
				        tee = Tee.find_by_tee_type("Women's")
				        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_men.id, course_id: @course.id, slope: slopes[:wmn][:men].to_i, rating: ratings[:wmn][:men].to_f})
				    end


				    # Save Women Slopes and Ratings
				    gender_women = Gender.find_by_gender_type("Female")
				    # Pro
				    if !ratings[:pro][:women].empty? or !slopes[:pro][:women].empty?
				        tee = Tee.find_by_tee_type("Pro")
				        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_women.id, course_id: @course.id, slope: slopes[:pro][:women].to_i, rating: ratings[:pro][:women].to_f})
				    end
				    # Adv
				    tee = Tee.find_by_tee_type("Adv")
				    if !ratings[:adv][:women].empty? or !slopes[:adv][:women].empty?
				        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_women.id, course_id: @course.id, slope: slopes[:adv][:women].to_i, rating: ratings[:adv][:women].to_f})
				    end
				    # Men's
				    if !ratings[:men][:women].empty? or !slopes[:men][:women].empty?
				        tee = Tee.find_by_tee_type("Men's")
				        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_women.id, course_id: @course.id, slope: slopes[:men][:women].to_i, rating: ratings[:men][:women].to_f})
				    end
				    # Snr
				    if !ratings[:snr][:women].empty? or !slopes[:snr][:women].empty?
				        tee = Tee.find_by_tee_type("Senior")
				        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_women.id, course_id: @course.id, slope: slopes[:snr][:women].to_i, rating: ratings[:snr][:women].to_f})
				    end
				    # Women's
				    if !ratings[:wmn][:women].empty? or !slopes[:wmn][:women].empty?
				        tee = Tee.find_by_tee_type("Women's")
				        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_women.id, course_id: @course.id, slope: slopes[:wmn][:women].to_i, rating: ratings[:wmn][:women].to_f})
				    end


				    # Holes
				    holes = cds[:holes]

				    # Save Pros Hole Distance
				    if holes[:pro].inject{|sum,x| sum + x} > 0
				        i = 1
				        tee = Tee.find_by_tee_type("Pro")
				        holes[:pro].each do |h|
				            @hole = Hole.create({course_id: @course.id, tee_id: tee.id, number: i, distance: h})
				            i += 1
				        end
				    end
				    # Adv Hole Distance
				    if holes[:adv].inject{|sum,x| sum + x} > 0
				        i = 1
				        tee = Tee.find_by_tee_type("Adv")
				        holes[:adv].each do |h|
				            @hole = Hole.create({course_id: @course.id, tee_id: tee.id, number: i, distance: h})
				            i += 1
				        end
				    end
				    # Men's Hole Distance
				    if holes[:men].inject{|sum,x| sum + x} > 0
				        i = 1
				        tee = Tee.find_by_tee_type("Men's")
				        holes[:men].each do |h|
				            @hole = Hole.create({course_id: @course.id, tee_id: tee.id, number: i, distance: h})
				            i += 1
				        end
				    end
				    # Snr Hole Distance
				    if holes[:snr].inject{|sum,x| sum + x} > 0
				        i = 1
				        tee = Tee.find_by_tee_type("Senior")
				        holes[:snr].each do |h|
				            @hole = Hole.create({course_id: @course.id, tee_id: tee.id, number: i, distance: h})
				            i += 1
				        end
				    end
				    # Women's Hole Distance
				    if holes[:wmn].inject{|sum,x| sum + x} > 0
				        i = 1
				        tee = Tee.find_by_tee_type("Women's")
				        holes[:wmn].each do |h|
				            @hole = Hole.create({course_id: @course.id, tee_id: tee.id, number: i, distance: h})
				            i += 1
				        end
				    end


				    # Men's Par
				    i = 1
				    holes[:mpar].each do |p|
				        @par = Par.create({course_id: @course.id, gender_id: gender_men.id, hole_number: i, par: p})
				        i += 1
				    end
				    # Women's Par
				    i = 1
				    holes[:wpar].each do |p|
				        @par = Par.create({course_id: @course.id, gender_id: gender_women.id, hole_number: i, par: p})
				        i += 1
				    end


				    # Men's Handicap
				    i = 1
				    holes[:mhdc].each do |h|
				        @handicap = Handicap.create({course_id: @course.id, gender_id: gender_men.id, hole_number: i, handicap: h})
				        i += 1
				    end
				    # Women's Handicap
				    i = 1
				    holes[:whdc].each do |h|
				        @handicap = Handicap.create({course_id: @course.id, gender_id: gender_women.id, hole_number: i, handicap: h})
				        i += 1
				    end

				    
				    if @total_courses % 500 == 0
				    	a = 500 + (500 * @counter)
				    	puts "#{a} courses complete.  Currently in #{@current_state}"
				    	@counter += 1
				    end
				    #puts "Saved course: #{name} located #{address[:city]}, #{address[:state]}"


				#### CATCH EXCEPTION
				rescue Exception => e 

					# Write to file 
					x = Time.new.to_s + "\t#{e},file:#{x}\tcourse_id:#{c[0]}\t#{cds[:name]}\n"
					File.open("./import_logs.txt", 'a') {|f| f.write(x) }

					# Wait 3 seconds
					sleep(3)

				end				    

			end # End of File

		end # End of Files Loop

		puts "\n\nFinished Importing Courses!  Whew!\n"
		puts "It took #{convert_time(t1)}\n\n"
		File.open("./import_logs.txt", 'a') {|f| f.write(Time.new.to_s + "\tFinished") }

	end


	### Just Washington Courses
	desc "imports just Washington courses data into database"


	task :select_wa_courses => :environment do

		@select_courses = ["Cascade-Gold Mountain Golf Course", "Olympic-Gold Mountain Golf Course", "McCormick Woods Golf Course", 
				   "Snoqualmie Falls Golf Course", "Nile Shrine Golf Course", "Interbay Golf Center", "Regulation-Jefferson Park Golf Club", 
				   "Regulation-Jackson Park Golf Course", "Coyote Creek-Willows Run Golf Club", "Eagles Talon-Willows Run Golf Club",
				   "Harbour Pointe Golf Club", "China Creek-Golf Club at Newcastle", "Coal Creek-Golf Club at Newcastle",
				   "Trophy Lake Golf & Casting Club", "White Horse Golf Club", "West Seattle Golf Course", "TPC at Snoqualmie Ridge",
				   "Legion Memorial Golf Course", "Par Three-Jackson Park Golf Course", "Overlake Golf & Country Club", 
				   "Mount Si Golf Course", "Kitsap Golf & Country Club", "Lake Chelan Golf Course", "Kayak Point Golf Course",
				   "Horseshoe Lake Golf Course", "Greenlake Golf Course", "Executive-Jefferson Park Golf Club", "Chambers Bay Golf Course",
				   "Broadmoor Golf Club", "Bellevue Golf Course", "Banks Lake Golf & Country Club", "Alderbrook Golf Club"]

		t1 = Time.new
		puts t1
		File.open("./import_wa_logs.txt", 'a') {|f| f.write(Time.new.to_s + "\tStarted\n") }

		# Tracker variables
	    @current_state = ''
		@current_state_course_count = 0
		@state_courses = 0
		@total_courses = 0
	    @past_state = ''
		@past_state_course_count = 0
		@past_state_finish_time = 0
		@counter = 0


		# Loop thru all 28 files
		(1..33).each do |x|

			fname = "courses_hash_#{x}.txt"
			f = File.open("./data/"+fname, "r")

			@courses_hash = Marshal.load f.read

			@courses_hash.each do |c|

				# Course Details
				cds = c[1]
				address = cds[:address]

				# WA course?
				if address[:state] == "Washington" and @select_courses.include?(cds[:name])

					# New Course
					@total_courses += 1
					@state_courses += 1

					#### TRY SAVING COURSE
					#### ELSE STORE COURSE_ID
					begin


					    #  Save Course Type
					    @course_type = CourseType.find_by_course_type(cds[:course_specifics][:class])
					    if @course_type.nil?
					        @course_type = CourseType.create({course_type: cds[:course_specifics][:class]})
					    end


					    # ADDRESS OBJECT
					    address = cds[:address]

					    # City Zip State
					    @state = State.find_by_name(address[:state])
					    @city = City.find_by_name(address[:city])
					    @zipcode = Zipcode.find_by_zipcode(address[:zipcode])

					   
					    # C/Z/S functions			
					    if @current_state != address[:state]
					    	# store
					    	@past_state = @current_state.dup
					    	@past_state_course_count = @state_courses

					    	# reset, initialize
					    	@state_courses = 0
					    	@current_state = address[:state]

					    	# log to CLI
					    	puts "Finished #{@past_state} in #{convert_time(@past_state_finish_time)}: #{@past_state_course_count} courses. Total: #{@total_courses}"
					    	@past_state_finish_time = Time.new
					    end

					    # Does City or Zipcode already exist?
					    if @city.nil?
					        @city = City.create({name: address[:city]})
					    end
					    
					    if @zipcode.nil?
					        @zipcode = Zipcode.create({zipcode: address[:zipcode]})
					    end


					    # Save Address
					    @address = Address.create({city_id: @city.id, state_id: @state.id, zipcode_id: @zipcode.id, 
					                                street: address[:street], latitude: address[:latitude], longitude: address[:longitude]})


					    # Save Seasonality
					    @season = Season.find_by_seasonality(cds[:course_specifics][:season])
					    if @season.nil?
					        @season = Season.create({seasonality: cds[:course_specifics][:season]})
					    end


					    # Save Fees
					    fees = cds[:fees]
					    @fees = Fee.create({weekday_18: fees[:weekday_18].to_f, weekday_9: fees[:weekday_9].to_f, weekend_18: fees[:weekend_18].to_f, weekend_9: fees[:weekend_9].to_f, twilight: fees[:twilight].to_f})


					    # Number of Holes
					    holes = cds[:course_specifics][:number_of_holes].split(" ")[0].to_i

					    # Save Course
					    @course = Course.create({address_id: @address.id, 
					    						 course_type_id: @course_type.id, 
					    						 season_id: @season.id, 
					    						 fee_id: @fees.id, 
					    						 name: cds[:name], 
					    						 website: cds[:website], 
					    						 phone_number: cds[:phone],
					    						 number_of_holes: holes,
					    						 city_id: @city.id,
					    						 state_id: @state.id,
					    						 zipcode_id: @zipcode.id})


					    # Slope and Ratings
					    ratings = cds[:rating]
					    slopes = cds[:slope]

					    # Save Men Slopes and Ratings
					    gender_men = Gender.find_by_gender_type("Male")
					    # Pro
					    if !ratings[:pro][:men].empty? or !slopes[:pro][:men].empty?
					    	tee = Tee.find_by_tee_type("Pro")
					        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_men.id, course_id: @course.id, slope: slopes[:pro][:men].to_i, rating: ratings[:pro][:men].to_f})
					    end

					    # Adv
					    if !ratings[:adv][:men].empty? or !slopes[:adv][:men].empty?
					    	tee = Tee.find_by_tee_type("Adv")
					        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_men.id, course_id: @course.id, slope: slopes[:adv][:men].to_i, rating: ratings[:adv][:men].to_f})
					    end

					    # Men's
					    if !ratings[:men][:men].empty? or !slopes[:men][:men].empty?
					        tee = Tee.find_by_tee_type("Men's")
					        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_men.id, course_id: @course.id, slope: slopes[:men][:men].to_i, rating: ratings[:men][:men].to_f})
					    end

					    # Snr
					    if !ratings[:snr][:men].empty? or !slopes[:snr][:men].empty?
					        tee = Tee.find_by_tee_type("Senior")
					        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_men.id, course_id: @course.id, slope: slopes[:snr][:men].to_i, rating: ratings[:snr][:men].to_f})
					    end

					    # Women's
					    if !ratings[:wmn][:men].empty? or !slopes[:wmn][:men].empty?
					        tee = Tee.find_by_tee_type("Women's")
					        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_men.id, course_id: @course.id, slope: slopes[:wmn][:men].to_i, rating: ratings[:wmn][:men].to_f})
					    end


					    # Save Women Slopes and Ratings
					    gender_women = Gender.find_by_gender_type("Female")
					    # Pro
					    if !ratings[:pro][:women].empty? or !slopes[:pro][:women].empty?
					        tee = Tee.find_by_tee_type("Pro")
					        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_women.id, course_id: @course.id, slope: slopes[:pro][:women].to_i, rating: ratings[:pro][:women].to_f})
					    end
					    # Adv
					    tee = Tee.find_by_tee_type("Adv")
					    if !ratings[:adv][:women].empty? or !slopes[:adv][:women].empty?
					        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_women.id, course_id: @course.id, slope: slopes[:adv][:women].to_i, rating: ratings[:adv][:women].to_f})
					    end
					    # Men's
					    if !ratings[:men][:women].empty? or !slopes[:men][:women].empty?
					        tee = Tee.find_by_tee_type("Men's")
					        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_women.id, course_id: @course.id, slope: slopes[:men][:women].to_i, rating: ratings[:men][:women].to_f})
					    end
					    # Snr
					    if !ratings[:snr][:women].empty? or !slopes[:snr][:women].empty?
					        tee = Tee.find_by_tee_type("Senior")
					        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_women.id, course_id: @course.id, slope: slopes[:snr][:women].to_i, rating: ratings[:snr][:women].to_f})
					    end
					    # Women's
					    if !ratings[:wmn][:women].empty? or !slopes[:wmn][:women].empty?
					        tee = Tee.find_by_tee_type("Women's")
					        @slope_rating = SlopeRating.create({tee_id: tee.id, gender_id: gender_women.id, course_id: @course.id, slope: slopes[:wmn][:women].to_i, rating: ratings[:wmn][:women].to_f})
					    end


					    # Holes
					    holes = cds[:holes]

					    # Save Pros Hole Distance
					    if holes[:pro].inject{|sum,x| sum + x} > 0
					        i = 1
					        tee = Tee.find_by_tee_type("Pro")
					        holes[:pro].each do |h|
					            @hole = Hole.create({course_id: @course.id, tee_id: tee.id, number: i, distance: h})
					            i += 1
					        end
					    end
					    # Adv Hole Distance
					    if holes[:adv].inject{|sum,x| sum + x} > 0
					        i = 1
					        tee = Tee.find_by_tee_type("Adv")
					        holes[:adv].each do |h|
					            @hole = Hole.create({course_id: @course.id, tee_id: tee.id, number: i, distance: h})
					            i += 1
					        end
					    end
					    # Men's Hole Distance
					    if holes[:men].inject{|sum,x| sum + x} > 0
					        i = 1
					        tee = Tee.find_by_tee_type("Men's")
					        holes[:men].each do |h|
					            @hole = Hole.create({course_id: @course.id, tee_id: tee.id, number: i, distance: h})
					            i += 1
					        end
					    end
					    # Snr Hole Distance
					    if holes[:snr].inject{|sum,x| sum + x} > 0
					        i = 1
					        tee = Tee.find_by_tee_type("Senior")
					        holes[:snr].each do |h|
					            @hole = Hole.create({course_id: @course.id, tee_id: tee.id, number: i, distance: h})
					            i += 1
					        end
					    end
					    # Women's Hole Distance
					    if holes[:wmn].inject{|sum,x| sum + x} > 0
					        i = 1
					        tee = Tee.find_by_tee_type("Women's")
					        holes[:wmn].each do |h|
					            @hole = Hole.create({course_id: @course.id, tee_id: tee.id, number: i, distance: h})
					            i += 1
					        end
					    end


					    # Men's Par
					    i = 1
					    holes[:mpar].each do |p|
					        @par = Par.create({course_id: @course.id, gender_id: gender_men.id, hole_number: i, par: p})
					        i += 1
					    end
					    # Women's Par
					    i = 1
					    holes[:wpar].each do |p|
					        @par = Par.create({course_id: @course.id, gender_id: gender_women.id, hole_number: i, par: p})
					        i += 1
					    end


					    # Men's Handicap
					    i = 1
					    holes[:mhdc].each do |h|
					        @handicap = Handicap.create({course_id: @course.id, gender_id: gender_men.id, hole_number: i, handicap: h})
					        i += 1
					    end
					    # Women's Handicap
					    i = 1
					    holes[:whdc].each do |h|
					        @handicap = Handicap.create({course_id: @course.id, gender_id: gender_women.id, hole_number: i, handicap: h})
					        i += 1
					    end

					    
					    if @total_courses % 500 == 0
					    	a = 500 + (500 * @counter)
					    	puts "#{a} courses complete.  Currently in #{@current_state}"
					    	@counter += 1
					    end
					    #puts "Saved course: #{name} located #{address[:city]}, #{address[:state]}"


					#### CATCH EXCEPTION
					rescue Exception => e 

						# Write to file 
						x = Time.new.to_s + "\t#{e},file:#{x}\tcourse_id:#{c[0]}\t#{cds[:name]}\n"
						File.open("./import_logs.txt", 'a') {|f| f.write(x) }

						# Wait 3 seconds
						sleep(3)

					end


				else
					# Not WA course, move on to next
					break
				end				    

			end # End of File

		end # End of Files Loop

		puts "\n\nFinished Importing Courses!  Whew!\n"
		puts "It took #{convert_time(t1)}\n\n"
		File.open("./import_wa_logs.txt", 'a') {|f| f.write(Time.new.to_s + "\tFinished") }

	end


end


# $ bundle exec rake import:states
# $ bundle exec rake import:genders
# $ bundle exec rake import:fairways
# $ bundle exec rake import:tees
# $ bundle exec rake import:courses