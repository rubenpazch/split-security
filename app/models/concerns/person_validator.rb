# frozen_string_literal: true

# < ActiveModel::Validator

class PersonValidator < ActiveModel::Validator
  def validate(person_record)
    first_name_with_numbers(person_record)
    first_name_with_characters(person_record)
    last_name_with_numbers(person_record)
    middle_name_with_numbers(person_record)
    father_name_with_numbers(person_record)
    mother_name_with_numbers(person_record)
  end

  def include_numbers?(text_field)
    return false if text_field.nil?

    text_field.match?(/[0-9]/)
  end

  def include_special_characters?(text_field)
    return false if text_field.nil?

    text_field.match?(/\W/)
  end

  def first_name_with_numbers(person_record)
    person_record.errors.add :first_name, 'includes numbers' if include_numbers?(person_record.first_name)
  end

  def first_name_with_characters(person_record)
    return unless include_special_characters?(person_record.first_name)

    person_record.errors.add :first_name,
                             'includes special characters'
  end

  def last_name_with_numbers(person_record)
    person_record.errors.add :last_name, 'includes numbers' if include_numbers?(person_record.last_name)
  end

  def middle_name_with_numbers(person_record)
    person_record.errors.add :middle_name, 'includes numbers' if include_numbers?(person_record.middle_name)
  end

  def father_name_with_numbers(person_record)
    person_record.errors.add :father_name, 'includes numbers' if include_numbers?(person_record.father_name)
  end

  def mother_name_with_numbers(person_record)
    person_record.errors.add :mother_name, 'includes numbers' if include_numbers?(person_record.mother_name)
  end
end
