class AdminUser < ActiveRecord::Base

  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, :through => :section_edits

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  FORBIDDEN_USERNAMES = ['littlebopeep','humptydumpty','marymary']

  validates_presence_of :first_name
  validates_length_of :first_name, :maximum => 25
  validates_presence_of :last_name
  validates_length_of :last_name, :maximum => 50
  validates_presence_of :username
  validates_length_of :username, :within => 8..25
  validates_uniqueness_of :username
  validates_presence_of :email
  validates_length_of :email, :maximum => 100
  validates_format_of :email, :with => EMAIL_REGEX
  # that's going to add a virtual attribute I don't have a column for that on my table its going 
  # to add a virtual attribute called email_confirmation and then if that value is there.
  # It'll make sure that it matches my email, so if I ever on a form, say hey, I'd like them to, 
  # to re-enter this email address, then if it's there, it'll be checked. 
  # If it's not there, I take it off the form, it'll stop being checked, 
  # and it won't run this validation anymore. 
  validates_confirmation_of :email
    
end
