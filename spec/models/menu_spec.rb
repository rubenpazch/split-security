# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menu, type: :model do
  subject(:menu) { build :menu }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(3) }
    it { should validate_uniqueness_of(:title).case_insensitive }

    it { should validate_presence_of(:link_to) }
    it { should validate_length_of(:link_to).is_at_least(3) }
  end

  describe 'associations' do
    it { should belongs_to(:users).dependent(:destroy) }
  end
end
