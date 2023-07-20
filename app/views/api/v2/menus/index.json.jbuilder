# frozen_string_literal: true

json.data do
  json.menus do
    json.array! @menus do |menu|
      json.id menu.id
      json.title menu.title
      json.body menu.link_to
    end
  end
end
