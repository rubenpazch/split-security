# frozen_string_literal: true

FactoryBot.define do
  factory :people, class: Person do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    middle_name { Faker::Name.middle_name }
    father_name { Faker::Name.last_name }
    mother_name { Faker::Name.last_name }
    with_parents_names { true }
  end
end
