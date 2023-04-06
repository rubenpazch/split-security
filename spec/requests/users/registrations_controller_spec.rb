require 'rails_helper'

RSpec.describe "Users::Registrations", type: :controller do
  describe "GET /index" do
      let(:user_new) { create(:user) }

      before :each do 
        sign_in(user_new)
      end

      after :each do 
        sign_out(user_new)
      end

      it "should be logged in" do 
        debugger
        user_new
      end
  end
end
