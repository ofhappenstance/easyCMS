class CreateSectionEdits < ActiveRecord::Migration
  def change
    create_table :section_edits do |t|
      # alternative to t.integer "admin_user_id" , automatically adds the _id for us
      t.references :admin_user
      t.references :section
      t.string :summary
      t.timestamps
    end
    add_index :section_edits, ["admin_user_id", "section_id"]
  end
end
