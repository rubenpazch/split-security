require 'rails_helper'

RSpec.describe User, type: :model do
  context "create user" do
    let(:user_basic) { build(:user) }

    it "can create a user" do
      user_basic
    end    
  end
end
