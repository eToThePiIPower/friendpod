class User < ActiveRecord::Base
  acts_as_token_authenticatable
  acts_as_taggable_on :interests
  has_friendship

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def interest_list
    self.interests.join(', ')
  end

  def as_json(options = {  })
    h = super(options)
    h[:interests] = self.interest_list
    h
  end
end
