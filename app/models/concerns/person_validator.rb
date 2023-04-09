# frozen_string_literal: true

# < ActiveModel::Validator

module PersonValidator
  def validate(record)
    unless include_numbers?(record.first_name)
      # record.errors.add :base, "First name is invalid"
      record.errors.push('First name includes numbers')
    end
    unless include_numbers?(record.last_name)
      # record.errors.add :base, "First name is invalid"
      record.errors.push('Last name includes numbers')
    end
    return if include_numbers?(record.middle_name)

    # record.errors.add :base, "First name is invalid"
    record.errors.push('Middle name includes numbers')
  end

  def include_numbers?(text_field)
    text_field.match(/[0-9]/).nil?
  end
end
