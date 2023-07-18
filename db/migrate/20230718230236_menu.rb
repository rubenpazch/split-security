# frozen_string_literal: true

class Menu < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :title
      t.string :link_to
      t.boolean :has_sub_menu, null: false, default: false
      t.boolean :is_root, null: false, default: false
      t.integer :index_order

      t.timestamps
    end
  end
end
