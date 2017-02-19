class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.string :name
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.reference :user

      t.timestamps null: false
    end
  end
end
