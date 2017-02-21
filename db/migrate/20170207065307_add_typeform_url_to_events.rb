class AddTypeformUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :typeform_url, :string
  end
end
