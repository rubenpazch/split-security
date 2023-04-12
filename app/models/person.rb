# frozen_string_literal: true

class Person < ApplicationRecord
  include ActiveModel::Validations
  validates_with PersonValidator
end
