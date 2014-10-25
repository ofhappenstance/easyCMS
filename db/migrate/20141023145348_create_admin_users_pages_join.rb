class CreateAdminUsersPagesJoin < ActiveRecord::Migration
  def up
    # important to exclude the default primary key 
    create_table :admin_users_pages, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "page_id"
    end
    # remember we always want to index foreign keys to make look-ups faster 
    # passing it an array to create an index on both columns together
    add_index :admin_users_pages, ["admin_user_id", "page_id"]
  end

  def down
    drop_table :admin_users_pages
  end
end
