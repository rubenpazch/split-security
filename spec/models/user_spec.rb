# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    # it { should have_many(:articles).dependent(:destroy) }
    # it { should have_many(:work_groups).dependent(:destroy) }
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

  describe 'when new user is created' do
    let(:user_with_email) { build :user_with_email_only }
    let(:user_with_nil_name) { build :user_with_nil_name }
    let(:user_with_empty_password) { build :user_with_empty_password }
    let(:user_with_invalid_email) { build :user_with_invalid_email }
    let(:user_with_invalid_domain_email) { build :user_with_invalid_domain_email }

    context 'only with email' do
      it 'should be invalid' do
        user_with_email.save
        user_with_email.valid?
        expect(user_with_email).not_to be_valid
        expect(user_with_email.errors.messages[:password]).to eq ["can't be blank"]
      end
    end
    context 'password is empty' do
      it 'should be invalid' do
        user_with_empty_password.save
        user_with_empty_password.valid?
        expect(user_with_empty_password).not_to be_valid
        expect(user_with_empty_password.errors.messages[:password]).to eq ["can't be blank"]
      end
    end
    context 'email is incorrect' do
      it 'should be invalid' do
        user_with_invalid_email.save
        user_with_invalid_email.valid?
        expect(user_with_invalid_email).not_to be_valid
        expect(user_with_invalid_email.errors.messages[:email]).to eq ['is not an email']
      end
    end
    context 'email domain is incorrect' do
      it 'should be invalid' do
        user_with_invalid_domain_email.save
        user_with_invalid_domain_email.valid?
        expect(user_with_invalid_domain_email).not_to be_valid
        expect(user_with_invalid_domain_email.errors.messages[:email]).to eq ['is not an email']
      end
    end

    context 'is valid' do
      it 'with nil name' do
        user_with_nil_name.save
        user_with_nil_name.valid?
        expect(user_with_nil_name).to be_valid
      end
    end
  end
end
