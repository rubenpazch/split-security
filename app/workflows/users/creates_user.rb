# frozen_string_literal: true

module Users
  class CreatesUser
    attr_accessor :email, :password, :user, :creation_option

    def initialize(
      email: '',
      password: '',
      creation_option: ''
    )
      @email = email
      @password = password
      @creation_option = creation_option
    end

    def build
      self.user = new_user
    end

    def new_user
      User.new(
        email: @email,
        password: @password
      )
    end

    def new_person(user_id)
      Person.new(
        first_name: 'yy',
        last_name: 'hh',
        user_id:
      )
    end

    def success?
      @success
    end

    def create
      build
      if @creation_option == Users::CreationOptions::WITH_PERSON
        @success = user.save!
        person_build = new_person(user.id)
        person_build.save!
      else
        @success = user.save
      end
    end
  end
end
