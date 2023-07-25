# frozen_string_literal: true

class RoleProfile < ActiveRecord::Migration[7.0]
  def change
    create_table :role_profiles do |t|
      t.belongs_to :role
      t.belongs_to :profile
      t.timestamps
    end
  end
end
