# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  describe 'GET /index' do
    context 'user was regitered' do
      let(:user_created) { create(:user) }
      let(:user_built) { build(:user) }

      before(:each) do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        sign_in user_created
      end

      it 'respond with created user' do
        post :create, params: { user: { email: user_created.email, password: 'mypassword' } }, as: :json
        expect(response).to have_http_status(:success)
      end

      it 'respond with new user' do
        get :new, params: { user: { email: user_built.email, password: 'mypassword' } }, as: :json
        expect(response).to have_http_status(:success)
      end
    end
  end
end
