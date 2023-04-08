# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SessionsController', type: :controller do
  describe 'GET /index' do
    context 'user was regitered' do
      let(:user_created) { create(:user) }

      before(:each) do
        sign_in user_created
      end

      it 'respond with token' do
        get :index, format: :json
        expect(response).to be_success
      end
    end
  end
end
