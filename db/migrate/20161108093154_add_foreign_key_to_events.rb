class AddForeignKeyToEvents < ActiveRecord::Migration
  def change
  	add_foreign_key :events, :users
  end
end
