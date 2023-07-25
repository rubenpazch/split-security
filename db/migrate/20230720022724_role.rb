# frozen_string_literal: true

class Role < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :title
      t.boolean :is_root, null: false, default: false
      t.integer :parent_id

      t.timestamps
    end
  end
end
