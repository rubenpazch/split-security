# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  subject(:it_admin) { build :user_profile }
  subject(:user_with_root_profile) { build :user_profile }

  context 'create a use profile' do
    describe 'valid data' do
      it 'should be success' do
        it_admin.valid?
        expect(it_admin).to be_valid
      end
    end

    describe 'user with root profile' do
      it 'should be valid' do
        user_with_root_profile.valid?
        expect(user_with_root_profile).to be_valid
      end
    end
  end
end
