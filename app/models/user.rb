class User < ActiveRecord::Base
  include Clearance::User
  attr_accessor :password_confirmation

  validate :password_confirmation_does_not_match
  
  has_many :events, dependent: :destroy

  def password_confirmation_does_not_match
    if @password != @password_confirmation
      errors.add(:password_confirmation, "Passwords do not match")
    end
  end
end
