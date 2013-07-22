namespace :import do
	
	desc "imports data into database"

	task :states => :environment do

		states = [["Alabama", "AL"],["Alaska", "AK"],["Arizona", "AZ"],["Arkansas", "AR"],["California", "CA"],["Colorado", "CO"],["Connecticut", "CT"],["Delaware", "DE"],["Florida", "FL"],["Georgia", "GA"],["Hawaii", "HI"],["Idaho", "ID"],["Illinois", "IL"],["Indiana", "IN"],["Iowa", "IA"],["Kansas", "KS"],["Kentucky", "KY"],["Louisiana", "LA"],["Maine", "ME"],["Maryland", "MD"],["Massachusetts", "MA"],["Michigan", "MI"],["Minnesota", "MN"],["Mississippi", "MS"],["Missouri", "MO"],["Montana", "MT"],["Nebraska", "NE"],["Nevada", "NV"],["New Hampshire", "NH"],["New Jersey", "NJ"],["New Mexico", "NM"],["New York", "NY"],["North Carolina", "NC"],["North Dakota", "ND"],["Ohio", "OH"],["Oklahoma", "OK"],["Oregon", "OR"],["Pennsylvania", "PA"],["Rhode Island", "RI"],["South Carolina", "SC"],["South Dakota", "SD"],["Tennessee", "TN"],["Texas", "TX"],["Utah", "UT"],["Vermont", "VT"],["Virginia", "VA"],["Washington", "WA"],["West Virginia", "WV"],["Wisconsin", "WI"],["Wyoming", "WY"]]

		puts "Importing US States..."

		states.each do |state|
			@state = State.create(name: state[0], abbreviation: state[1])
			puts "Added #{state[0]}"
			sleep 0.4
		end

		puts "Import complete.\n"
		## To run
		## $ bundle exec rake import:states
	end


	task :genders => :environment do
		
		genders = ["Male", "Female"]

		puts "Importing genders..."

		genders.each do |gender|
			@gender = Gender.create({gender_type: gender})
			puts "Added #{gender}"
			sleep 1
		end

		puts "Import complete.\n"
	end

	task :fairways => :environment do 

		fairways = ["Long Middle", "Middle", "Short Middle", "Long Right", "Right", "Short Right", "Long Far Right", "Far Right", "Short Far Right", "Long Left", "Left", "Short Left", "Long Far Left", "Far Left", "Short Far Left"]

		puts "Importing Fairway locations for a drive off the tee..."

		fairways.each do |f|
			@fairway = Fairway.create({fairway_accuracy: f})
			puts "Added #{f}"
			sleep 1
		end

		puts "Import complete.\n"		

	end

	task :tees => :environment do 

		tees = [["Pro", "Gold"], ["Adv", "Blue"], ["Men's", "White"], ["Senior", "Yellow"], ["Women's", "Red"]]

		puts "Importing tee types..."

		tees.each do |t|
			@tee = Tee.create({tee_type: t[0], color: t[1]})
			puts "Added #{t[0]} tees"
			sleep 1
		end

		puts "Import complete.\n"

	end

	task :courses => :environment do 

		fname = "courses_hash_1.txt"
		f = File.open("./data/"+fname, "r")

		@courses_hash = Marshal.load f.read

		@courses_hash.each do |c|

		    # Course Details
		    cds = c[1]

		    #  Save Course Type
		    @course_type = CourseType.find_by_course_type(cds[:course_specifics][:class])
		    if @course_type.nil?
		        @course_type = CourseType.create({course_type: cds[:course_specifics][:class]})
		    end

		    # City Zip State
		    address = cds[:address]
		    @state = State.find_by_name(address[:state])
		    @city = City.find_by_name(address[:city])
		    if @city.nil?
		        @city = City.create({name: address[:city]})
		    end
		    @zipcode = Zipcode.find_by_zipcode(address[:zipcode])
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

		    # Name
		    name = cds[:name]

		    # Website
		    website = cds[:website]

		    # Phone NUmber
		    phone_number = cds[:phone]

		    # Save Course
		    @course = Course.create({address_id: @address.id, course_type_id: @course_type.id, season_id: @season.id, fee_id: @fees.id, name: name, website: website, phone_number: phone_number ,number_of_holes: holes})

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
		        @slope_rating = SlopeRating.create({tee_id: pro_men_tee.id, gender_id: gender_women.id, course_id: @course.id, slope: slopes[:men][:women].to_i, rating: ratings[:men][:women].to_f})
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




		    puts "Saved course: #{name} in #{address[:city]}, #{address[:state]}"

		    break

		end


	end

end