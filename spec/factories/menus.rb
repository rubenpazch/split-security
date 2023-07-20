# frozen_string_literal: true

FactoryBot.define do
  factory :menu do
    title { Faker::Internet.slug(words: 'foo') }
    link_to { Faker::Internet.slug(words: 'foo', glue: '/') }
    has_sub_menu { false }
    is_root { false }
    index_order { 0 }
    factory :invalid_menu do
      title { nil }
    end
    factory :root_menu do
      is_root { true }
    end
  end
end
