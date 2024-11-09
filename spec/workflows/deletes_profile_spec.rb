# frozen_string_literal: true

require 'rails_helper'
RSpec.describe DeletesProfile do
  describe 'deletes' do
    let(:work_group_admins) { create(:work_group) }
    let(:user_admin) { build(:user) }
    let(:workflow) do
      CreatesProfile.new(
        user_admin,
        work_group_admins.id
      )
    end

    context 'when profile id is valid' do
      it 'is deleted' do
        skip 'reason'
        workflow.create
        profile_created = described_class.new(workflow.profile.id)
        profile_created.destroy
        expect(Profile.last).to be_nil
      end
    end
  end
end
