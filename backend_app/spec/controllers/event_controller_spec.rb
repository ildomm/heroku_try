# file: spec/controllers/event_controller_spec.rb
require 'rails_helper'

RSpec.describe EventController, type: :controller do

  let(:time_a) {Time.now.strftime("%Y-%m-%d %H:%M")}
  let(:time_b) { ( Time.now + 1.second ).strftime("%Y-%m-%d %H:%M")}
  let(:uuid_main) {"f835d7d5-fba4-3c97-55af-6c987f94512f"}

  describe "GET #create" do
    it "add new event and have SUCCESS" do
      expect {
        get :create, { event: { uuid: uuid_main,
                                url: "would.com/home",
                                client_created_at: time_a,
                                server_created_at: time_b }}, { format: :json }
      }.to change(Event, :count).by(1)
      expect(response.status).to eq(204)
    end

    it "add new event corrupted and have FAIL" do
      expect {
        get :create, { event: { uuid: uuid_main }}, { format: :json }
      }.to change(Event, :count).by(0)
      expect(response.status).to eq(204)
    end
  end

end