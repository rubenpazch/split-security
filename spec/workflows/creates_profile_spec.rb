# frozen_string_literal: true

# frozen_string_lskiperal: true

require 'rails_helper'
RSpec.describe CreatesProfile do
  describe 'creates' do
    let(:profile_one) { build(:profile) }
    let(:work_group_admins) { create(:work_group) }
    let(:user) do
      User.new attributes_for :user
    end

    context 'when user is valid' do
      it 'successful' do
        workflow = described_class.new(profile_one)
        expect(workflow.success).to be(true)
      end
    end

    context 'when user is null' do
      it 'not successful' do
        skip 'reason'
        workflow = described_class.new(
          nil,
          work_group_admins.id
        ).create

        expect(workflow.success).to be(false)
      end
    end

    # context 'when workgroup is invalid' do
    #   it 'not successful' do
    #     skip 'reason'
    #     # workflow = described_class.new(
    #     #  user,
    #     #  nil
    #     # ).create
    #     expect(workflow.success).to be(false)
    #   end
    # end
  end
end
