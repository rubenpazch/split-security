# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  subject(:profile) { build :profile }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end

  describe 'on create' do
    let(:profile_with_empty_title) { build :profile_with_empty_title }
    let(:valid_profile) { build :profile }
    let(:root_profile) { build :is_root_profile }
    let(:root_profile_with_parent_id) { build :root_profile_with_parent_id }
    let(:root_profile_without_parent_id) { build :root_profile_without_parent_id }
    let(:valid_child_profile) { build :valid_child_profile }
    let(:is_active_profile) { build :is_active_profile }

    describe 'when it is valid' do
      it 'and it is valid' do
        valid_profile.save
        expect(valid_profile).to be_valid
      end

      it 'and it is active' do
        is_active_profile.save
        expect(is_active_profile).to be_active
      end

      it 'and it is root' do
        root_profile.save
        expect(root_profile.is_root?).to be true
      end
    end

    describe 'when it is invalid' do
      it "can't be blank" do
        profile_with_empty_title.save
        expect(profile_with_empty_title.errors.messages[:title]).to eq ["can't be blank"]
      end
    end

    describe 'given root profile' do
      context 'and parent id is nil' do
        it 'is valid' do
          root_profile_without_parent_id.save
          expect(root_profile_without_parent_id).to be_valid
        end
      end

      context 'and parent id is present' do
        it 'is invalid' do
          root_profile_with_parent_id.save
          expect(root_profile_with_parent_id).to be_invalid
        end

        it 'display error message' do
          root_profile_with_parent_id.save
          root_profile_with_parent_id.valid?
          error_message = root_profile_with_parent_id.errors.messages[:is_root][0]
          expect(error_message).to eq "can't have parent_id if root profile"
        end
      end
    end

    describe 'given child profile' do
      context 'and root is nil' do
        it 'is valid child profile' do
          valid_child_profile.save
          expect(valid_child_profile).to be_valid
        end
      end
    end
  end
end
