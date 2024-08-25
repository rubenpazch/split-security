module Factories
  module User
    class AuthorUserFactory < Abstracts::User
      def build
        author_user = Classes::AuthorUser.new
        # author_user.profile = Profile.find(1)
        # author_user.permissions = Permissions.find(1)
      end
    end
  end
end