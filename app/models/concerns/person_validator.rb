# frozen_string_literal: true

# < ActiveModel::Validator

module PersonValidator
  def validate(person_record)
    @person_record = person_record
    first_name_with_numbers(person_record.first_name)
    last_name_with_numbers(person_record.last_name)
    middle_name_with_numbers(person_record.middle_name)
    father_name_with_numbers(person_record.last_name_a)
    mother_name_with_numbers(person_record.last_name_b)
    first_name_with_characters(person_record.first_name)
  end

  def include_numbers?(text_field)
    text_field.match?(/[0-9]/)
  end

  def include_special_characters?(text_field)
    text_field.match?(/\W/)
  end

  def last_name_with_numbers(str)
    @person_record.errors.push('Last name includes numbers') if include_numbers?(str)
  end

  def mother_name_with_numbers(str)
    @person_record.errors.push('Mother name includes numbers') if include_numbers?(str)
  end

  def father_name_with_numbers(str)
    @person_record.errors.push('Father name includes numbers') if include_numbers?(str)
  end

  def first_name_with_characters(str)
    return unless include_special_characters?(str)

    @person_record.errors.push('First name includes special characters')
  end

  def middle_name_with_numbers(str)
    @person_record.errors.push('Middle name includes numbers') if include_numbers?(str)
  end

  def first_name_with_numbers(str)
    # person_record.errors.add :base, "First name is invalid"
    @person_record.errors.push('First name includes numbers') if include_numbers?(str)
  end
end
