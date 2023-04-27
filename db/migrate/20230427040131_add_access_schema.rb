# frozen_string_literal: true

class AddAccessSchema < ActiveRecord::Migration[7.0]
  def change
    create_table :access_schemas do |t|
      t.integer :role_id
      t.integer :permission_id
      t.boolean :active, null: false, default: false
      t.timestamps
    end
    add_index :access_schemas, %i[role_id permission_id]
  end
end
