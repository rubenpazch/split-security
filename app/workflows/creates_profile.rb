# frozen_string_literal: true

class CreatesProfile
  attr_reader :profile, :success, :work_group, :is_active, :title, :is_root, :parent_id

  def initialize(args = {})
    @work_group = args[:work_group]
    @is_active = args[:is_active]
    @title = args[:title]
    @is_root = args[:is_root]
    @parent_id = args[:parent_id]
    @success = false
    @profile = Profile.new
    @errors = {}
  end

  def build
    return false unless validate_entries

    @profile.work_group = @work_group
    @profile.title = @title
    @profile.is_active = @is_active
    @profile.is_root = @is_root
    @profile.parent_id = @parent_id
  end

  def create
    build
    @success = @profile.save
  end

  def errors
    valid?
    @errors = @profile.errors.messages
  end

  def valid?
    build
    @profile.valid?
  end

  def validate_entries
    @errors.empty?
  end
end
