# frozen_string_literal: true

require 'rails_helper'
# given
RSpec.describe Person, type: :model do
  context 'given a person' do
    let(:person_basic) { build(:people) }

    it 'then data is correct' do
      expect(person_basic.errors).to match_array([])
    end
  end

  context 'given a person invalid first name' do
    let(:person_basic) { build(:people) }

    it 'then first name includes numbers' do
      person_basic.first_name = 'Robert1'
      person_basic.validate(person_basic)
      expect(person_basic.errors).to match_array(['First name includes numbers'])
    end
  end

  context 'given a person invalid last name' do
    let(:person_basic) { build(:people) }

    it 'then last name includes numbers' do
      person_basic.last_name = 'King1'
      person_basic.validate(person_basic)
      expect(person_basic.errors).to match_array(['Last name includes numbers'])
    end
  end

  context 'given a person invalid middle name' do
    let(:person_basic) { build(:people) }

    it 'then middle name includes numbers' do
      person_basic.middle_name = 'Lautaro1'
      person_basic.validate(person_basic)
      expect(person_basic.errors).to match_array(['Middle name includes numbers'])
    end
  end
end
