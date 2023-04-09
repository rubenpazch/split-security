# frozen_string_literal: true

class Organization
  attr_accessor :name, :description, :legal_name, :address, :country_code, :city_code, :province, :district, :identifier

  def initialize(
    name: '',
    description: '',
    identifier: '',
    legal_name: '',
    address: '',
    country_code: '',
    city_code: '',
    province: '',
    district: ''
  )
    @name = name
    @description = description
    @identifier = identifier
    @legal_name = legal_name
    @address = address
    @country_code = country_code
    @city_code = city_code
    @province = province
    @district = district
  end

  def validate
    true
  end

  def errors
    ['test']
  end
end
