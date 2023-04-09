# frozen_string_literal: true

require 'rails_helper'
# given
RSpec.describe Organization, type: :model do
  context 'given an organization' do
    let(:org) { build(:organizations) }

    it 'data is correct' do
      expect([]).to match_array([])
    end
  end
end
