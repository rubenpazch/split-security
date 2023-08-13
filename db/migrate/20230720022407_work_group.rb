# frozen_string_literal: true

class WorkGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :work_groups do |t|
      t.string :title

      t.timestamps
    end
  end
end
