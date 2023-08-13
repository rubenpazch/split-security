# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorkGroup, type: :model do
  subject(:profile) { build :work_group }

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'associations' do
    it { should have_many(:users).dependent(:destroy) }
  end
end
