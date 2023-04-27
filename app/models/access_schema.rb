# frozen_string_literal: true

class AccessSchema < ApplicationRecord
  belongs_to :role
  belongs_to :permission
end
