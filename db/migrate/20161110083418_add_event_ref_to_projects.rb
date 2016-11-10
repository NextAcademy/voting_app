class AddEventRefToProjects < ActiveRecord::Migration
  def change
		add_reference :projects, :event, foreign_key: true
  end
end
