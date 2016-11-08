require "rails_helper"

describe "user visits homepage" do
	it "successfully" do
		visit root_path
		expect(page).to have_content 'Passphrase'
	end
end
