# frozen_string_literal: true

FactoryBot.define do
  factory :people, class: Person do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    middle_name { Faker::Name.middle_name }
    last_name_a { Faker::Name.last_name }
    last_name_b { Faker::Name.last_name }
    with_parents_names { false }
  end
end
