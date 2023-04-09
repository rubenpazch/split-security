# frozen_string_literal: true

class Person
  include PersonValidator
  attr_accessor :first_name, :last_name, :middle_name, :last_name_a, :last_name_b, :is_full_name, :with_parents_names
  attr_accessor :errors

  def initialize(
    first_name: '',
    middle_name: '',
    last_name_a: '',
    last_name_b: '',
    with_parents_names: false
  )
    @first_name = first_name
    @last_name = generate_last_name
    @middle_name = middle_name
    @last_name_a = last_name_a
    @last_name_b = last_name_b
    @with_parents_names = with_parents_names
    @errors = []
  end

  def generate_last_name
    return "#{@last_name_a} #{@last_name_b}" if with_parents_names
  end
end
