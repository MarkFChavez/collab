class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :projects, dependent: :destroy

  def self.from_omniauth(auth)
  	User.where(auth.slice(:provider, :uid)).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.name = auth.info.name
      user.image = auth.info.image
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
    end
  end

  def password_required?
    super && provider.blank?
  end

  def self.new_with_session(params, session)
  	if session["devise.user_attributes"]
  		new(session["devise.user_attributes"], without_protection: true) do |u|
  			u.attributes = params
  			u.valid?
  		end
  	else
  		super
  	end
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
