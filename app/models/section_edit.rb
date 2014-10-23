class SectionEdit < ActiveRecord::Base
  # also ned to tell it that the foreign key it should look for is not related to editor
  belongs_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id"
  belongs_to :section

end
