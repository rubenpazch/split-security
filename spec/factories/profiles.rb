# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    is_active { false }
    is_root { false }
    parent_id { nil }
    work_group
    title { 'default' }

    factory :profile_with_empty_title do
      title { nil }
    end

    factory :root_profile_with_parent_id do
      parent_id { 1 }
    end

    factory :valid_child_profile do
      parent_id { 1 }
    end

    factory :is_root_profile do
      is_root { true }
      is_active { true }
    end

    factory :is_inactive_profile do
      title { 'inactive profile' }
    end

    factory :is_active_profile do
      is_active { true }
      title { 'active profile' }
    end
  end
end
