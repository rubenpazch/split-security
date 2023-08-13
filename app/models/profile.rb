# frozen_string_literal: true

class Profile < ApplicationRecord
  self.table_name = 'profiles'
  belongs_to :user, class_name: 'User'
  belongs_to :work_group, class_name: 'WorkGroup'

  def operation
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
