# frozen_string_literal: true

class CreatesProfile
  attr_accessor :user, :work_group

  def initialize(user, work_group)
    @user = user
    @work_group = work_group
    @success = false
  end

  def build
    self.user = @user
    self.work_group = @work_group
  end

  attr_reader :success

  def create
    build
    result_user = user.save
    result_work_group = work_group.save
    @success = result_user && result_work_group
  end
end
