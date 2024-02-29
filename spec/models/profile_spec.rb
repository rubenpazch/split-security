# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  subject(:profile) { build :profile }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
  end

  describe 'associations' do
    it { should have_many(:users).dependent(:destroy) }
  end

  describe 'new profile' do
    let(:profile_with_empty_title) { build :profile_with_empty_title }
    let(:valid_profile) { build :profile }
    let(:root_profile) { build :profile }
    let(:root_profile_with_parent_id) { build :root_profile_with_parent_id }
    let(:valid_child_profile) { build :valid_child_profile }

    describe 'data is correct' do
      it 'should be valid' do
        valid_profile.save
        valid_profile.valid?
        expect(valid_profile).to be_valid
        expect(valid_profile.errors.count).to eq 0
      end
    end
    describe 'title is empty' do
      it 'should be invalid' do
        profile_with_empty_title.save
        profile_with_empty_title.valid?
        expect(profile_with_empty_title).not_to be_valid
        expect(profile_with_empty_title.errors.messages[:title]).to eq ["can't be blank"]
      end
    end
    describe 'is active' do
      it 'should be active' do
        valid_profile.save
        valid_profile.valid?
        expect(valid_profile.active?).to be true
      end
    end

    describe 'root profile' do
      it 'should be valid' do
        root_profile.save
        root_profile.valid?
        expect(root_profile.root?).to eq true
      end
      it 'should be invalid when parent_id is present' do
        root_profile_with_parent_id.save
        root_profile_with_parent_id.valid?
        expect(root_profile_with_parent_id).not_to be_valid
      end
    end

    describe 'not root profile' do
      it 'should be valid child' do
        valid_child_profile.save
        valid_child_profile.valid?
        expect(valid_child_profile).to be_valid
      end
    end
  end
end
