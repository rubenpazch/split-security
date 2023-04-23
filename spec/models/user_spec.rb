# frozen_string_literal: true

require 'rails_helper'
# given
RSpec.describe User, type: :model do
  context 'given an user with invalid password' do
    let(:user_basic) { build(:user) }

    it 'then password is blank' do
      instance_double('person', id: 1, save!: true)
      user_basic.password = ''
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array(["Password can't be blank"])
    end

    it 'then password is null' do
      instance_double('person', id: 1, save!: true)
      user_basic.password = nil
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array(["Password can't be blank"])
    end

    it 'then password with length greater to 128' do
      instance_double('person', id: 1, save!: true)
      user_basic.password = 'a' * 129
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array(['Password is too long (maximum is 128 characters)'])
    end

    it 'then password with length lower than 6' do
      instance_double('person', id: 1, save!: true)
      user_basic.password = 'abc'
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array(['Password is too short (minimum is 6 characters)'])
    end
  end
  context 'given an user with valid password' do
    let(:user_basic) { build(:user) }

    it 'then password is correct' do
      instance_double('person', id: 1, save!: true)
      expect(user_basic.errors.full_messages).to match_array([])
    end

    it 'then password include comas' do
      instance_double('person', id: 1, save!: true)
      user_basic.password = 'mypassword,'
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array([])
    end

    it 'then password include dots' do
      instance_double('person', id: 1, save!: true)
      user_basic.password = 'mypassword.'
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array([])
    end

    it 'then password has special characters' do
      instance_double('person', id: 1, save!: true)
      user_basic.password = "mypassword\ªº!|@·#$%&/(=)?'¿¡^`[*+]¨´{ç};,:._-"
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array([])
    end

    it 'then password has 128 characters' do
      instance_double('person', id: 1, save!: true)
      user_basic.password = 'x' * 128
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array([])
    end

    it 'then password includes numbers characters' do
      instance_double('person', id: 1, save!: true)
      user_basic.password = '1234567'
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array([])
    end
    it 'then password includes lowercase characters' do
      instance_double('person', id: 1, save!: true)
      user_basic.password = 'abcdefABCDEF'
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array([])
    end
    it 'then password includes uppercase characters' do
      instance_double('person', id: 1, save!: true)
      user_basic.password = 'abcdefABCDEF'
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array([])
    end
  end
  context 'given an user with invalid email' do
    let(:user_basic) { build(:user) }
    it "email don't have at sign" do
      instance_double('person', id: 1, save!: true)
      user_basic.email = 'email.com'
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array(['Email is invalid'])
    end
    it 'email has symbols' do
      instance_double('person', id: 1, save!: true)
      user_basic.email = ',.com'
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array(['Email is invalid'])
    end
  end
  context 'given an user with valid email' do
    let(:user_basic) { build(:user) }
    it 'email has the correct format' do
      instance_double('person', id: 1, save!: true)
      user_basic.email = 'test@email.com'
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array([])
    end
  end
  context 'given an user with valid data' do
    let(:user_basic) { build(:user) }
    it 'can create a user' do
      instance_double('person', id: 1, save!: true)
      user_basic.save
      expect(User.count).to equal(5)
    end
  end
end
