require 'rails_helper'

RSpec.describe Event, type: :model do
	
	context "validations" do

		it "should have name, date, start/end time, desc and passphrase" do
			should have_db_column(:name).of_type(:string)
			should have_db_column(:description).of_type(:string)
			should have_db_column(:date).of_type(:date)
			should have_db_column(:start_time).of_type(:time)
			should have_db_column(:end_time).of_type(:time)
			should have_db_column(:passphrase).of_type(:string)
		end

		describe "verifies that passphrase is generated when created" do
      When(:event) { Event.create(
      	name: 'EventName',
      	date: Date.today,
      	start_time: Time.now,
      	end_time: Time.now + 1
    	)}
      Then { event.passphrase.nil? == false }
		end

		describe "validates presence of name, date and times" do
			it { is_expected.to validate_presence_of(:name) }
			it { is_expected.to validate_presence_of(:date) }
			it { is_expected.to validate_presence_of(:start_time) }
			it { is_expected.to validate_presence_of(:end_time) }
		end

	end

  context 'associations with dependency' do
    it { is_expected.to belong_to(:user) }
  end

end
