# frozen_string_literal: true

require 'rails_helper'
RSpec.describe CreatesProfile do
  describe 'creates' do
    context 'user is valid' do
      it 'created' do
        user = User.new attributes_for :user
        work_group = WorkGroup.new attributes_for :work_group
        @workflow = CreatesProfile.new(
          user,
          work_group
        )
        @workflow.create
        expect(@workflow.success).to eq(true)
      end
    end
    context 'user is invalid' do
      it 'description' do
        expect(true).to eq(true)
      end
    end
  end
end
