class User < ApplicationRecord
  has_many :tasks, dependent: :delete_all
  has_secure_password
  scope :admins, -> { where(role: "admin") }

  validates_presence_of :name
  validates_uniqueness_of :name
  before_destroy :check_can_delete

  private
  def check_can_delete
    errors[:base] << "cannot delete submission that has already been paid"
    return false
  end
end
