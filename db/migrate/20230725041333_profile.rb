# frozen_string_literal: true

class Profile < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.belongs_to :work_group
      t.boolean :is_active, null: false, default: false

      t.timestamps
    end
  end
end
