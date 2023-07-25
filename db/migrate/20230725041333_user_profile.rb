# frozen_string_literal: true

class UserProfile < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.belongs_to :users
      t.belongs_to :profiles
      t.timestamps
    end
  end
end
