class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  validates :fullname, presence: true, length: {maximum: 50}

  has_many :homes

  # This method pulls data from Facebook, to save to DB
  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first

    # If we find the user, then they are already signed up and we simply return them, otherwise
    # we will need to add their info into the DB and sign them up.
    if user
      return user
    else
      #before we throw them into the DB, we do an extra pre-caution, and check just in case the uid already
      # exists in the DB. The uid is an ID that facebook (the auth.provider) assigns. This would only be in the case
      # that someone changes their login email for example. We couldn't run this function right away, because not everyone
      # signed up with facebook, and may not all have a uid.
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.fullname = auth.info.name
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.image = auth.info.image
        user.password = Devise.friendly_token[0, 20]
      end
    end
  end

end
