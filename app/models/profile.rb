# frozen_string_literal: true

class Profile < ApplicationRecord
  self.table_name = 'profiles'
  has_many :role_profiles, class_name: 'RoleProfile', dependent: :destroy
  has_many :roles, through: :role_profiles
  has_many :user_profiles, dependent: :destroy
  has_many :users, through: :user_profiles
end
