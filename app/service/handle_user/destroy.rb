module HandleUser
  class Destroy
    def initialize( user_id )
      User.transaction do
        user = User.find_by_id(user_id)
        user.destroy
        raise "delete false" if User.admins.length < 1
      end
    end
  end
end