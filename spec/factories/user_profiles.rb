# frozen_string_literal: true

FactoryBot.define do
  factory :user_profile do
    transient { user { create(:valid_user) } }
    transient { profile { create(:profile) } }
    user_id { user.id }
    profile_id { profile.id }

    # factory :user_with_root_profile do
    #  transient { profile { create(:is_root_profile) } }
    # end
  end
end
