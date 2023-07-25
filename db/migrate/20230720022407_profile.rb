# frozen_string_literal: true

class Profile < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :title

      t.timestamps
    end
  end
end
