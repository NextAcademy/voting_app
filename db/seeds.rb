require 'faker'


10.times do

	params = {:event => {} }

	month = ['Jan', 'Feb', 'Apr', 'Nov', 'Aug', 'Nov'].sample
	year = ['16', '17', '15'].sample
	camp = ['iOS', 'WebDev', 'Marketing'].sample
	theme = ['Lifestyle', 'Business', 'Finance', 'Sports', 'Travel'].sample

	params[:event][:name] = "#{month} '#{year} #{camp} Pitch"
	params[:event][:description] = "Theme is #{theme}, with #{rand(4..9)} participating projects"
	params[:event][:date] = Faker::Time.between(DateTime.now, DateTime.now + 60)
	params[:event][:start_time] = Faker::Time.between(DateTime.now, DateTime.now + 30)
	params[:event][:end_time] = Faker::Time.between(DateTime.now, DateTime.now + 30)
	params[:event][:user_id] =  1

	Event.create(params[:event])

end