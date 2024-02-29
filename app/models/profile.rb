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
  include ActiveModel::Validations
  # belongs_to :user, class_name: 'User'
  belongs_to :work_group, class_name: 'WorkGroup'
  has_many :user_profiles, dependent: :destroy
  has_many :users, through: :user_profiles, dependent: :destroy
  # belongs_to :access_permissions, class_name: 'AccessPermission'

  validates :title, presence: true, uniqueness: true
  validates_with ProfileValidator

  def active?
    is_active
  end

  def root?
    is_root
  end

  def parent?
    self[:parent_id] != nil
  end

  def parent
    Profile.find(self[:parent_id]) if parent?
  end
end
