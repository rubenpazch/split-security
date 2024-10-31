# frozen_string_literal: true

module Api
  module V1
    class ProfilesController < ApplicationController
      before_action :authenticate_api_user!, except: [:index]
      before_action :set_profile, only: %i[show update destroy]

      def index
        @profiles = Profile.all
        render :index, status: :ok
      end

      def show
        render json: @profile
      end

      def update
        if @profile.update(profile_params)
          render json: @profile
        else
          render json: @profile.errors, status: :not_found
        end
      end

      def destroy
        @profile.destroy
      end

      private

      def set_profile
        @profile = Profile.find(params[:id])
      end

      def profile_params
        params.require(:profile).permit(:id, :title, :is_active, :is_root, :parent_id, :work_group_id)
      end
    end
  end
end
