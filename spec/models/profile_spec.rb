# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile do
  subject(:profile) { build(:profile) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end

  describe '#build' do
    context 'when title is present' do
      let(:valid_profile) { build(:profile) }

      it 'is valid' do
        expect(valid_profile).to be_valid
      end
    end

    context 'when title is nil' do
      let(:profile_nil_title) { build(:profile_with_nil_title) }

      it "displays title can't be blank" do
        profile_nil_title.valid?
        expect(profile_nil_title.errors.messages[:title]).to eq ["can't be blank"]
      end
    end

    context 'when title is empty' do
      let(:profile_empty_title) { build(:profile_with_empty_title) }

      it "displays title can't be blank" do
        profile_empty_title.valid?
        expect(profile_empty_title.errors.messages[:title]).to eq ["can't be blank"]
      end
    end

    context 'when is active' do
      let(:is_active_profile) { build(:is_active_profile) }

      it 'and it is active' do
        expect(is_active_profile).to be_active
      end
    end

    context 'when root profile' do
      let(:root_profile) { build(:is_root_profile) }

      it 'and it is root' do
        expect(root_profile.root?).to be true
      end

      it 'and it not child' do
        expect(root_profile.child?).to be false
      end
    end

    context 'when child profile' do
      let(:child_profile) { build(:valid_child_profile) }

      it 'is valid child' do
        child_profile.save
        expect(child_profile.child?).to be true
      end

      it 'and it is not root' do
        child_profile.valid?
        expect(child_profile.root?).to be false
      end
    end
  end

  describe '#create' do
    context 'when title is present' do
      let(:valid_profile) { create(:profile) }

      it 'is valid' do
        expect { valid_profile }.to change(described_class, :count).by(1)
      end
    end
  end

  describe '#delete' do
    context 'when profile is present' do
      let(:valid_profile) { create(:profile) }

      it 'is removed' do
        valid_profile.destroy
        expect { valid_profile }.to change(described_class, :count).by(0)
      end
    end
  end
end
