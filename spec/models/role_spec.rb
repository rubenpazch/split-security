# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'given a role' do
    let(:role_test) { build(:roles) }

    skip 'title is empty' do
      role_test.title = ''
      role_test.validate
      expect(role_test.errors.full_messages).to match_array(["Role can't be empty"])
    end

    skip 'title is null' do
      role_test.title = nil
      role_test.validate
      expect(role_test.errors.full_messages).to match_array(["Role can't be null"])
    end
    skip 'title with long string' do
      role_test.title = 'test' * 1000
      role_test.validate
      expect(role_test.errors.full_messages).to match_array(['Role title length is greater than 255'])
    end

    it 'is super admin'
    it 'is admin'
    it 'is support'
    it 'is author'
    it 'is basic user'
  end
end
