# frozen_string_literal: true

class CreatePerson < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :father_name
      t.string :mother_name
      t.boolean :with_parents_names, default: false, null: false

      t.timestamps
    end
  end
end
