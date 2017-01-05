class ContactPersisterJob < ActiveJob::Base
  queue_as :default

  def perform(contact_params)
    #puts "ContactPersisterJob running | #{contact_params.inspect}"
    Contact.create(contact_params)
  end

end
