class Subject < ActiveRecord::Base

  has_many :pages
  
  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }
  scope :sorted, lambda { order("subjects.position ASC") }
  scope :newest_first, lambda { order("subjects.created_at DESC") }
  scope :search, lambda {|query|
    where(["name LIKE ?", "%#{query}%"])
  } #the % means wildcard, ow when I call search with a search term, 
    #so that it will find query even if it exists as a sub-string.
    #it will look for a subject whose name has that search term somewhere in it.


end
