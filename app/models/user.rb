class User < ApplicationRecord
  attr_accessor :remember_token

  has_many :tasks, dependent: :destroy
  has_secure_password
  scope :admins, -> { where(role: "admin") }

  validates_presence_of :name
  validates_uniqueness_of :name
  before_destroy :check_can_delete

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def admin?
    role == 'admin'
  end

  private

  def check_can_delete
    errors[:base] << "cannot delete submission that has already been paid"
    return false
  end
end
