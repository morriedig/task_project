class User < ApplicationRecord
  has_many :tasks
  validates_presence_of :name, :password
  validates_uniqueness_of :name
end
