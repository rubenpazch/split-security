# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users::Registrations', type: :controller do
  describe 'GET /index' do
    let(:user_new) { create(:user) }

    before :each do
      sign_in(user_new)
    end

    after :each do
      sign_out(user_new)
    end

    skip 'should be logged in' do
      user_new
    end
  end
end
