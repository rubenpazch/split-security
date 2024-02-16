# frozen_string_literal: true

require 'rails_helper'
RSpec.describe CreatesProfile do
  describe 'creates' do
    let(:work_group_admins) { create(:work_group) }
    context 'user is valid' do
      it 'successful' do
        user = User.new attributes_for :user
        @workflow = CreatesProfile.new(
          user,
          work_group_admins.id
        )
        @workflow.create
        expect(@workflow.success).to eq(true)
      end
    end
    context 'user is null' do
      it 'not successful' do
        @workflow = CreatesProfile.new(
          nil,
          work_group_admins.id
        )
        @workflow.create
        expect(@workflow.success).to eq(false)
      end
    end

    context 'workgroup is invalid' do
      it 'not successful' do
        user = User.new attributes_for :user
        @workflow = CreatesProfile.new(
          user,
          nil
        )
        @workflow.create
        expect(@workflow.success).to eq(false)
      end
    end
  end
end
