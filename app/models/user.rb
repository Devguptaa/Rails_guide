class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable
  # blog :user
  # has_many :user
  after_commit :send_welcome_email
  after_commit :update_list
  private
    def send_welcome_email
    # Assuming welcome_email is a mailer method that sends the welcome email
      UserMailer.welcome_email(self).deliver_now
    end

    def user_data
      User.pluck
    end

    def update_list
      
    end

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

  def self.create_user_excel
    user_table = Spreadsheet::Workbook.new
    sheet = user_table.create_worksheet :name => "New Work Sheet"
    user_list=User.pluck(:name,:email,:gender,:role)
    sheet.row(0).replace(["Name","Email","Gender","Role"])
    user_list.each_with_index{
      |u,i|
      sheet.row(i+1).replace(u)
    }
    user_table.write('/home/devgupta/Blog_Retrieve/Rails_guide-main/app/assets/excel/user_list.xls')
  end
end
