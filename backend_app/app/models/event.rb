class Event < ActiveRecord::Base
  validates_presence_of :uuid
  validates_presence_of :url
  validates_presence_of :client_created_at
  validates_presence_of :server_created_at

  has_many :contacts, foreign_key: :uuid, primary_key: :uuid
end
