# frozen_string_literal: true
#
#
#
=begin
 a profile might be : 
  * administrator
  * admin
  * author
  * regular_user 
  * super_admin
  * custom_profile
=end

class Profile < ApplicationRecord
  self.table_name = 'profiles'
  belongs_to :user, class_name: 'User'
  belongs_to :work_group, class_name: 'WorkGroup'
  belongs_to :access_permissions, class_name: 'AccessPermission'
end
