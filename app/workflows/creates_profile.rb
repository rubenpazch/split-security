# frozen_string_literal: true

class CreatesProfile
  attr_accessor :work_group
  attr_reader :profile, :success, :work_group_id, :is_active, :title, :is_root, :parent_id

  # def initialize(work_group_id, is_active, title, is_root, parent_id)
  def initialize(args = {})
    @work_group_id = args[:work_group_id]
    @is_active = args[:is_active]
    @title = args[:title]
    @is_root = args[:is_root]
    @parent_id = args[:parent_id]
    @success = false
    @profile = Profile.new
  end

  def build
    @profile.work_group = WorkGroup.find(work_group_id)
    @profile.is_active = @is_active
    @profile.title = @title
    @profile.is_root = @is_root
    @profile.parent_id = @parent_id
  end

  def create
    return @success unless validate_entries

    build
    valid?
    result_profile = @profile.save
    @success = result_profile
  end

  def errors
    @profile.errors.messages
  end

  def valid?
    @profile.valid?
  end

  def validate_entries
    @work_group_id.present? && @title.present?
  end
end
