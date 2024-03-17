# frozen_string_literal: true

class AddTitleIndexToProfile < ActiveRecord::Migration[7.0]
  def change
    add_index :profiles, :title, unique: true
  end
end
