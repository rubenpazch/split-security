# frozen_string_literal: true

class SubMenu < ApplicationRecord
  self.table_name = 'sub_menus'
  belongs_to :menus, class_name: 'Menu', inverse_of: 'sub_menus'
end
