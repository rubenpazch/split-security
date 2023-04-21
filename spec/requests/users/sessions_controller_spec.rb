# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  describe 'GET /index' do
    context 'user was regitered' do
      let(:user_created) { create(:user) }

      before(:each) do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        sign_in user_created
      end

      it 'respond with new user' do
        post :create, format: :json
        expect(response).to be_ok
      end

      it 'respond with created user' do 
        get :new, format: :json
        expect(response).to be_ok  
      end
    end
  end
end
