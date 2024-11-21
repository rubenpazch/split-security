# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph(sentence_count: 10) }
    transient { user { create(:valid_user) } }
    user_id { user.id }

    factory :invalid_article do
      title { nil }
    end
  end
end
