# frozen_string_literal: true

json.data do
  json.articles do
    json.array! @articles do |article|
      json.id article.id
      json.title article.title
      json.body article.body
    end
  end
end
