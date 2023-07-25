# frozen_string_literal: true

class UserProfile < ApplicationRecord
  self.table_name = 'user_profiles'
  belongs_to :users, class_name: 'User'
  belongs_to :profiles, class_name: 'Profile'
end
