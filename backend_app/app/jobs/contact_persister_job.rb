class ContactPersisterJob < ActiveJob::Base
  queue_as :default

  def perform(contact_params)
    Contact.create(contact_params)
  end
end
