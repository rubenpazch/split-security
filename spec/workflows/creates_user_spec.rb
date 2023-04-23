require 'rails_helper'

RSpec.describe CreatesUser do 
  context "initialization" do
    let(:user_test) {build(:user)}
    it 'password is missing' do 
      creator = CreatesUser.new(
        email: user_test.email
      )
      creator.build
      expect(creator.user.valid?).to be_falsy
    end

    it 'user is valid' do 
      creator = CreatesUser.new(
        email: user_test.email,
        password: user_test.password,
      )
      creator.build
      expect(creator.user.valid?).to be_truthy  
    end
  end

  context "created" do
    let(:user_test) {build(:user)}
    it 'saves a user' do 
      creator = CreatesUser.new(
        email: user_test.email,
        password: user_test.password
      )
      expect(creator.create).to be_truthy
    end 
  end

  context "has one person" do 
    let(:user_test) {build(:user)}
    let(:person_test) {build(:people)}

  end
  
  
end
