# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'given a role' do
    let(:role_test) { build(:role) }

    it 'name is empty' do
      role_test.name = ''
      role_test.validate
      expect(role_test.errors.full_messages).to match_array(["Name can't be blank"])
    end

    it 'name is null' do
      role_test.name = nil
      role_test.validate
      expect(role_test.errors.full_messages).to match_array(["Name can't be blank"])
    end

    it 'name with long string' do
      role_test.name = 'test' * 5
      role_test.validate
      expect(role_test.errors.full_messages).to match_array(['Name is too long (maximum is 15 characters)'])
    end

    it 'is super admin' do
      role_test.name = 'super_admin'
      role_test.is_super_admin = true
      expect(role_test.is_super_admin).to be_truthy
    end
  end
end
