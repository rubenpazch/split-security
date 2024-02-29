# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    is_active { true }
    is_root { true }
    parent_id { nil }
    work_group
    title { 'support' }

    factory :profile_with_empty_title do
      title { nil }
    end
    factory :root_profile_with_parent_id do
      parent_id { 1 }
    end

    factory :valid_child_profile do
      is_root { false }
      parent_id { 1 }
    end
  end
end
