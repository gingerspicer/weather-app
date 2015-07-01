require 'yahoo_weatherman'

def get_location(zipcode)
client = Weatherman::Client.new
client.lookup_by_location(zipcode)
end

#get location from user by zipcode
puts "To see the weather forecast, please enter your zipcode: "
zipcode = gets.chomp

#sets zipcode from user to the weather variable
weather = get_location(zipcode)

weather.forecasts.each do |i|
	weekday = i['date']
	weekday = weekday.strftime('%w')
	now = Date.today.strftime("%w")
	now = now.to_i
	tomorrow = now + 1
	low = i['low'].to_i
	flow = (low * 1.8 + 32).to_i
	high = i['high'].to_i
	fhigh = (high * 1.8 +32).to_i
	
	
	if(weekday == now.to_s)
		puts "Today is going to be " + i['text'].downcase + " with a low of #{flow} and a high of #{fhigh} "  
	
	elsif(weekday == tomorrow.to_s) 
		puts 'Tomorrow is going to be ' + i['text'].downcase + " with a low of #{flow} and a high of #{fhigh} "
	elsif
		puts i['day'].to_s + ' is going to be ' + i['text'].downcase + " with a low of #{flow} and a high of #{fhigh} "
	end
end

