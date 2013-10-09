class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
    add_index :memberships, :project_id
    add_index :memberships, :user_id
  end
end
