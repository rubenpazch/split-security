# frozen_string_literal: true

class DeletesProfile
  attr_accessor :profile_id

  def initialize(profile_id)
    @profile_id = profile_id
  end

  def destroy
    Profile.find(profile_id).destroy
  end
end
