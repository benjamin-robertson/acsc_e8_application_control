# frozen_string_literal: true

require 'spec_helper'
require 'puppet/type/applocker_enforcement'

RSpec.describe 'the applocker_enforcement type' do
  it 'loads' do
    expect(Puppet::Type.type(:applocker_enforcement)).not_to be_nil
  end
end
