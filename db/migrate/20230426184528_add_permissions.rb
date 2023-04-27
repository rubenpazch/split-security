# frozen_string_literal: true

class AddPermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :permissions do |t|
      t.string :name
      t.boolean :active, null: false, default: false
      t.timestamps
    end
  end
end
