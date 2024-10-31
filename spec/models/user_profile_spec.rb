# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserProfile do
  subject(:basic_user_profile) { create(:user_profile) }

  describe 'given a profile' do
    context 'when user is valid' do
      it 'accesses profile title from user' do
        basic_user_profile.valid?
        basic_user_profile.save!
        expect(User.last.profiles.first.title).to eq 'default'
      end

      it 'accesses user nane from profile' do
        basic_user_profile.valid?
        basic_user_profile.save!
        expect(Profile.last.users.first.name).to eq 'pedro'
      end
    end

    context 'when profile has many users' do
      let!(:user_one) { create(:valid_user) }
      let!(:user_two) { create(:valid_user) }
      let!(:profile) { create(:profile) }

      before do
        described_class.create!(user_id: user_one.id, profile_id: profile.id)
        described_class.create!(user_id: user_two.id, profile_id: profile.id)
      end

      it 'count two users' do
        expect(described_class.count).to eq 2
      end

      it 'prints two users for profile' do
        expect(profile.users.count).to eq 2
      end

      it 'prints a profile for user' do
        expect(user_one.profiles[0]).to eq profile
      end
    end
  end
end

# admin
# it_support
# carlos
# pedro
# it_admin
# support
# it_support
# it_helpdesk
# visitor
# basic_user
