# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  subject(:it_admin) { build :user_profile }

  context 'create a use profile' do
    describe 'valid data' do
      it 'should be success' do
        it_admin.valid?
        expect(it_admin).to be_valid
      end
    end
  end
end
