class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :links, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :articles, through: :bookmarks

  # Make fields in DB readable as a hash
  serialize :sources_stats, Hash
  serialize :info, Hash
  serialize :like_data, Hash

  # Boolean to tell if user has just signed in
  attr_accessor :just_signed_up

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  # Declare what we want from a user's FB and retrieve this in a hash from Facebook
  # Then check if that user exists in our database - if not it creates a new user
  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name, :name) # Add any extra fields we want here (and migration)
    user_params[:facebook_picture_url] = auth.info.image # Used to rename image field returned by FB
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid) # Look for the user in our DB
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
      user.just_signed_up = true
    end

    return user
  end

  # Methods that the view can access to act on the user stats to display using HighCharts
  def self.most_fed_articles
    # Get arrays for the different axes
  end
end

