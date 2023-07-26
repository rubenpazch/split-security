# frozen_string_literal: true

class UserProfile < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.belongs_to :user
      t.belongs_to :profile
      t.timestamps
    end
  end
end
