# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreatesPerson do
  describe 'initialization' do
    it 'creates a person given a first name' do
      creator = CreatesPerson.new(
        first_name: 'Ruben'
      )
      creator.build
      expect(creator.person.first_name).to eq('Ruben')
    end

    it 'creates a person given a father and mother name' do
      creator = CreatesPerson.new(
        first_name: 'ruben',
        father_name: 'paz',
        mother_name: 'chuspe',
        with_parents_names: true
      )
      creator.build
      expect(creator.person.last_name).to eq('paz chuspe')
    end

    it 'creates a person given with parent names equal to false' do
      creator = CreatesPerson.new(
        first_name: 'john',
        last_name: 'smith',
        with_parents_names: false
      )
      creator.build
      expect(creator.person.father_name).to eq('')
      expect(creator.person.mother_name).to eq('')
    end
  end
end
