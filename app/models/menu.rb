# frozen_string_literal: true

class Menu < ApplicationRecord
  self.table_name = 'menus'
  has_many :sub_menus, class_name: 'SubMenu', foreign_key: 'menus_id', dependent: :destroy, inverse_of: 'menus'
  belongs_to :users, class_name: 'User', foreign_key: 'user_id', dependent: :destroy, inverse_of: 'users'

  validates :title, presence: true,
                    length: { minimum: 3 },
                    uniqueness: { case_sensitive: false }
  validates :link_to, presence: true,
                      length: { minimum: 3 },
                      uniqueness: { case_sensitive: false }
end
