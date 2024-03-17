# frozen_string_literal: true

module Overrides
  class SessionsController < DeviseTokenAuth::SessionsController
    def render_create_success
      render :create, status: :ok
    end
  end
end
