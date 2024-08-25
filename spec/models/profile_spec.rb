# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  subject(:profile) { build :profile }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end

  describe 'on create and first' do
    let(:profile_with_empty_title) { build :profile_with_empty_title }

    context 'when it is invalid' do
      it "can't be blank" do
        profile_with_empty_title.save
        expect(profile_with_empty_title.errors.messages[:title]).to eq ["can't be blank"]
      end
    end
  end

  describe 'rte' do
    let(:valid_profile) { build :profile }
    let(:root_profile) { build :is_root_profile }
    let(:is_active_profile) { build :is_active_profile }

    context 'when it is valid' do
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
  end

  describe 'xyz' do
    let(:valid_profile) { build :profile }
    let(:root_profile) { build :is_root_profile }
    let(:is_active_profile) { build :is_active_profile }

    context 'when it is validd' do
      it 'and it is validd' do
        valid_profile.save
        expect(valid_profile).to be_valid
      end

      it 'and it is activee' do
        is_active_profile.save
        expect(is_active_profile).to be_active
      end

      it 'and it is roott' do
        root_profile.save
        expect(root_profile.is_root?).to be true
      end
    end
  end

  describe '#create' do
    context 'when root is nil' do
      it 'is valid child profile' do
        valid_child_profile.save
        expect(valid_child_profile).to be_valid
      end
    end
  end
end
