# frozen_string_literal: true

class SubMenu < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_menus do |t|
      t.string :title
      t.string :link_to
      t.boolean :has_sub_menu, null: false, default: false
      t.integer :index_order

      t.references :menus, index: true, foreign_key: true

      t.timestamps
    end
  end
end
