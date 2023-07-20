# frozen_string_literal: true

FactoryBot.define do
  factory :sub_menu do
    title { Faker::Internet.slug(words: 'foo bar') }
    link_to { Faker::Internet.slug(words: 'foo bar', glue: '/') }
    has_sub_menu { false }
    is_root { false }
    index_order { 0 }
    menu
    factory :invalid_sub_menu do
      title { nil }
    end
  end
end
