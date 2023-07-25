# frozen_string_literal: true

class RoleProfile < ApplicationRecord
  self.table_name = 'role_profiles'
  belongs_to :role, class_name: 'Role'
  belongs_to :profile, class_name: 'Profile'
end
