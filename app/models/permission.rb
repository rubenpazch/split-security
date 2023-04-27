# frozen_string_literal: true

class Permission < ApplicationRecord
  has_many :access_schemas, dependent: :destroy
  has_many :roles, through: :access_schemas
end
