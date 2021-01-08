require 'rails_helper'

describe 'flight service' do
  it 'will return flight data' do
    stub_request(:get, ENV[])
  end
end
