# frozen_string_literal: true

FactoryBot.define do
  factory :organizations, class: Organization do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph_by_chars(number: 10) }
    identifier { Faker::Company.polish_taxpayer_identification_number }
    legal_name { Faker::Company.name }
    address { Faker::Address.full_address }
    country_code { 0 }
    city_code { 0 }
    province { 0 }
    district { 0 }
  end
end
