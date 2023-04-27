# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :access_schemas, dependent: :destroy
  has_many :permissions, through: :access_schemas

  validates :name, presence: true
  validates :name, presence: true, length: { maximum: 15 }
end
