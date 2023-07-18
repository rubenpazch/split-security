# frozen_string_literal: true

class Menu < ApplicationRecord
  self.table_name = 'menus'
  has_many :sub_menus, class_name: 'SubMenu', foreign_key: 'menus_id', dependent: :destroy, inverse_of: 'menu'
end
