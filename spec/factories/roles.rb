# frozen_string_literal: true

FactoryBot.define do
  factory :role, class: Role do
    name { Faker::Lorem.word }
    is_super_admin { false }
  end
end
