# frozen_string_literal: true

# rubocop: disable Metrics/BlockLength
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    uid { email }
    password { '12345678' }
    password_confirmation { password }

    factory :confirmed_user do
      confirmed_at { Time.zone.now }
    end

    factory :user_without_uid do
      uid { '' }
    end

    factory :user_with_email_only do
      name { nil }
      uid { email }
      password { nil }
      password_confirmation { nil }
    end

    factory :user_with_empty_password do
      name { nil }
      uid { email }
      password { '' }
      password_confirmation { '' }
    end

    factory :user_with_nil_name do
      name { nil }
      uid { email }
      password { '12345678' }
      password_confirmation { password }
    end

    factory :user_with_invalid_email do
      email { '@emai.com' }
      name { nil }
      uid { email }
      password { '12345678' }
      password_confirmation { password }
    end

    factory :user_with_invalid_domain_email do
      email { 'test@' }
      name { nil }
      uid { email }
      password { '12345678' }
      password_confirmation { password }
    end
  end
end
# rubocop: enable Metrics/BlockLength
