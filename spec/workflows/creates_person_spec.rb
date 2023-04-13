# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreatesPerson do
  context 'initialization' do
    it 'when first name is present' do
      creator = CreatesPerson.new(
        first_name: 'Ruben'
      )
      creator.build
      expect(creator.person.first_name).to eq('Ruben')
    end

    it 'when with parents names is active' do
      creator = CreatesPerson.new(
        first_name: 'ruben',
        father_name: 'paz',
        mother_name: 'chuspe',
        with_parents_names: true
      )
      creator.build
      expect(creator.person.last_name).to eq('paz chuspe')
    end

    it 'when with parents names is inactive' do
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

  context 'create' do
    it 'when first name is present' do
      creator = CreatesPerson.new(
        first_name: 'Ruben'
      )
      creator.create
      expect(creator.success?).to be_falsy
    end
  end
end
