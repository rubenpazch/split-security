# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreatesPerson do
  context 'initialization' do
    before :each do
      instance_double('user', id: 1, save!: true)
    end
    it 'first name is present' do
      creator = CreatesPerson.new(
        first_name: 'Ruben',
        user_id: 1
      )
      creator.build
      expect(creator.person.first_name).to eq('Ruben')
    end

    it 'parents names is active' do
      creator = CreatesPerson.new(
        first_name: 'ruben',
        father_name: 'paz',
        mother_name: 'chuspe',
        with_parents_names: true,
        user_id: 1
      )
      creator.build
      expect(creator.person.last_name).to eq('paz chuspe')
    end

    it 'parents names is inactive' do
      creator = CreatesPerson.new(
        first_name: 'john',
        last_name: 'smith',
        with_parents_names: false,
        user_id: 1
      )
      creator.build
      expect(creator.person.father_name).to eq('')
      expect(creator.person.mother_name).to eq('')
    end
  end

  context 'create' do
    let(:user_test) { create(:user) }
    it 'user not exists' do
      creator = CreatesPerson.new(
        first_name: 'Ruben',
        last_name: 'Paz'
      )
      creator.create
      expect(creator.person.errors.full_messages).to match_array(['User must exist'])
      expect(creator.success?).to be_falsy
    end

    it 'user exists' do
      creator = CreatesPerson.new(
        first_name: 'Ruben',
        last_name: 'Paz',
        user_id: user_test.id
      )
      creator.create
      expect(creator.person.errors.full_messages).to match_array([])
      expect(creator.success?).to be_truthy
    end
  end
end
