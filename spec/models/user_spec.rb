# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:articles).dependent(:destroy) }
    it { should have_many(:work_groups).dependent(:destroy) }
    it { should have_many(:profiles) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:password).is_at_least(8) }
  end

  describe 'callbacks' do
    context 'before_validation' do
      it 'should set uid as email' do
        user = User.new attributes_for :user_without_uid
        expect(user.uid).to eq('')
        user.save
        expect(user.uid).to eq(user.email)
      end
    end
  end

  describe 'new user' do
    context 'is invalid' do
      it 'only email' do
        user = User.new attributes_for :user_with_email_only
        user.save
        expect(user.valid?).to eq(false)
      end

      it 'password is empty' do
        user = User.new attributes_for :user_with_password_empty
        user.save
        expect(user.valid?).to eq(false)
      end
    end

    context 'is valid' do
      it 'name is nil' do
        user = User.new attributes_for :user_with_nil_name
        user.save
        expect(user.valid?).to eq(true)
      end
    end
  end
end
