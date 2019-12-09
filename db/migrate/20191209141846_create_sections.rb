class CreateSections < ActiveRecord::Migration[6.0]

  def up
    create_table :sections do |t|
      t.integer "page_id"
      t.string "name"
      t.integer "position"
      t.boolean "visible"
      t.string "context_type", :limit => 50
      t.text "content"

      t.timestamps
    end
    add_index("sections", "page_id")
  end

  def down
    drop_table :sections
  end
end
