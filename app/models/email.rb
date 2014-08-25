class Email < ActiveRecord::Base
  belongs_to :contact

  validates :address, :presence => true
  validates :contact_id, :presence => true
end
