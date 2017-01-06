class EventPersisterJob < ActiveJob::Base
  queue_as :default

  def perform(event_params)
    Event.create(event_params)
  end
end
