# frozen_string_literal: true

class Person < ApplicationRecord
  include ActiveModel::Validations
  validates :first_name, :last_name, presence: true
  validates_with PersonValidator
  has_one :user
end
