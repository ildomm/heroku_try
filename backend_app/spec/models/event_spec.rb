# file: spec/models/event_spec.rb
require 'rails_helper'

RSpec.describe Event, type: :model do

  describe "db structure" do
    it { is_expected.to have_db_column(:uuid).of_type(:string) }
    it { is_expected.to have_db_column(:url).of_type(:string) }
    it { is_expected.to have_db_column(:client_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:server_created_at).of_type(:datetime) }

    it { is_expected.to have_db_index(:uuid) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:uuid) }
    it "is not valid without a title" do
      ev = Event.new(uuid: nil)
      expect(ev).to_not be_valid
    end
  end

  describe "associations" do
    it { is_expected.to have_many(:contacts) }
  end


end