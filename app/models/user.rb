class User < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

end
