# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.index %w[title], name: 'index_articles_on_title', unique: true

      t.timestamps
    end
  end
end
