class AddUuidAndNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :user_uuid, :uuid
    add_column :users, :access_token, :string
  end
end
