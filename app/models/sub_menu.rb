# frozen_string_literal: true

class SubMenu < ApplicationRecord
  self.table_name = 'sub_menus'
  belongs_to :menu, class_name: 'Menu', foreign_key: 'menus_id', inverse_of: 'sub_menus'
end
