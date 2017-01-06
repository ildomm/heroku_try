class EventController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    EventPersisterJob.perform_later(event_params)
    head :no_content
  end

  private

  def event_params
    data = params.require(:event).permit(:uuid, :url, :client_created_at)
    data[:server_created_at] = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    data
  end
end
