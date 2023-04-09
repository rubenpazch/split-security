# frozen_string_literal: true

class Person
  include PersonValidator
  attr_accessor :first_name, :last_name, :middle_name, :last_name_a, :last_name_b
  attr_accessor :errors

  def initialize(
    first_name: '',
    last_name: '',
    middle_name: '',
    last_name_a: '',
    last_name_b: ''
  )
    @first_name = first_name
    @last_name = last_name
    @middle_name = middle_name
    @last_name_a = last_name_a
    @last_name_b = last_name_b
    @errors = []
  end
end
