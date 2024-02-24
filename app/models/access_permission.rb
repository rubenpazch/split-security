# frozen_string_literal: true

#   a acess_permission might be
#     * Profile(Administrator) is related to Permission(user_creation, user_deletion, user_update)
#       * an administrator can create a user
#       * an administrator can delete a user
#       * an administrator can update a user
class AccessPermission < ApplicationRecord
  self.table_name = 'access_permissions'
  has_many :permissions, class_name: 'Permission'
  has_many :profiles, class_name: 'Profile'
end
