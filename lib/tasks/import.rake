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

		puts "Import complete."
		## To run
		## $ bundle exec rake import:states
	end


	task :genders => :environment do
		genders = [["Male", "Female"]]
	end

end