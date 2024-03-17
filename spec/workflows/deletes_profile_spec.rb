# frozen_string_literal: true

require 'rails_helper'
RSpec.describe DeletesProfile do
  describe 'deletes' do
    let(:work_group_admins) { create(:work_group) }
    let(:user_admin) { build(:user) }

    context 'profile id is valid' do
      it 'is deleted' do
        @workflow = CreatesProfile.new(
          user_admin,
          work_group_admins.id
        )
        @workflow.create
        @profile_created = DeletesProfile.new(@workflow.profile.id)
        @profile_created.destroy
        expect(Profile.last).to be_nil
      end
    end
  end
end
