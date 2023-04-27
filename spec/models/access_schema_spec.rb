# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccessSchema, type: :model do
  context 'given an access schema' do
    let(:access_schema_test) { AccessSchema.new }
    let(:role_test) { create(:role) }
    let(:permission_test) { create(:permission) }

    it 'is super admin' do
      access_schema_test.role_id = role_test.id
      access_schema_test.permission_id = permission_test.id
      access_schema_test.active = true
      access_schema_test.save
      expect(AccessSchema.all.count).to eq(1)
    end
  end
end
