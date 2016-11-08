class AddUserRefToEvents < ActiveRecord::Migration
  def change
  	add_reference :events, :user, foreign_key: true
  end
end
