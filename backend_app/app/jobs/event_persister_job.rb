class EventPersisterJob < ActiveJob::Base
  queue_as :default

  def perform(event_params)
    #puts "EventPersisterJob running | #{event_params.inspect}"
    Event.create(event_params)
  end

end
