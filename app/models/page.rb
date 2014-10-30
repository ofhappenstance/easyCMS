class Page < ActiveRecord::Base

  belongs_to :subject 
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser" 
  # much more semantic to use editor, just specify class name if configuring that table name

  #if giving table different name, have to specify on both many to many table
  # has_and_belongs_to_many :admin_users, :join_table => "super_users"

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("pages.position ASC") }
  scope :newest_first, lambda { order("pages.created_at DESC") }

end
