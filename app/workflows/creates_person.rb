# frozen_string_literal: true

class CreatesPerson
  attr_accessor :first_name, :middle_name, :last_name, :father_name, :mother_name, :with_parents_names, :person

  def initialize(
    user_id:, first_name: '',
    middle_name: '',
    last_name: '',
    father_name: '',
    mother_name: '',
    with_parents_names: false
  )
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
    @father_name = father_name
    @mother_name = mother_name
    @with_parents_names = with_parents_names
    @success = false
    @user_id = user_id
  end

  def build
    self.person = Person.new(
      first_name:,
      last_name: generate_last_name,
      middle_name:,
      father_name:,
      mother_name:,
      with_parents_names:,
      user_id:
    )
  end

  def success?
    @success
  end

  def create
    build
    @success = person.save
  end

  def generate_last_name
    return "#{father_name} #{mother_name}" if with_parents_names
  end
end
