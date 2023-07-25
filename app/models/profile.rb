# frozen_string_literal: true

class Profile < ApplicationRecord
  self.table_name = 'profiles'
  has_many :role_profiles, class_name: 'RoleProfile', dependent: :destoy
  has_many :roles, through: :role_profiles
  has_many :user_profiles, class_name: 'UserProfile', dependent: :destroy
end
