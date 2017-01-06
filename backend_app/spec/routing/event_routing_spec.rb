# file: spec/routing/event_routing_spec.rb
require 'rails_helper'

RSpec.describe EventController, type: :routing do
  it { expect(post:    "/event").to      route_to("event#create") }
end