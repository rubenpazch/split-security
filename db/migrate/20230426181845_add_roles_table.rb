# frozen_string_literal: true

class AddRolesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :is_super_admin, null: false, default: false
      t.timestamps
    end
  end
end
