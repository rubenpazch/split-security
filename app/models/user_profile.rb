# frozen_string_literal: true

#   a User profile might be:
#   * Administrator > "Pedro"
#   * IT Support > "Pedro"
#   * Team Leader > "Pedro"

class UserProfile < ApplicationRecord
  self.table_name = 'user_profiles'
  belongs_to :user
  belongs_to :profile
end
