module Logout
  class ForgetUser
    def initialize(user)
      user.update_attribute(:cookies_token, nil)
    end
  end
end