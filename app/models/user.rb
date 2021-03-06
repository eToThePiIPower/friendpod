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

  def gravatar
    gravatar_id = Digest::MD5.hexdigest(self.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
  end

  def censored_email
    self.email.first + "*"*7 + "@" + "*"*5 + self.email.last
  end
end
