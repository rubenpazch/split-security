# frozen_string_literal: true

FactoryBot.define do
  factory :permission, class: Permission do
    name { Faker::Lorem.word }
    active { false }
  end
end
