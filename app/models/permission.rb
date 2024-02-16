=begin
  a permissions migh be: 
    * create_user 
    * delete_user
    * update_user
    * create_profile
=end
class Permission < ApplicationRecord 
  self.table_name = 'permissions'
  belongs_to :access_permissions, class_name: 'AccessPermission'
end