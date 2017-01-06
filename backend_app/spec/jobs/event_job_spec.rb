# file: spec/routing/event_job_spec.rb
require 'rails_helper'

describe EventPersisterJob do
  it { is_expected.to be_processed_in :default }

  it 'Enqueues job' do
    ActiveJob::Base.queue_adapter = :test
    expect {
      EventPersisterJob.perform_later
    }.to have_enqueued_job(EventPersisterJob)
    expect {
      EventPersisterJob.perform_later
    }.to have_enqueued_job.on_queue("default")
  end

end