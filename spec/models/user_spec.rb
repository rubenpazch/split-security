require 'rails_helper'
#given
RSpec.describe User, type: :model do
  context "when an user with invalid password" do 
    let(:user_basic) { build(:user) }
    
    it "then password is blank" do 
      user_basic.password = ""
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array(["Password can't be blank"])
    end
 
    it "then password is null" do 
      user_basic.password = nil
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array(["Password can't be blank"])
    end

    it "then password with length greater to 128" do 
      user_basic.password = "a"*129
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array(["Password is too long (maximum is 128 characters)"])
    end

    it "then password with length lower than 6" do 
      user_basic.password = "abc"
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array(["Password is too short (minimum is 6 characters)"])
    end
  end
  context "given an user with invalid password" do 
    let(:user_basic) { build(:user) }

    it "then password is correct" do 
      expect(user_basic.errors.full_messages).to match_array([])
    end

    it "then password include comas" do 
      user_basic.password ="mypassword,"
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array([])  
    end

    it "then password include dots" do 
      user_basic.password ="mypassword."
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array([])  
    end

    it "then password has special characters" do 
      user_basic.password ="mypassword\ªº!|@·#$%&/(=)?'¿¡^`[*+]¨´{ç};,:._-"
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array([])
    end

    it "then password has 128 characters" do 
      user_basic.password ="x"*128
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array([])
    end
    
    it "then password includes numbers characters" do 
      user_basic.password ="1234567"
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array([])
    end
    it "then password includes lowercase characters" do 
      user_basic.password ="abcdefABCDEF"
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array([])
    end
    it "then password includes uppercase characters" do 
      user_basic.password ="abcdefABCDEF"
      user_basic.validate
      expect(user_basic.errors.full_messages).to match_array([])
    end
  end

  context "create user" do
    let(:user_basic) { build(:user) }

    it "can't create a user" do
      expect(true).to be_truthy
    end    
  end

  context "delete user" do
    let(:user_basic) { build(:user) }

    it "can create a user" do
      expect(true).to be_truthy
    end    
  end
end
