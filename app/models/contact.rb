class Contact <ActiveRecord::Base
  has_many :phones
  has_many :emails
  validates :name, :presence => true
end
