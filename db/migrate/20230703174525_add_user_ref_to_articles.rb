# frozen_string_literal: true

class AddUserRefToArticles < ActiveRecord::Migration[7.0]
  def change
    # rubocop: disable Rails/NotNullColumn, Lint/MissingCopEnableDirective
    add_reference :articles, :user, null: false, foreign_key: true
    # rubocop: enabled
  end
end
