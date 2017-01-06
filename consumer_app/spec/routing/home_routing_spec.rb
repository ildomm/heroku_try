# file: spec/routing/home_routing_spec.rb
require 'rails_helper'

RSpec.describe HomeController, type: :routing do
  it { expect(get:    "/home/index").to      route_to("home#index") }
  it { expect(get:    "/home/about").to      route_to("home#about") }
  it { expect(get:    "/home/contact").to    route_to("home#contact") }
end
