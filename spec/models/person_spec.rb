# frozen_string_literal: true

require 'rails_helper'
# given
RSpec.describe Person, type: :model do
  context '#initialization' do
    let(:person_basic) { build(:people) }

    it 'person is valid' do
      person_basic.validate
      expect(person_basic.errors.full_messages).to match_array([])
    end

    it 'name includes numbers' do
      person_basic.first_name = 'Robert1'
      person_basic.validate(person_basic)
      expect(person_basic.errors.full_messages).to match_array(['First name includes numbers'])
    end

    it 'name includes special characters' do
      person_basic.first_name = 'Rober.'
      person_basic.validate(person_basic)
      expect(person_basic.errors.full_messages).to match_array(['First name includes special characters'])
    end

    it 'last name includes numbers' do
      person_basic.last_name = 'King1'
      person_basic.validate(person_basic)
      expect(person_basic.errors.full_messages).to match_array(['Last name includes numbers'])
    end

    it 'middle name includes numbers' do
      person_basic.middle_name = 'Lautaro1'
      person_basic.validate(person_basic)
      expect(person_basic.errors.full_messages).to match_array(['Middle name includes numbers'])
    end

    it 'father name includes numbers' do
      person_basic.father_name = 'Lautaro1'
      person_basic.validate(person_basic)
      expect(person_basic.errors.full_messages).to match_array(['Father name includes numbers'])
    end

    it 'mother name includes numbers' do
      person_basic.mother_name = 'Lautaro1'
      person_basic.validate(person_basic)
      expect(person_basic.errors.full_messages).to match_array(['Mother name includes numbers'])
    end

    it 'first name is null' do
      person_basic.first_name = nil
      person_basic.validate(person_basic)
      expect(person_basic.errors.full_messages).to match_array(["First name can't be blank"])
    end

    it 'last name is null' do
      person_basic.last_name = nil
      person_basic.validate(person_basic)
      expect(person_basic.errors.full_messages).to match_array(["Last name can't be blank"])
    end

    it 'middle name is null' do
      person_basic.middle_name = nil
      person_basic.validate(person_basic)
      expect(person_basic.errors.full_messages).to match_array([])
    end
  end
end
