# frozen_string_literal: true

require 'rails_helper'
# given
RSpec.describe Person, type: :model do
  context 'given a person' do
    let(:person_basic) { build(:people) }

    it 'then full messages errors in empty' do
      person_basic.validate
      expect(person_basic.errors.full_messages).to match_array([])
    end
  end

  context 'given a person invalid first name' do
    let(:person_basic) { build(:people) }

    it 'then first name includes numbers' do
      person_basic.first_name = 'Robert1'
      person_basic.validate(person_basic)
      expect(person_basic.errors.full_messages).to match_array(['First name includes numbers'])
    end
    it 'then first name includes special characters' do
      person_basic.first_name = 'Rober.'
      person_basic.validate(person_basic)
      expect(person_basic.errors.full_messages).to match_array(['First name includes special characters'])
    end
  end

  context 'given a person with invalid last name' do
    let(:person_basic) { build(:people) }

    it 'then last name includes numbers' do
      person_basic.last_name = 'King1'
      person_basic.validate(person_basic)
      expect(person_basic.errors.full_messages).to match_array(['Last name includes numbers'])
    end
  end

  context 'given a person with invalid middle name' do
    let(:person_basic) { build(:people) }

    it 'then middle name includes numbers' do
      person_basic.middle_name = 'Lautaro1'
      person_basic.validate(person_basic)
      expect(person_basic.errors.full_messages).to match_array(['Middle name includes numbers'])
    end
  end

  context 'given a person invalid father name' do
    let(:person_basic) { build(:people) }

    it 'then father name includes numbers' do
      person_basic.father_name = 'Lautaro1'
      person_basic.validate(person_basic)
      expect(person_basic.errors.full_messages).to match_array(['Father name includes numbers'])
    end
  end

  context 'given a person invalid mother name' do
    let(:person_basic) { build(:people) }

    it 'then mother name includes numbers' do
      person_basic.mother_name = 'Lautaro1'
      person_basic.validate(person_basic)
      expect(person_basic.errors.full_messages).to match_array(['Mother name includes numbers'])
    end
  end

  context 'given a person with active parents names option' do
    let(:person_basic) { build(:people) }

    it 'then last name is not null' do
      person_basic.with_parents_names = true
      person_basic.generate_last_name
      expect(person_basic.last_name).not_to be_nil
    end

    pending 'then last name includes father name' do
      person_basic.with_parents_names = true
      expect([]).to match_array([])
    end
  end

  context 'given a person with inactive parents names' do
    let(:person_basic) { build(:people) }

    it 'then last name is with data' do
      person_basic.with_parents_names = false
      expect(person_basic.last_name).to be_nil
    end
  end
end
