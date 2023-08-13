# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    is_active { false }
    user
    work_group

    factory :active_user_profile do
      is_active { true }
    end
  end
end
