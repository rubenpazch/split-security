# frozen_string_literal: true

json.elements do
  json.user do
    json.id @resource.id
    json.title @resource.uid
    json.provider @resource.provider
    json.allow_password_change @resource.allow_password_change
    json.name @resource.name
    json.nickname @resource.nickname
    json.image @resource.image
    json.email @resource.email
    json.admin @resource.admin
  end
end
