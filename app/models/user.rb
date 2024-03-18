class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable
  # blog :user
  # has_many :user
  has_many:articles, dependent: :destroy
  has_many:comments, dependent: :destroy
  # include ImageUploader::Attachment.new(:image_data)
  has_one_attached :image_data
  enum role: {
    user: 0,
    admin: 1,
    moderator: 2
  }


  #   validate :valid_email_domain

  #   def valid_email_domain
  #     # Assuming email is an attribute of the User model
  #     if email.present? && !email.end_with?('@gmail.com')  # Change '@example.com' to your desired domain
  #       errors.add(:email, 'must be from a valid domain')
  #     end
  #   end
  end
