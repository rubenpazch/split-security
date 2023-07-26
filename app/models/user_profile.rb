# frozen_string_literal: true

class UserProfile < ApplicationRecord
  self.table_name = 'user_profiles'
  belongs_to :user, class_name: 'User'
  belongs_to :profile, class_name: 'Profile'
end
