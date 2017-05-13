class User < ActiveRecord::Base
  acts_as_token_authenticatable
  acts_as_taggable_on :interests

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def as_json(options = {  })
    h = super(options)
    h[:interests] = self.interest_list
    h
  end
end
