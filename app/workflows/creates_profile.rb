# frozen_string_literal: true

class CreatesProfile
  attr_accessor :user, :work_group
  attr_reader :profile, :success, :work_group_id

  def initialize(user, work_group_id)
    @user = user
    @work_group_id = work_group_id
    @success = false
    @profile = Profile.new
  end

  def build
    self.user = @user
    self.work_group = WorkGroup.find(work_group_id)
  end

  def create
    return @success unless validate_entries

    build
    @user.save
    @profile.user = @user
    @profile.work_group = @work_group
    result_profile = @profile.save
    @success = result_profile
  end

  def validate_entries
    work_group_id && @user
  end
end
