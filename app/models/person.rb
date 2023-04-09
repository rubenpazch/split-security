# frozen_string_literal: true

class Person
  attr_accessor :first_ame, :last_name, :middle_name, :last_name_a, :last_name_b

  def initialize(
    first_name: '',
    last_name: '',
    middle_name: '',
    last_name_a: '',
    last_name_b: '',
  )
    @first_name = first_ame
    @last_name = last_name
    @middle_name = middle_name
    @last_name_a = last_name_a
    @last_name_b = last_name_b
  end
end
