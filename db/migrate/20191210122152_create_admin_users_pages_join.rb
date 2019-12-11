class CreateAdminUsersPagesJoin < ActiveRecord::Migration[6.0]

  def up
    create_table :admin_users_pages, :id => false do |t|
      t.integer "admin_users_id"
      t.integer "page_id"
    end
    add_index("admin_users_pages", ["admin_users_id", "page_id"])
  end

  def down
    drop_table :admin_users_pages
  end

end