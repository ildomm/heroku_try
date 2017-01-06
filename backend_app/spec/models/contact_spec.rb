# file: spec/models/contact_spec.rb
require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe "db structure" do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:uuid).of_type(:string) }

    it { is_expected.to have_db_index([:uuid, :email]) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it "is not valid without a email" do
      comm = Contact.new(email: nil)
      expect(comm).to_not be_valid
    end
  end

end