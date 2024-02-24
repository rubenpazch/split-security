# frozen_string_literal: true

#
#
#
#  a profile might be :
#   * administrator
#   * admin
#   * author
#   * regular_user
#   * super_admin
#   * custom_profile

class Profile < ApplicationRecord
  self.table_name = 'profiles'
  # belongs_to :user, class_name: 'User'
  belongs_to :work_group, class_name: 'WorkGroup'
  has_many :user_profiles, dependent: :destroy
  has_many :users, through: :user_profiles
  # belongs_to :access_permissions, class_name: 'AccessPermission'
end
