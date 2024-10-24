# frozen_string_literal: true

FactoryBot.define do
  factory :user_profile do
    transient { user { create(:valid_user) } }
    transient { profile { create(:profile) } }

    user_id { user.id }
    profile_id { profile.id }
  end
end
