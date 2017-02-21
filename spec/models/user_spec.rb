require 'rails_helper'

RSpec.describe User, type: :model do

  context "validations" do

    it "should have email and encrypted_password" do
      should have_db_column(:email).of_type(:string)
      should have_db_column(:encrypted_password).of_type(:string)
    end

    describe "validates presence and uniqueness of email" do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_uniqueness_of(:email) }
    end

    describe "validates password" do
      it { is_expected.to validate_presence_of(:password) }
      it { is_expected.to validate_presence_of(:encrypted_password) }
    end

    describe "can be created when all attributes are present" do
      When(:user) { User.create(
        email: "test@nextacademy.com",
        password: "123456"
      )}
      Then { user.valid? == true }
    end

    describe "cannot be created without email" do
      When(:user) { User.create(password: "123456")}
      Then { user.valid? == false }
    end


    describe "cannot be created without password" do
      When(:user) { User.create(email: "test@nextacademy.com")}
      Then { user.valid? == false }
    end

    describe "should permit valid email only" do
      let(:user1) { User.create(email: "someone@nextacademy.com", password: "123456")}
      let(:user2) { User.create(email: "invalid.email.com", password: "123456")}

      it "sign up with valid email" do
        expect(user1).to be_valid
      end

      it "sign up with invalid email" do
        expect(user2).to be_invalid
      end
    end
  end

  context 'associations with dependency' do
    it { is_expected.to have_many(:events).dependent(:destroy)}
  end

end