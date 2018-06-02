class User < ApplicationRecord
  has_many :likes
  has_many :comics
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]


  def self.from_omniauth(auth)
    find_or_create_by(
        uid:      auth.uid,
        provider: auth.provider,
        username: auth.info.nickname,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end


end
