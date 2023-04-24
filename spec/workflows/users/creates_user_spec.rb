# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::CreatesUser do
  context 'initialization' do
    let(:user_test) { build(:user) }
    it 'password is missing' do
      creator = Users::CreatesUser.new(
        email: user_test.email
      )
      creator.build
      expect(creator.user.valid?).to be_falsy
    end

    it 'user is valid' do
      creator = Users::CreatesUser.new(
        email: user_test.email,
        password: user_test.password
      )
      creator.build
      expect(creator.user.valid?).to be_truthy
    end
  end

  context 'created' do
    let(:user_test) { build(:user) }
    it 'saves a user' do
      creator = Users::CreatesUser.new(
        email: user_test.email,
        password: user_test.password
      )
      expect(creator.create).to be_truthy
    end
  end

  context 'has one person' do
    let(:user_test) { build(:user) }

    it 'with user only' do
      creator = Users::CreatesUser.new(
        email: user_test.email,
        password: user_test.password,
        creation_option: Users::CreationOptions::WITH_USER_ONLY
      )
      expect(creator.create).to be_truthy
    end

    it 'with person' do
      creator = Users::CreatesUser.new(
        email: user_test.email,
        password: user_test.password,
        creation_option: Users::CreationOptions::WITH_PERSON
      )
      expect(creator.create).to be_truthy
    end
  end
end
