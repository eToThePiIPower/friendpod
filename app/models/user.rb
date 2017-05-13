class User < ActiveRecord::Base
  acts_as_token_authenticatable
  acts_as_taggable_on :interests

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
