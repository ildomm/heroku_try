# file: spec/controllers/contact_controller_spec.rb
require 'rails_helper'

RSpec.describe ContactController, type: :controller do

  let(:time_a) {Time.now.strftime("%Y-%m-%d %H:%M")}
  let(:time_b) { ( Time.now + 1.second ).strftime("%Y-%m-%d %H:%M")}
  let(:uuid_main) {"f835d7d5-fba4-3c97-55af-6c987f94512f"}

  let(:valid_event_attributes) {
    [ { uuid: uuid_main,
        url: "would.com/home",
        client_created_at: time_a,
        server_created_at: time_b },
      { uuid: uuid_main,
        url: "would.com/bba",
        client_created_at: time_a,
        server_created_at: time_b },
      { uuid: uuid_main,
        url: "would.com/contact",
        client_created_at: time_a,
        server_created_at: time_b }
    ]
  }

  let!(:events) { Event.create(valid_event_attributes ) }

  before do
    contact = Contact.create(email: "texte@would.com",
                             uuid: uuid_main)
  end

  describe "GET #create" do
    it "add new contact and have SUCCESS" do
      expect {
        get :create, { contact: { email: "texte@teste.com", uuid: "12345x" }}, { format: :json }
      }.to change(Contact, :count).by(1)
      expect(response.status).to eq(204)
    end

    it "add new contact repeated and have FAIL" do
      expect {
        get :create, { contact: { email: "texte@would.com", uuid: uuid_main }}, { format: :json }
      }.to change(Contact, :count).by(0)
      expect(response.status).to eq(204)
    end

    it "add new contact corrupted and have FAIL" do
      expect {
        get :create, { contact: { email: "texte@teste.com" }}, { format: :json }
      }.to change(Contact, :count).by(0)
      expect(response.status).to eq(204)
    end
  end

  describe "GET #index" do
    render_views
    it "access contact/event list and have SUCCESS" do
      get :index
      expect(assigns(:events)).to eq(events)
      expect(response.status).to eq(200)
      expect(response.body).to include( "texte@would.com" )
    end
  end
end
