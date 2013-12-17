class User < ActiveRecord::Base
  has_many :created_challenges, :foreign_key => "creator_id", :class_name => "Challenge"
  has_many :challenges, :through => "user_challenges"
  has_many :scores, :through => "user_challenges"

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.username = "user#{user.provider}#{user.id}-#{user.uid}"
      user.save!
    end
  end
end
