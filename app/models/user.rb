class User < ActiveRecord::Base
  include Clearance::User

  validates :email, uniqueness: true, presence: true
  validates :encrypted_password, presence: true
  has_many :events, dependent: :destroy

end
