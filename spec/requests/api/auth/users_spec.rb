# frozen_string_literal: true

# # frozen_string_literal: true
#
# require 'rails_helper'
#
# RSpec.describe '/auth', type: :request do
#   headers = { 'ACCEPT' => 'application/json' }
#   describe 'POST /sign_up' do
#     it 'responses with Ok' do
#       post(api_user_registration_path,
#            params: {
#              email: 'test@gmail.com',
#              password: '1234567890',
#              password_confirmation: '1234567890'
#            }, headers:)
#
#       expect(response).to be_successful
#     end
#
#     it 'changes user by 1' do
#       expect do
#         post api_user_registration_path,
#              params: {
#                email: 'test1@gmail.com',
#                password: '1234567890',
#                password_confirmation: '1234567890'
#              },
#              headers:
#       end.to change(User, :count).by(1)
#     end
#   end
#
#   describe 'POST /auth/confirmation (Confirmation process)' do
#     it 'responds with status 302(URL redirection)' do
#       post(api_user_registration_path,
#            params: {
#              email: 'test1@gmail.com',
#              password: '1234567890',
#              password_confirmation: '1234567890'
#            },
#            headers:)
#       user = User.last
#       get api_user_confirmation_path(config: 'default', confirmation_token: user.confirmation_token,
#                                      redirect_url: '/')
#       expect(response).to be_redirect
#       expect(response).to have_http_status(:found)
#     end
#   end
#
#   describe 'POST /auth/sign_in (Sign In process)' do
#     it 'responds with status 200(OK)' do
#       post(api_user_registration_path,
#            params: {
#              email: 'email@email.com',
#              password: 'qwertyuiop',
#              password_confirmation: 'qwertyuiop'
#            },
#            headers:)
#       user = User.last
#       get api_user_confirmation_path(config: 'default', confirmation_token: user.confirmation_token,
#                                      redirect_url: '/')
#       post(api_user_session_path,
#            params: {
#              email: 'email@email.com',
#              password: 'qwertyuiop'
#            },
#            headers:)
#       expect(response).to be_successful
#       expect(response).to have_http_status(:ok)
#     end
#   end
# end
#
