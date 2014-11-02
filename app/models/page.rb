class Page < ActiveRecord::Base

  belongs_to :subject 
  has_many :sections
  #OR has_many :sections, :dependent => destroy
  has_and_belongs_to_many :editors, :class_name => "AdminUser" 
  # much more semantic to use editor, just specify class name if configuring that table name

  #if giving table different name, have to specify on both many to many table
  # has_and_belongs_to_many :admin_users, :join_table => "super_users"

  acts_as_list :scope => :subject 

  # going to add this nice feature that says all right user. If you don't give me a permalink, that's okay. 
  # I'll invent one for you before we validate whether it's there or not,
  before_validation :add_default_permalink
  after_save :touch_subject
  # after_destroy :delete_related_sections

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  # use presence_of with length_of to disallow spaces
  validates_uniqueness_of :permalink
  # for unique values by subject use ":scope => :subject_id"

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("pages.position ASC") }
  scope :newest_first, lambda { order("pages.created_at DESC") }

  private

    def add_default_permalink
      if permalink.blank?
        # always a good idea any time you're setting an attribute in a model to use self.
        self.permalink = "#{id}-#{name.parameterize}" #parameterize will make string suitable for urls
      end
    end


    def touch_subject
      # touch is similar to:
      # subject.update_attribute(:updated_at, Time.now)
      #Any time this page is updated, lets also mark the subject 
      # as having been updated at the same time. That's what touch does for us. 
      subject.touch
    end

    # deleting a page would destroy all associated sections, optional choice feature
    # same thing as adding ":dependent => :destroy" to "has_many :sections" clause above
    def delete_related_sections
      self.sections.each do |section|
        # Or perhaps instead of destroy, you would
        # move them to a another page.
        section.destroy
      end
    end 

end
