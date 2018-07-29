class User < ApplicationRecord
  has_many :likes
  has_many :comics
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter]



  validates_uniqueness_of :username
  validates_presence_of :username


  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["username = :value", { :value => username }]).first
    else
      where(conditions).first
    end
  end


  def email_required?
    false
  end

  def email_changed?
    false
  end


  def self.from_omniauth(auth)
    User.find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.username  = auth.info.nickname || auth.info.name
      user.image = auth.info.image
      user.email      = User.dummy_email(auth)
      user.password   = Devise.friendly_token[0, 20]
    end
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


  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
