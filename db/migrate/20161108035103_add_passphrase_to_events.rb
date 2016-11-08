class AddPassphraseToEvents < ActiveRecord::Migration
  def change
    add_column :events, :passphrase, :string
  end
end
