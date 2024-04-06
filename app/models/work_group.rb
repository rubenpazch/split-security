# frozen_string_literal: true

#   a workgroup might be:
#   * enginners -> profiles
#     * leadership
#     * manager
#     * developer
#   * support
#   * operations
#   * human resources
#   * other related
class WorkGroup < ApplicationRecord
  self.table_name = 'work_groups'
  # has_many :role_profiles, class_name: 'RoleProfile', dependent: :destroy
  # has_many :roles, through: :role_profiles
  has_many :profiles, class_name: 'Profile', dependent: :destroy
  # has_many :users, through: :profiles, dependent: :destroy

  validates :title, presence: true
end
