module Login
  class RememberUser
    def initialize(user)
      user.remember_token = get_token
      user.update( cookies_token: digest(user.remember_token) )
    end

    def get_token
      SecureRandom.urlsafe_base64
    end
    
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    
  end
end