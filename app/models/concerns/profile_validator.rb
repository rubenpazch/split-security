# frozen_string_literal: true

class ProfileValidator < ActiveModel::Validator
  def validate(record)
    return unless record.root? && record.parent?

    record.errors.add(:is_root, 'Root or Parent are incorrect')
  end
end
