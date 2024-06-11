class RenameAdressesToAddresses < ActiveRecord::Migration[7.1]
  def change
    rename_table :adresses, :addresses
  end
end
