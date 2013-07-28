
# Import States
states = [["Alabama", "AL"],["Alaska", "AK"],["Arizona", "AZ"],["Arkansas", "AR"],["California", "CA"],["Colorado", "CO"],["Connecticut", "CT"],["Delaware", "DE"],["Florida", "FL"],["Georgia", "GA"],["Hawaii", "HI"],["Idaho", "ID"],["Illinois", "IL"],["Indiana", "IN"],["Iowa", "IA"],["Kansas", "KS"],["Kentucky", "KY"],["Louisiana", "LA"],["Maine", "ME"],["Maryland", "MD"],["Massachusetts", "MA"],["Michigan", "MI"],["Minnesota", "MN"],["Mississippi", "MS"],["Missouri", "MO"],["Montana", "MT"],["Nebraska", "NE"],["Nevada", "NV"],["New Hampshire", "NH"],["New Jersey", "NJ"],["New Mexico", "NM"],["New York", "NY"],["North Carolina", "NC"],["North Dakota", "ND"],["Ohio", "OH"],["Oklahoma", "OK"],["Oregon", "OR"],["Pennsylvania", "PA"],["Rhode Island", "RI"],["South Carolina", "SC"],["South Dakota", "SD"],["Tennessee", "TN"],["Texas", "TX"],["Utah", "UT"],["Vermont", "VT"],["Virginia", "VA"],["Washington", "WA"],["West Virginia", "WV"],["Wisconsin", "WI"],["Wyoming", "WY"]]

puts "\nImporting US States..."

states.each do |state|
	@state = State.create(name: state[0], abbreviation: state[1])
	puts "Added #{state[0]}"
	#sleep 0.4
end


# Import Genders
genders = ["Male", "Female"]

puts "Importing genders..."

genders.each do |gender|
	@gender = Gender.create({gender_type: gender})
	puts "Added #{gender}"
	#sleep 1
end

# Import Fairways
fairways = ["Long Middle", "Middle", "Short Middle", "Long Right", "Right", "Short Right", "Long Far Right", "Far Right", "Short Far Right", "Long Left", "Left", "Short Left", "Long Far Left", "Far Left", "Short Far Left"]

puts "Importing Fairway locations for a drive off the tee..."

fairways.each do |f|
	@fairway = Fairway.create({fairway_accuracy: f})
	puts "Added #{f}"
	#sleep 1
end


# Import Tees
tees = [["Pro", "Gold"], ["Adv", "Blue"], ["Men's", "White"], ["Senior", "Yellow"], ["Women's", "Red"]]

puts "Importing tee types..."

tees.each do |t|
	@tee = Tee.create({tee_type: t[0], color: t[1]})
	puts "Added #{t[0]} tees"
	#sleep 1
end



# $ bundle exec rake db:seed