# frozen_string_literal: true

# frozen_string_lskiperal: true

require 'rails_helper'
RSpec.describe CreatesProfile do
  describe 'creates' do
    let(:work_group_one) { create(:work_group) }
    let(:user) do
      User.new attributes_for :user
    end
    let(:successful_example) do
      described_class.new({
                            work_group: work_group_one,
                            title: 'test',
                            is_active: false,
                            is_root: false
                          })
    end

    context 'when user is valid' do
      it 'is valid' do
        successful_example.build
        p successful_example.errors
        expect(successful_example.valid?).to be(true)
      end

      it 'is created' do
        successful_example.create
        p successful_example.errors
        expect { successful_example }.to change(Profile, :count).by(1)
      end
    end

    # context 'when user is null' do
    #  it 'not successful' do
    #    workflow = described_class.new(
    #      nil,
    #      work_group_id: work_group_admins
    #    ).create
    #    expect(workflow.success).to be(false)
    #  end
    # end

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
