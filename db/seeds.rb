require 'faker'

liren = User.new(
	email: "liren@nextacademy.com",
	password: "1234",
	password_confirmation: "1234"
	)

liren.save

admin = User.new(
	email: "admin@nextacademy.com",
	password: "1234",
	password_confirmation: "1234"
	)

admin.save

10.times do

	params = {:event => {} }

	month = ['Jan', 'Feb', 'Apr', 'Nov', 'Aug', 'Nov'].sample
	year = ['16', '17', '15'].sample
	camp = ['iOS', 'WebDev', 'Marketing'].sample
	theme = ['Lifestyle', 'Business', 'Finance', 'Sports', 'Travel'].sample

	params[:event][:name] = "#{month} '#{year} #{camp} Pitch"
	params[:event][:description] = "Theme is #{theme}, with #{rand(4..9)} participating projects"
	params[:event][:date] = Faker::Time.between(DateTime.now, DateTime.now + 60)
	params[:event][:user_id] = rand(1..2)
	params[:event][:typeform_url] = 'https://nextacademy.typeform.com/to/PaxmZ6'
	params[:event][:typeform_report_url] = 'https://nextacademy.typeform.com/report/PaxmZ6/XUVT'

	Event.create(params[:event])

end