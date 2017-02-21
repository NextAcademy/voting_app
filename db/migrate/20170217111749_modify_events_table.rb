class ModifyEventsTable < ActiveRecord::Migration
  def change
    add_column :events, :typeform_report_url, :string
  end
end
