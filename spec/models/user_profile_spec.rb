# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  subject(:user_with_root_profile) { build :user_profile }

  let(:it_admin) { build :user_profile }

  context 'when create a use profile' do
    describe 'valid data' do
      it 'is success' do
        it_admin.valid?
        expect(it_admin).to be_valid
      end
    end

    describe 'when user with root profile' do
      it 'is valid' do
        user_with_root_profile.valid?
        expect(user_with_root_profile).to be_valid
      end
    end
  end
end
