# frozen_string_literal: true

FactoryBot.define do
  factory :work_group do
    title { Faker::Lorem.word }
  end
end
