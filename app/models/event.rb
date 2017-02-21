class Event < ActiveRecord::Base

  extend FriendlyId
  friendly_id :passphrase

  validates :name, :typeform_url, :typeform_report_url, presence: true
  validates :passphrase, uniqueness: true

  validates_format_of :typeform_url, :with => /\Ahttp.+typeform.com\/to.+/
  validates_format_of :typeform_report_url, :with => /\Ahttp.+typeform.com\/report.+/

  before_validation(on: :create) do
    self.passphrase = SecureRandom.hex(3)
  end

  has_many :projects
  has_many :questions

  belongs_to :user

end
