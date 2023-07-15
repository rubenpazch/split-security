# frozen_string_literal: true

json.data do
  json.article do
    json.id @article.id
    json.title @article.title
    json.body @article.body
  end
end
