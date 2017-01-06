class Contact < ActiveRecord::Base
  validates_presence_of :email
  validates_presence_of :uuid
  validates :email, uniqueness: { scope: :uuid }
end
