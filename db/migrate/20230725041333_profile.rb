# frozen_string_literal: true

class Profile < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.belongs_to :work_group
      t.boolean :is_active, null: false, default: false
      t.string :title, null: false
      t.boolean :is_root, null: false, default: false
      t.integer :parent_id

      t.timestamps
    end
  end
end
