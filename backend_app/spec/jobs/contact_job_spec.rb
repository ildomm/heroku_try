# file: spec/routing/contact_job_spec.rb
require 'rails_helper'

describe ContactPersisterJob do
  it { is_expected.to be_processed_in :default }

  it 'Enqueues job' do
    ActiveJob::Base.queue_adapter = :test
    expect {
      ContactPersisterJob.perform_later
    }.to have_enqueued_job(ContactPersisterJob)
    expect {
      ContactPersisterJob.perform_later
    }.to have_enqueued_job.on_queue("default")
  end

end