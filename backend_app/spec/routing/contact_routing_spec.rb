# file: spec/routing/contact_routing_spec.rb
require 'rails_helper'

RSpec.describe ContactController, type: :routing do
  it { expect(get:    "/contact").to      route_to("contact#index") }
  it { expect(get:    "/contact/index").to      route_to("contact#index") }
  it { expect(post:   "/contact").to      route_to("contact#create") }
end
