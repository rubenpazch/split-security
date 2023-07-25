# frozen_string_literal: true

class Role < ApplicationRecord
  self.table_name = 'roles'
  has_many :role_profiles, class_name: 'RoleProfile', dependent: :destroy
  has_many :profiles, through: :role_profiles
end
